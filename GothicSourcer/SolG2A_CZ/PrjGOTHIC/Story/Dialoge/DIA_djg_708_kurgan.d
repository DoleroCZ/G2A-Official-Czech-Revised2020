
instance DIA_KURGAN_EXIT(C_INFO)
{
	npc = djg_708_kurgan;
	nr = 999;
	condition = dia_kurgan_exit_condition;
	information = dia_kurgan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kurgan_exit_condition()
{
	return TRUE;
};

func void dia_kurgan_exit_info()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(biff,400);
};


instance DIA_KURGAN_HELLO(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_hello_condition;
	information = dia_kurgan_hello_info;
	important = TRUE;
};


func int dia_kurgan_hello_condition()
{
	return TRUE;
};

func void dia_kurgan_hello_info()
{
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_00");	//Hej, ty! Chlápci jako ty by si mìli dávat pozor, kam šlapou.
	AI_Output(other,self,"DIA_Kurgan_HELLO_15_01");	//Co se mi to pokoušíš øíct?
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_02");	//Chtìl jsem tím øíct, že zdejší ovzduší není prospìšné tvému zdraví. Tahle oblast je teï prolezlá skøety a dalšíma zrùdama.
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_03");	//A to nepoèítám draky. Ber to jen jako dobøe mínìnou radu.
	b_logentry(TOPIC_DRAGONHUNTER,"U vchodu do Hornického údolí mì pøivítala skupina drakobijcù. Byli tìžce ozbrojení, ale obávám se, že na draky tím moc velký dojem neudìlají.");
};


instance DIA_KURGAN_ELSE(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_else_condition;
	information = dia_kurgan_else_info;
	description = "Mùžeš mi øíct nìco, co už bych dávno nevìdìl?";
};


func int dia_kurgan_else_condition()
{
	return TRUE;
};

func void dia_kurgan_else_info()
{
	AI_Output(other,self,"DIA_Kurgan_ELSE_15_00");	//Mùžeš mi øíct nìco, co už bych dávno nevìdìl?
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_01");	//Mùžu ti dát dobrou radu, a to dokonce zdarma.
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_02");	//Nemùžem tu potøebovat nikoho, kdo se složí ze slabouèkýho draèího prdnutí.
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_03");	//Jdi domù, tohle je práce pro opravdový chlapy.
};


instance DIA_KURGAN_LEADER(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_leader_condition;
	information = dia_kurgan_leader_info;
	description = "Ty jsi tady šéf?";
};


func int dia_kurgan_leader_condition()
{
	return TRUE;
};

func void dia_kurgan_leader_info()
{
	AI_Output(other,self,"DIA_Kurgan_Leader_15_00");	//Ty jsi tady šéf?
	AI_Output(self,other,"DIA_Kurgan_Leader_01_01");	//Vypadám tak? Jasnì, že ne. Nepotøebujeme žádnýho nafoukanýho blba, co by nám nìco rozkazoval.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_02");	//Když se Sylvio snažil chovat jako náš šéf, ukázali jsme mu i tìm jeho kámošùm, co si o tom myslíme.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_03");	//Pohádali jsme se. Nakonec sami odešli.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_04");	//Doufám, že Sylvio skonèil v kotli s polívkou nìjakýho skøeta.
};


instance DIA_KURGAN_KILLDRAGON(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_killdragon_condition;
	information = dia_kurgan_killdragon_info;
	description = "Tak ty chceš zabít draky?";
};


func int dia_kurgan_killdragon_condition()
{
	if(Npc_KnowsInfo(other,dia_kurgan_leader))
	{
		return TRUE;
	};
};


var int kurgan_killdragon_day;

