
instance DIA_BUSTER_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_exit_condition;
	information = dia_buster_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_buster_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_HELLO(C_INFO)
{
	npc = sld_802_buster;
	nr = 1;
	condition = dia_buster_hello_condition;
	information = dia_buster_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_buster_hello_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_LOST) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_buster_hello_info()
{
	AI_Output(self,other,"DIA_Buster_Hello_13_00");	//Kohopak to tady máme? Neznám tì odnìkud?
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Když myslíš. Jsem na cestì za statkáøem.",dia_buster_hello_goingtofarm);
	Info_AddChoice(dia_buster_hello,"Kdo se ptá?",dia_buster_hello_whoareyou);
};

func void dia_buster_hello_whoareyou()
{
	AI_Output(other,self,"DIA_Buster_Hello_WhoAreYou_15_00");	//Kdo se ptá?
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_01");	//Jsem Buster, jeden z Leeových žoldnéøù!
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_02");	//A TY bys ke mnì mìl být trošku zdvoøilejší, nebo toho budeš litovat!
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_03");	//Dobrá, co tady chceš?
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Do toho ti nic není.",dia_buster_hello_notyourbusiness);
	Info_AddChoice(dia_buster_hello,"Leeho znám!",dia_buster_hello_iknowlee);
	Info_AddChoice(dia_buster_hello,"Jsem pouhým poutníkem, který by si rád promluvil s hostinským.",dia_buster_hello_goingtofarm);
};

func void dia_buster_hello_iknowlee()
{
	AI_Output(other,self,"DIA_Buster_Hello_IKnowLee_15_00");	//Leeho znám!
	AI_Output(self,other,"DIA_Buster_Hello_IKnowLee_13_01");	//Leeho zná každý! To nic neznamená, kámo. Zrovna teï mluvíš SE MNOU!
	AI_Output(self,other,"DIA_Buster_Hello_IKnowLee_13_02");	//Takže, kam máš namíøeno?
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Do toho ti nic není.",dia_buster_hello_notyourbusiness);
	Info_AddChoice(dia_buster_hello,"Jsem pouhým poutníkem, který by si rád promluvil s hostinským.",dia_buster_hello_goingtofarm);
};

