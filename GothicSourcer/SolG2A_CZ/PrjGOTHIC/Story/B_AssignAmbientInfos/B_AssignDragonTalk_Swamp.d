
instance DIA_DRAGON_SWAMP_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_dragon_swamp_exit_condition;
	information = dia_dragon_swamp_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_swamp_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_swamp_exit_info()
{
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_Output(self,other,"DIA_Dragon_Swamp_Exit_20_00");	//Moc Oka je vyèerpána. Nit tvého života tady konèí, èlovìèe.
	SWAMPDRAGON = Hlp_GetNpc(dragon_swamp);
	swampdragon.flags = 0;
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	if(DJG_SWAMPPARTY_GOGOGO == TRUE)
	{
		if((DJG_SWAMPPARTY == TRUE) && (Npc_IsDead(djg_cipher) == FALSE))
		{
			b_startotherroutine(djg_rod,"SwampDragon");
		};
		b_startotherroutine(djg_cipher,"SwampDragon");
	};
	if(DJG_BIFF_STAY == TRUE)
	{
		b_startotherroutine(biff,"Follow");
		DJG_BIFF_STAY = FALSE;
	};
};


instance DIA_DRAGON_SWAMP_HELLO(C_INFO)
{
	nr = 5;
	condition = dia_dragon_swamp_hello_condition;
	information = dia_dragon_swamp_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragon_swamp_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return 1;
	};
};

func void dia_dragon_swamp_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_00");	//Èekají tì jen samé potíže, jestli se odvážíš ještì o krok blíž!
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_01");	//Ach. Vypadá to, že Innosovo oko funguje.
	};
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_02");	//Už pøišli mnozí z tvého druhu. Všechny jsem je smetl z povrchu zemského.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_03");	//Šetøi si dech. Tvá velká slova mì nemohou vydìsit, ty smrdutý zplozenèe pekel.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_04");	//Øekni mi, co chci vìdìt, nebo tì utopím ve tvé vlastní krvi.
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_05");	//Ha ha ha. Opovažuješ se mi vyhrožovat, bídný èerve? Øekni mi jeden jediný dùvod, proè bych tì hned teï nemìl rozsekat na tisíc kouskù.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_06");	//Jsem Innosùv posel a mám u sebe posvátné Innosovo oko. Nemáš na výbìr. Musíš se podrobit mé vùli, nebo budeš znièen.
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_07");	//(øve) Arrh. Øekni, co ode mì chceš.
};


instance DIA_DRAGON_SWAMP_WERBISTDU(C_INFO)
{
	nr = 6;
	condition = dia_dragon_swamp_werbistdu_condition;
	information = dia_dragon_swamp_werbistdu_info;
	description = "Kdo jsi?";
};


func int dia_dragon_swamp_werbistdu_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_swamp_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_swamp_werbistdu_info()
{
	AI_Output(other,self,"DIA_Dragon_Swamp_WERBISTDU_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Dragon_Swamp_WERBISTDU_20_01");	//Jmenuju se Pandrodor. A mìl bys sis dobøe rozmyslet, jestli nebude lepší zalézt zpìt mezi skály, odkud jsi pøišel.
};


instance DIA_DRAGON_SWAMP_WOSINDDIEANDEREN(C_INFO)
{
	nr = 7;
	condition = dia_dragon_swamp_wosinddieanderen_condition;
	information = dia_dragon_swamp_wosinddieanderen_info;
	description = "Kde najdu zbytek tobì podobných odporných stvoøení?";
};


func int dia_dragon_swamp_wosinddieanderen_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_swamp_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_swamp_wosinddieanderen_info()
{
	AI_Output(other,self,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_15_00");	//Kde najdu zbytek tobì podobných odporných stvoøení?
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_01");	//Elementy, z nichž bylo vše stvoøeno, drží tento svìt pohromadì.
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_02");	//Každý z nich vyjadøuje schopnost ovládat èást svìta.
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_03");	//Hledej elementy a nalezneš všechny ostatní.
};

func void b_assigndragontalk_swamp(var C_NPC slf)
{
	dia_dragon_swamp_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_swamp_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_swamp_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_swamp_wosinddieanderen.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

