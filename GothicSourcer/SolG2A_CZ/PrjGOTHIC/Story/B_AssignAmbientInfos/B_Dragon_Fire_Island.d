
instance DIA_DRAGON_FIRE_ISLAND_EXIT(C_INFO)
{
	npc = dragon_fire_island;
	nr = 999;
	condition = dia_dragon_fire_island_exit_condition;
	information = dia_dragon_fire_island_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_fire_island_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_fire_island_exit_info()
{
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};


instance DIA_DRAGON_FIRE_ISLAND_HELLO(C_INFO)
{
	npc = dragon_fire_island;
	nr = 5;
	condition = dia_dragon_fire_island_hello_condition;
	information = dia_dragon_fire_island_hello_info;
	important = TRUE;
};


func int dia_dragon_fire_island_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_dragon_fire_island_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_00");	//Stùj, èlovìèe. Všechny mé smysly mi øíkají, že vrah mé vlastní krve stojí právì pøede mnou.
	AI_Output(other,self,"DIA_Dragon_Fire_Island_Hello_15_01");	//Vážnì? Komu øíkáš vrahu, ty zplozenèe pekel?
	if((hero.guild == GIL_DJG) && (DRAGONEGGCOUNTER >= 7))
	{
		AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_02");	//Copak ti nestaèí, žes vyvraždil všechny moje potomky?
	};
	AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_03");	//Máš na svìdomí mého bratra Feomathara a za to zaplatíš.
	if((hero.guild == GIL_DJG) && (DRAGONEGGCOUNTER >= 7))
	{
		AI_Output(other,self,"DIA_Dragon_Fire_Island_Hello_15_04");	//A taky dostanu i zbytek tìch tvých odporných mláïat.
		AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_05");	//Arrr. Bude mi potìšením tì usmažit zaživa.
	};
	AI_Output(other,self,"DIA_Dragon_Fire_Island_Hello_15_06");	//Pøestaò dìlat takovej rámus. Vrátíme se k vìci.
	AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_07");	//Došel jsi daleko, èlovíèku, ale tyhle sínì nikdy živý neopustíš.
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_HALLENVONIRDORATH,"Další ohnivý drak. Zaèínám mít tìch bestií fakt plné zuby. A to se chci jenom dostat do rokle, která se otvírá právì za touhle ohnivou potvorou!");
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};