func void dia_buster_hello_notyourbusiness()
{
	AI_Output(other,self,"DIA_Buster_Hello_NotYourBusiness_15_00");	//Do toho ti nic není.
	AI_Output(self,other,"DIA_Buster_Hello_NotYourBusiness_13_01");	//Takhle se mnou nikdo mluvit nebude, ty èerve! Øekl bych, že je èas na poøádnou nakládaèku.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_buster_hello_goingtofarm()
{
	AI_Output(other,self,"DIA_Buster_Hello_GoingToFarm_15_00");	//Když myslíš. Jsem na cestì za statkáøem.
	AI_Output(self,other,"DIA_Buster_Hello_GoingToFarm_13_01");	//Vážnì... Hm - nepøijdeš mi nìjak zvláš nebezpeèný.
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Chceš se pøesvìdèit",dia_buster_hello_wannatestit);
	Info_AddChoice(dia_buster_hello,"Jednou nebo dvakrát jsem zabil nìjakou pøíšeru.",dia_buster_hello_slewbeasts);
	Info_AddChoice(dia_buster_hello,"To máš pravdu.",dia_buster_hello_imnodanger);
};

func void dia_buster_hello_imnodanger()
{
	AI_Output(other,self,"DIA_Buster_Hello_ImNoDanger_15_00");	//To máš pravdu.
	AI_Output(self,other,"DIA_Buster_Hello_ImNoDanger_13_01");	//(samolibì) Jo, za ty roky se nauèíš si takových vìcí všímat, kámo.
	AI_Output(self,other,"DIA_Buster_Hello_ImNoDanger_13_02");	//V jednom kuse tady bojujeme se skøety. Nebo strážemi z mìsta. Teda, jsou to pìknì neodbytní prevíti, to teda jo. (zasmìje se)
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Myslíš SKUTEÈNÉ skøety? Ty velké potvory?",dia_buster_hello_realorcs);
	Info_AddChoice(dia_buster_hello,"Takže?",dia_buster_hello_sowhat);
	Info_AddChoice(dia_buster_hello,"Pùsobivé.",dia_buster_hello_impressive);
};

func void dia_buster_hello_slewbeasts()
{
	AI_Output(other,self,"DIA_Buster_Hello_SlewBeasts_15_00");	//Jednou nebo dvakrát jsem zabil nìjakou pøíšeru.
	AI_Output(self,other,"DIA_Buster_Hello_SlewBeasts_13_01");	//Ha! (zasmìje se) Nejspíš jsi v poli rozšlápnul pár broukù a vyhnal nìkolik krys z jejich nor.
	AI_Output(self,other,"DIA_Buster_Hello_SlewBeasts_13_02");	//Tady nám jdou po krku skøeti! Jo, a ta mizerná mìstská stráž. (výsmìšnì se zasmìje)
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Myslíš SKUTEÈNÉ skøety? Ty velké potvory?",dia_buster_hello_realorcs);
	Info_AddChoice(dia_buster_hello,"Takže?",dia_buster_hello_sowhat);
	Info_AddChoice(dia_buster_hello,"Pùsobivé.",dia_buster_hello_impressive);
};

func void dia_buster_hello_wannatestit()
{
	AI_Output(other,self,"DIA_Buster_Hello_WannaTestIt_15_00");	//Chceš se pøesvìdèit
	AI_Output(self,other,"DIA_Buster_Hello_WannaTestIt_13_01");	//Božíèku! Vybral jsem si špatného otloukánka, co?
	AI_Output(other,self,"DIA_Buster_Hello_WannaTestIt_15_02");	//Dalo by se to tak øíct.
	AI_Output(self,other,"DIA_Buster_Hello_WannaTestIt_13_03");	//Tak pojï, ukaž mi, co v tobì je.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_buster_hello_impressive()
{
	AI_Output(other,self,"DIA_Buster_Hello_Impressive_15_00");	//Pùsobivé.
	AI_Output(self,other,"DIA_Buster_Hello_Impressive_13_01");	//(zasmìje se) To je naše živnost, chlapèe! Dokonce si dìláme vlastní zbranì a brnìní!
	AI_Output(self,other,"DIA_Buster_Hello_Impressive_13_02");	//Vysmíváme se smrti den co den. Ale o nìèem takovém nemá vesnický balík jako ty ani zdání.
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Asi ti budu muset ukázat, jak velké ponìtí o tom mám!",dia_buster_hello_letmeshowyou);
	Info_AddChoice(dia_buster_hello,"Když to øíkáš...",dia_buster_hello_ifyousayso);
};

func void dia_buster_hello_ifyousayso()
{
	AI_Output(other,self,"DIA_Buster_Hello_IfYouSaySo_15_00");	//Když to øíkáš...
	AI_Output(self,other,"DIA_Buster_Hello_IfYouSaySo_13_01");	//(se znudìným zavrèením) Mazej, strašpytle!
	AI_StopProcessInfos(self);
};

func void dia_buster_hello_letmeshowyou()
{
	AI_Output(other,self,"DIA_Buster_Hello_LetMeShowYou_15_00");	//Asi ti budu muset ukázat, jak velké ponìtí o tom mám!
	AI_Output(self,other,"DIA_Buster_Hello_LetMeShowYou_13_01");	//To má být jednomužné rolnické povstání, nebo co?
	AI_Output(self,other,"DIA_Buster_Hello_LetMeShowYou_13_02");	//Tak dobrá, ukaž mi, co v tobì je.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_buster_hello_sowhat()
{
	AI_Output(other,self,"DIA_Buster_Hello_SoWhat_15_00");	//Takže?
	AI_Output(self,other,"DIA_Buster_Hello_SoWhat_13_01");	//(odfrkne si) Jako bys vìdìl, o èem to tady mluvím. Myslíš si, bùhvíjak nejsi silný, co?
	AI_Output(self,other,"DIA_Buster_Hello_SoWhat_13_02");	//(rozzlobenì) Možná je na èase, aby ti nìkdo uštìdøil lekci!
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Kdykoliv!",dia_buster_hello_whenever);
	Info_AddChoice(dia_buster_hello,"Dìlám si srandu ...",dia_buster_hello_justjoking);
};

func void dia_buster_hello_realorcs()
{
	AI_Output(other,self,"DIA_Buster_Hello_RealOrcs_15_00");	//Myslíš SKUTEÈNÉ skøety? Ty velké potvory?
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_01");	//(povzdychne si) Já jenom... Poèkat! Chceš si ze mì utahovat?
	AI_Output(other,self,"DIA_Buster_Hello_RealOrcs_15_02");	//(s úsmìvem) To vùbec ne.
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_03");	//Ty èerve! (neèekanì agresivnì) Nedáš jinak, co?
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_04");	//Tak pojï a ukaž, co v tobì je, ty hrdino!
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Kdykoliv!",dia_buster_hello_whenever);
	Info_AddChoice(dia_buster_hello,"Dìlám si srandu ...",dia_buster_hello_justjoking);
};

func void dia_buster_hello_whenever()
{
	AI_Output(other,self,"DIA_Buster_Hello_Whenever_15_00");	//Kdykoliv!
	AI_Output(self,other,"DIA_Buster_Hello_Whenever_13_01");	//Tak pojï blíž, kámo!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_buster_hello_justjoking()
{
	AI_Output(other,self,"DIA_Buster_Hello_JustJoking_15_00");	//Dìlám si srandu.
	AI_Output(self,other,"DIA_Buster_Hello_JustJoking_13_01");	//No jo, jasnì, zastrè drápky! Jdi mi z oèí!
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_FIGHTNONE(C_INFO)
{
	npc = sld_802_buster;
	nr = 1;
	condition = dia_buster_fightnone_condition;
	information = dia_buster_fightnone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_buster_fightnone_condition()
{
	if(Npc_KnowsInfo(other,dia_buster_hello) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_buster_fightnone_info()
{
	AI_Output(self,other,"DIA_Buster_FightNone_13_00");	//Co chceš, strašpytle?
};


instance DIA_BUSTER_DUELL(C_INFO)
{
	npc = sld_802_buster;
	nr = 3;
	condition = dia_buster_duell_condition;
	information = dia_buster_duell_info;
	permanent = TRUE;
	description = "Vyzívám tì k souboji!";
};


func int dia_buster_duell_condition()
{
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_LOST)
	{
		return TRUE;
	};
};

func void dia_buster_duell_info()
{
	AI_Output(other,self,"DIA_Buster_Duell_15_00");	//Vyzívám tì k souboji!
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE)
	{
		AI_Output(self,other,"DIA_Buster_Duell_13_01");	//Ha ha! Nechceš to nechat jen tak, co? Tak dobrá - pojï sem!
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_Duell_13_02");	//Chceš to zkusit znovu? Otravo mizernej - dobrá, pojï sem!
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_CANCEL)
		{
			AI_Output(self,other,"DIA_Buster_Duell_13_03");	//Ale už podruhé neutíkej!
		};
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_BUSTER_WANNAJOIN(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_wannajoin_condition;
	information = dia_buster_wannajoin_info;
	permanent = TRUE;
	description = "Chci se pøidat k žoldnéøùm!";
};


func int dia_buster_wannajoin_condition()
{
	if((other.guild == GIL_NONE) && (BUSTER_DUELL == FALSE))
	{
		return TRUE;
	};
};

func void dia_buster_wannajoin_info()
{
	AI_Output(other,self,"DIA_Buster_WannaJoin_15_00");	//Chci se pøidat k žoldnéøùm!
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON) || (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST))
	{
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_01");	//Každý, kdo má ránu tvrdou jako ty, by tady nemìl mít žádné problémy.
		}
		else
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_02");	//Nejsi zrovna nejlepší bojovník, ale odvaha ti rozhodnì nechybí.
		};
		AI_Output(self,other,"DIA_Buster_WannaJoin_13_03");	//Mùj hlas tady moc neznamená, protože jsem tady dlouho nebyl, ale až se mì Lee zeptá, budu hlasovat pro tebe.
		BUSTER_DUELL = TRUE;
		Log_CreateTopic(TOPIC_SLDRESPEKT,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SLDRESPEKT,LOG_RUNNING);
		b_logentry(TOPIC_SLDRESPEKT,"Když jsem Bustera porazil, nebude mi už bránit v cestì žoldnéøských øad.");
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_WannaJoin_13_04");	//Ty? Nevzpomínám si, že by k žoldnéøùm kdy pøijali nìjakého sraba.
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_CANCEL)
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_05");	//Utíkat ze souboje - s tím se tady moc daleko nedostaneš!
		};
	};
};


var int buster_sentenzatip;

instance DIA_BUSTER_OTHERSLD(C_INFO)
{
	npc = sld_802_buster;
	nr = 1;
	condition = dia_buster_othersld_condition;
	information = dia_buster_othersld_info;
	permanent = FALSE;
	description = "Rád bych se dozvìdìl nìco o žoldnéøích a zdejším okolí.";
};


func int dia_buster_othersld_condition()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_buster_othersld_info()
{
	AI_Output(other,self,"DIA_Buster_OtherSld_15_00");	//Rád bych se dozvìdìl nìco o žoldnéøích a zdejším okolí.
	AI_Output(self,other,"DIA_Buster_OtherSld_13_01");	//O okolí ti toho moc nepovím. Na to by ses mìl radìji zeptat farmáøù.
	AI_Output(self,other,"DIA_Buster_OtherSld_13_02");	//A co se týèe nás žoldnéøù - máme jedno velice jednoduché pravidlo: jestli dokážeš neustoupit, mùžeš mezi nás.
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Buster_OtherSld_13_03");	//Myslím, že jsi pøesnì z toho materiálu, který potøebujeme.
		AI_Output(self,other,"DIA_Buster_OtherSld_13_04");	//Ale ne, aby ti to stouplo do hlavy, že jsi mìl v našem posledním souboji štìstí.
		AI_Output(self,other,"DIA_Buster_OtherSld_13_05");	//Na farmì je spousta hochù, kteøí jsou o chloupek lepší než já.
		AI_Output(self,other,"DIA_Buster_OtherSld_13_06");	//Sentenza, napøíklad. Hlídá vstup na farmu. A se dìje co se dìje, s ním se do køížku nepouštìj.
		BUSTER_SENTENZATIP = TRUE;
	}
	else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
	{
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_OtherSld_13_07");	//Ale proè to vlastnì øíkám takovému zbabìlci!
		AI_StopProcessInfos(self);
	};
};