func void dia_kurgan_killdragon_info()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_15_00");	//(posmìšnì) Tak ty chceš zabít draky?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_01");	//Bláznivej osle. Tak ty víš, jak složit draka?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_02");	//To si myslíš, že ta bestie si prostì bude jen tak klidnì sedìt ve svym doupìti a èekat, až jí usekneš hlavu?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_03");	//Nìco takovýho vyžaduje dobrej plán a ráznou akci.
	AI_Output(other,self,"DIA_Kurgan_KillDragon_15_04");	//Já vím. A jak se s tím hodláte vypoøádat vy?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_05");	//Nejdøív musíme zjistit, kde tu bestii najdeme.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_06");	//Teprve pak si mùžeme promyslet, jak tu potvoru zabít.
	KURGAN_KILLDRAGON_DAY = Wld_GetDay();
	Info_AddChoice(dia_kurgan_killdragon,"To bych chtìl vidìt, ale musím se starat o své vìci.",dia_kurgan_killdragon_weg);
	Info_AddChoice(dia_kurgan_killdragon,"Jak se chcete dostat pøes skøety?",dia_kurgan_killdragon_orks);
	Info_AddChoice(dia_kurgan_killdragon,"Mám dojem, že nenajdeš ani slepou ovci.",dia_kurgan_killdragon_spott);
};

func void dia_kurgan_killdragon_spott()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_spott_15_00");	//Mám dojem, že nenajdeš ani slepou ovci.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_spott_01_01");	//Co? To chceš, abych ti nìjakou vrazil?
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_kurgan_killdragon_orks()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_orks_15_00");	//Jak se chcete dostat pøes skøety?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_orks_01_01");	//Na tyhle vìci je ještì dost èasu.
};

func void dia_kurgan_killdragon_weg()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_weg_15_00");	//To bych chtìl vidìt, ale musím se starat o své vìci.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_weg_01_01");	//Mìl by ses odsud rychle vytratit. Jinak se ti mùže stát, že pøijdeš o hnátu, možná o dvì.
	AI_StopProcessInfos(self);
};


instance DIA_KURGAN_SEENDRAGON(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_seendragon_condition;
	information = dia_kurgan_seendragon_info;
	permanent = TRUE;
	description = "Už jsi nìkdy toho draka vidìl?";
};


func int dia_kurgan_seendragon_condition()
{
	if(KURGAN_KILLDRAGON_DAY <= (Wld_GetDay() - 2))
	{
		return TRUE;
	};
};

func void dia_kurgan_seendragon_info()
{
	AI_Output(other,self,"DIA_Kurgan_SEENDRAGON_15_00");	//Už jsi nìkdy toho draka vidìl?
	AI_Output(self,other,"DIA_Kurgan_SEENDRAGON_01_01");	//Zatím ne. Ale ta bestie se nemùže schovávat vìènì.
};


instance DIA_KURGAN_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_708_kurgan;
	nr = 5;
	condition = dia_kurgan_alldragonsdead_condition;
	information = dia_kurgan_alldragonsdead_info;
	permanent = FALSE;
	description = "Draci jsou mrtví.";
};


func int dia_kurgan_alldragonsdead_condition()
{
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_kurgan_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Kurgan_AllDragonsDead_15_00");	//Draci jsou mrtví.
	AI_Output(self,other,"DIA_Kurgan_AllDragonsDead_01_01");	//Ha, a kdo je jako mìl zabít? Paladinové?
	AI_Output(other,self,"DIA_Kurgan_AllDragonsDead_15_02");	//Já.
	AI_Output(self,other,"DIA_Kurgan_AllDragonsDead_01_03");	//(smích) Ha. Tomu sám nevìøíš. Pøestaò si ze mì utahovat.
};


instance DIA_KURGAN_PICKPOCKET(C_INFO)
{
	npc = djg_708_kurgan;
	nr = 900;
	condition = dia_kurgan_pickpocket_condition;
	information = dia_kurgan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_kurgan_pickpocket_condition()
{
	return c_beklauen(34,120);
};

func void dia_kurgan_pickpocket_info()
{
	Info_ClearChoices(dia_kurgan_pickpocket);
	Info_AddChoice(dia_kurgan_pickpocket,DIALOG_BACK,dia_kurgan_pickpocket_back);
	Info_AddChoice(dia_kurgan_pickpocket,DIALOG_PICKPOCKET,dia_kurgan_pickpocket_doit);
};

func void dia_kurgan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_kurgan_pickpocket);
};

func void dia_kurgan_pickpocket_back()
{
	Info_ClearChoices(dia_kurgan_pickpocket);
};

