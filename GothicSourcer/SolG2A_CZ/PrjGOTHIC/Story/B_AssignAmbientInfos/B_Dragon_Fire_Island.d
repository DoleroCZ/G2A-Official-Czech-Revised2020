
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
	AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_00");	//St�j, �lov��e. V�echny m� smysly mi ��kaj�, �e vrah m� vlastn� krve stoj� pr�v� p�ede mnou.
	AI_Output(other,self,"DIA_Dragon_Fire_Island_Hello_15_01");	//V�n�? Komu ��k� vrahu, ty zplozen�e pekel?
	if((hero.guild == GIL_DJG) && (DRAGONEGGCOUNTER >= 7))
	{
		AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_02");	//Copak ti nesta��, �es vyvra�dil v�echny moje potomky?
	};
	AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_03");	//M� na sv�dom� m�ho bratra Feomathara a za to zaplat�.
	if((hero.guild == GIL_DJG) && (DRAGONEGGCOUNTER >= 7))
	{
		AI_Output(other,self,"DIA_Dragon_Fire_Island_Hello_15_04");	//A taky dostanu i zbytek t�ch tv�ch odporn�ch ml��at.
		AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_05");	//Arrr. Bude mi pot�en�m t� usma�it za�iva.
	};
	AI_Output(other,self,"DIA_Dragon_Fire_Island_Hello_15_06");	//P�esta� d�lat takovej r�mus. Vr�t�me se k v�ci.
	AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_07");	//Do�el jsi daleko, �lov��ku, ale tyhle s�n� nikdy �iv� neopust�.
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_HALLENVONIRDORATH,"Dal�� ohniv� drak. Za��n�m m�t t�ch besti� fakt pln� zuby. A to se chci jenom dostat do rokle, kter� se otv�r� pr�v� za touhle ohnivou potvorou!");
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};