var int buster_goldzumbrennen;
var int buster_bonus;

instance DIA_BUSTER_ABOUTSENTENZA(C_INFO)
{
	npc = sld_802_buster;
	nr = 1;
	condition = dia_buster_aboutsentenza_condition;
	information = dia_buster_aboutsentenza_info;
	permanent = FALSE;
	description = "Co s tím Sentenzou?";
};


func int dia_buster_aboutsentenza_condition()
{
	if(BUSTER_SENTENZATIP == TRUE)
	{
		return TRUE;
	};
};

func void dia_buster_aboutsentenza_info()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_15_00");	//Co s tím Sentenzou?
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_01");	//Až pøijdeš na farmu, pokusí se z tebe vymáèknout nìjaké peníze - to dìlá všem nováèkùm.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_02");	//A být na tvém místì, tak bych zaplatil. Sám jsem to svého èasu udìlal. Dobré bylo, že mi pak dal svùj hlas.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_03");	//Øíká, že jedna laskavost vyžaduje druhou. Tenkrát jsem tak pøišel o všechny své peníze, ale nebylo to vlastnì až tak moc. A nakonec jsem byl rád, že to tak dopadlo.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_04");	//Ve chvíli, když jsem vidìl, jak zmlátil maníka, který se rozhodl NEZAPLATIT.
	AI_Output(other,self,"DIA_Buster_AboutSentenza_15_05");	//Díky za radu.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_06");	//Rádo se stalo. Má pro tebe nìjakou cenu?
	Info_ClearChoices(dia_buster_aboutsentenza);
	Info_AddChoice(dia_buster_aboutsentenza,"Ne.",dia_buster_aboutsentenza_no);
	Info_AddChoice(dia_buster_aboutsentenza,"Tady máš - 5 zlatých.",dia_buster_aboutsentenza_give);
};

func void dia_buster_aboutsentenza_give()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_Give_15_00");	//Tady máš - 5 zlatých.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_Give_13_01");	//Díky, chlape. Zdá se, že si veèer budu moc dát pár korbelù. Na to nezapomenu.
	BUSTER_GOLDZUMBRENNEN = TRUE;
	BUSTER_BONUS = 50;
	Info_ClearChoices(dia_buster_aboutsentenza);
};

func void dia_buster_aboutsentenza_no()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_No_15_00");	//Ne.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_No_13_01");	//Myslel jsem si to.
	Info_ClearChoices(dia_buster_aboutsentenza);
};


instance DIA_BUSTER_LEELEADER(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_leeleader_condition;
	information = dia_buster_leeleader_info;
	permanent = FALSE;
	description = "Lee je šéf žoldnéøù, ne?";
};


func int dia_buster_leeleader_condition()
{
	if(BUSTER_DUELL == TRUE)
	{
		return TRUE;
	};
};

func void dia_buster_leeleader_info()
{
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_00");	//Lee je šéf žoldnéøù, ne?
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_01");	//Pøesnì tak - hej, už jsem si vzpomnìl, odkud tì znám! Tys byl také v kolonii.
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_02");	//(s povzdychem) To jsem byl.
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_03");	//Nevidìl jsem tì, když došlo k tomu velkému tøesku. Ani hodnou chvíli pøedtím.
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_04");	//Mìl jsem jiné starosti.
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_05");	//Tos o hodnì pøišel - co jsme byli v lochu, tak se dost vìcí zmìnilo.
};


instance DIA_BUSTER_WHATHAPPENED(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_whathappened_condition;
	information = dia_buster_whathappened_info;
	permanent = FALSE;
	description = "Co se stalo se žoldnéøi v kolonii?";
};


func int dia_buster_whathappened_condition()
{
	if(Npc_KnowsInfo(other,dia_buster_leeleader) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_buster_whathappened_info()
{
	AI_Output(other,self,"DIA_Buster_WhatHappened_15_00");	//Co se stalo se žoldnéøi v kolonii?
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_01");	//Jakmile bariéra padla, vyvedl nás Lee z kolonie. Øíkal, že když budeme držet pohromadì, tak se nám nic nestane. A mìl pravdu.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_02");	//Netrvalo dlouho a našli jsme si tady hezké místeèko. Statkáø nám platí, abychom zametali s domobranou z mìsta.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_03");	//A vìtšina z nás by do toho šla dobrovolnì i zadarmo.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_04");	//Ale Onar nám dává jídlo a aspoò tak mùžeme nìjak zabít èas, než se naskytne nìjaká pøíležitost pláchnout z tohohle mizerného ostrova.
};


instance DIA_BUSTER_TEACH(C_INFO)
{
	npc = sld_802_buster;
	nr = 8;
	condition = dia_buster_teach_condition;
	information = dia_buster_teach_info;
	permanent = TRUE;
	description = "Mùžeš mì nauèit, jak lépe bojovat?";
};


func int dia_buster_teach_condition()
{
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) <= 60)
	{
		return TRUE;
	};
};

func void dia_buster_teach_info()
{
	AI_Output(other,self,"DIA_Buster_Teach_15_00");	//Mùžeš mì nauèit, jak lépe bojovat?
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Buster_Teach_13_01");	//Možná bych ti mohl dát jednu dvì rady.
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_Teach_13_02");	//Nejsi tak tupý, jak vypadáš. Dobrá, nauèím tì, co vím. Pak možná proti mnì budeš mít nìjakou šanci.
	};
	if(BUSTERLOG == FALSE)
	{
		Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTEACHER,"Buster mì nauèí, jak bojovat jednoruèními zbranìmi.");
		BUSTERLOG = TRUE;
	};
	Info_ClearChoices(dia_buster_teach);
	Info_AddChoice(dia_buster_teach,DIALOG_BACK,dia_buster_teach_back);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_buster_teach_1h_1);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_buster_teach_1h_5);
};

func void dia_buster_teach_back()
{
	Info_ClearChoices(dia_buster_teach);
};

func void dia_buster_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,60);
	Info_ClearChoices(dia_buster_teach);
	Info_AddChoice(dia_buster_teach,DIALOG_BACK,dia_buster_teach_back);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_buster_teach_1h_1);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_buster_teach_1h_5);
};

func void dia_buster_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,60);
	Info_ClearChoices(dia_buster_teach);
	Info_AddChoice(dia_buster_teach,DIALOG_BACK,dia_buster_teach_back);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_buster_teach_1h_1);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_buster_teach_1h_5);
};


instance DIA_BUSTER_KAP3_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_kap3_exit_condition;
	information = dia_buster_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_buster_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_SHADOWBEASTS(C_INFO)
{
	npc = sld_802_buster;
	nr = 30;
	condition = dia_buster_shadowbeasts_condition;
	information = dia_buster_shadowbeasts_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_buster_shadowbeasts_condition()
{
	if(((KAPITEL == 3) || (KAPITEL == 4)) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void b_dia_buster_shadowbeasts_ok()
{
	AI_StopProcessInfos(self);
};

func void dia_buster_shadowbeasts_info()
{
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_00");	//Hej, ty, chlapèe!
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_15_01");	//Co chceš?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_02");	//Posledních pár dní jsem pøemýšlel, jak v téhle díøe pøijít k nìjakým snadným penìzùm.
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_15_03");	//A?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_04");	//Myslím, že jsem pøišel na to, jak nìjaké prachy získat.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_05");	//Jeden kupec z mìsta vyklopí za jistou vìc pìknej balík.
	Info_ClearChoices(dia_buster_shadowbeasts);
	Info_AddChoice(dia_buster_shadowbeasts,"Co je to za kupce, o kterém mluvíš?",dia_buster_shadowbeasts_wer);
	Info_AddChoice(dia_buster_shadowbeasts,"O co jde?",dia_buster_shadowbeasts_was);
	Info_AddChoice(dia_buster_shadowbeasts,"Proè mi to øíkáš?",dia_buster_shadowbeasts_ich);
};

func void dia_buster_shadowbeasts_ich()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_ich_15_00");	//Proè mi to øíkáš?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_ich_13_01");	//Nemùžu do toho jít sám. Musím zùstat tady a dávat pozor na ty pitomé ovce.
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_ich_15_02");	//Myslíš farmáøe.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_ich_13_03");	//No vždy.
};

func void dia_buster_shadowbeasts_was()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_15_00");	//O co jde?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_13_01");	//Ten kupec tvrdí, že by mohl na trhu velice dobøe zpenìžit rohy stínové šelmy.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_13_02");	//Nìkdo bude muset jít do lesa a ty stvùry pokosit. A to je právì práce pro tebe.
	Info_AddChoice(dia_buster_shadowbeasts,"Kolik z toho kouká?",dia_buster_shadowbeasts_was_wieviel);
};

func void dia_buster_shadowbeasts_was_wieviel()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_wieviel_15_00");	//Kolik z toho kouká?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_wieviel_13_01");	//Balík penìz, to ti povídám. Bude dost pro nás pro oba.
	if(BUSTER_GOLDZUMBRENNEN == TRUE)
	{
		AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_wieviel_13_02");	//A protože jsi mi tenkrát pøinesl to zlato, udìlám ti zvláštní cenu.
	};
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_wieviel_15_03");	//To zní dobøe! Dám ti vìdìt, až budu mít nìjaké ty rohy.
	MIS_BUSTER_KILLSHADOWBEASTS_DJG = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BUSTER_KILLSHADOWBEASTS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BUSTER_KILLSHADOWBEASTS,LOG_RUNNING);
	b_logentry(TOPIC_BUSTER_KILLSHADOWBEASTS,"Buster mi nabídl dobrou cenu za každý roh stínové šelmy, který mu pøinesu.");
	Info_ClearChoices(dia_buster_shadowbeasts);
};

func void dia_buster_shadowbeasts_wer()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_wer_15_00");	//Co je to za kupce, o kterém mluvíš?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_wer_13_01");	//Tak to ne, kámo. Byl bych vážnì pitomec, kdybych ti prozradil svùj zdroj. Chceš mì snad podfouknout?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_wer_13_02");	//Buï se dohodneš SE MNOU, nebo vùbec. Kapišto?
};


instance DIA_BUSTER_BRINGTROPHYSHADOWBEAST(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_bringtrophyshadowbeast_condition;
	information = dia_buster_bringtrophyshadowbeast_info;
	permanent = TRUE;
	description = "K tìm rohùm stínové šelmy...";
};


func int dia_buster_bringtrophyshadowbeast_condition()
{
	if((MIS_BUSTER_KILLSHADOWBEASTS_DJG == LOG_RUNNING) && (Npc_HasItems(other,itat_shadowhorn) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE)) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};


var int bustertrophyshadowbeastcounter;

func void dia_buster_bringtrophyshadowbeast_info()
{
	var int bustertrophyshadowbeastcount;
	var int xp_bringbustertrophyshadowbeast;
	var int xp_bringbustertrophyshadowbeasts;
	var int bustersbustertrophyshadowbeastoffer;
	var int bustertrophyshadowbeastgeld;
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_00");	//Mùj kupec nám dal sbohem.
		AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_01");	//Co to má znamenat?
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_02");	//Je mrtvý. Klidnì si ty rohy nech. Stejnì nevím, co bych s nimi teï dìlal.
		MIS_BUSTER_KILLSHADOWBEASTS_DJG = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
	}
	else if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE)
	{
		AI_Output(other,self,"DIA_Buster_ANIMALTROPHYSHADOWBEAST_15_03");	//Jak mám vykuchat stínovou šelmu?
		AI_Output(self,other,"DIA_Buster_ANIMALTROPHYSHADOWBEAST_13_04");	//Ty to nevíš? Teda chlape, èekal jsem od tebe víc.
		Info_ClearChoices(dia_buster_bringtrophyshadowbeast);
		Info_AddChoice(dia_buster_bringtrophyshadowbeast,"Pak se k tobì vrátím.",dia_buster_bringtrophyshadowbeast_back);
		Info_AddChoice(dia_buster_bringtrophyshadowbeast,b_buildlearnstring("Uè mì.",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_SHADOWHORN)),dia_buster_bringtrophyshadowbeast_teach);
	}
	else
	{
		bustertrophyshadowbeastcount = Npc_HasItems(other,itat_shadowhorn);
		xp_bringbustertrophyshadowbeast = shadowbeast.level * XP_PER_VICTORY;
		bustersbustertrophyshadowbeastoffer = VALUE_SHADOWHORN + BUSTER_BONUS;
		if(bustertrophyshadowbeastcount == 1)
		{
			AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_05");	//Mám pro tebe roh stínové šelmy.
			b_giveplayerxp(xp_bringbustertrophyshadowbeast);
			b_giveinvitems(other,self,itat_shadowhorn,1);
			BUSTERTROPHYSHADOWBEASTCOUNTER = BUSTERTROPHYSHADOWBEASTCOUNTER + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_06");	//Mám pro tvého kupce pár dalších rohù stínové šelmy.
			b_giveinvitems(other,self,itat_shadowhorn,bustertrophyshadowbeastcount);
			xp_bringbustertrophyshadowbeasts = bustertrophyshadowbeastcount * xp_bringbustertrophyshadowbeast;
			BUSTERTROPHYSHADOWBEASTCOUNTER = BUSTERTROPHYSHADOWBEASTCOUNTER + bustertrophyshadowbeastcount;
			b_giveplayerxp(xp_bringbustertrophyshadowbeasts);
		};
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_07");	//Skvìlé. Ukaž. A pøines jich víc. Kdo ví, jak dlouho bude ten kupec tyhle vìci ještì chtít.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_08");	//Tady je tvùj podíl.
		bustertrophyshadowbeastgeld = bustertrophyshadowbeastcount * bustersbustertrophyshadowbeastoffer;
		CreateInvItems(self,itmi_gold,bustertrophyshadowbeastgeld);
		b_giveinvitems(self,other,itmi_gold,bustertrophyshadowbeastgeld);
	};
};

func void dia_buster_bringtrophyshadowbeast_teach()
{
	AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_teach_15_00");	//Uè mì.
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_SHADOWHORN))
	{
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_01");	//Tak poslouchej. Zabiješ stínovou šelmu a pak ji pravou rukou chytíš co nejpevnìji za roh.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_02");	//Potom zarazíš nùž do jejího èela a kolem rohu vyøízneš žlábek.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_03");	//Nùž potom použiješ jako páku, roh odlomíš a dáš si ho do kapsy.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_04");	//No. A pak mi ho pøineseš. To by pro tebe nemìlo být až tak tìžké.
	};
	Info_ClearChoices(dia_buster_bringtrophyshadowbeast);
};

func void dia_buster_bringtrophyshadowbeast_back()
{
	AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_back_15_00");	//Pak se k tobì vrátím.
	AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_back_13_01");	//To doufám.
	Info_ClearChoices(dia_buster_bringtrophyshadowbeast);
};


instance DIA_BUSTER_KAP4_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_kap4_exit_condition;
	information = dia_buster_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_buster_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_PERM4(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_perm4_condition;
	information = dia_buster_perm4_info;
	permanent = TRUE;
	description = "Co si myslíš o celé té drakobijecké záležitosti?";
};


func int dia_buster_perm4_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_buster_perm4_info()
{
	AI_Output(other,self,"DIA_Buster_Perm4_15_00");	//Co si myslíš o celé té drakobijecké záležitosti?
	AI_Output(self,other,"DIA_Buster_Perm4_13_01");	//Hoši by z toho mohli vytøískat docela dost zlata - pokud døív nezaklepou baèkorama.
	AI_Output(self,other,"DIA_Buster_Perm4_13_02");	//Já osobnì se radši držím Leeho.
};


instance DIA_BUSTER_KAP5_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_kap5_exit_condition;
	information = dia_buster_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_buster_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_KAP6_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_kap6_exit_condition;
	information = dia_buster_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_buster_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_PICKPOCKET(C_INFO)
{
	npc = sld_802_buster;
	nr = 900;
	condition = dia_buster_pickpocket_condition;
	information = dia_buster_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_buster_pickpocket_condition()
{
	return c_beklauen(34,60);
};

func void dia_buster_pickpocket_info()
{
	Info_ClearChoices(dia_buster_pickpocket);
	Info_AddChoice(dia_buster_pickpocket,DIALOG_BACK,dia_buster_pickpocket_back);
	Info_AddChoice(dia_buster_pickpocket,DIALOG_PICKPOCKET,dia_buster_pickpocket_doit);
};

func void dia_buster_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_buster_pickpocket);
};

func void dia_buster_pickpocket_back()
{
	Info_ClearChoices(dia_buster_pickpocket);
};

