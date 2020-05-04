
instance DIA_DRAGON_ROCK_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_dragon_rock_exit_condition;
	information = dia_dragon_rock_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_rock_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_rock_exit_info()
{
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_Output(self,other,"DIA_Dragon_Rock_Exit_20_00");	//Dost øeèí. Tvá doèasná moc vypršela. Oko ztratilo svou sílu. Pøiprav se na smrt.
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};


instance DIA_DRAGON_ROCK_HELLO(C_INFO)
{
	nr = 1;
	condition = dia_dragon_rock_hello_condition;
	information = dia_dragon_rock_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragon_rock_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return 1;
	};
};

func void dia_dragon_rock_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_00");	//Další troufalé stvoøení, co se odvážilo vylézt do mých skal. Ty mròavý èlovíèku. Tak stateèný a zároveò tak zranitelný.
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Rock_Hello_15_01");	//Hej, vážnì umíš mluvit.
	};
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_02");	//Vyrvu ti z tìla vnitønosti a nadìlám z nich krmení pro krysy.
	AI_Output(other,self,"DIA_Dragon_Rock_Add_15_00");	//Ne tak rychle. Mám u sebe Innosovo oko. Budeš mì muset poslouchat a odpovídat na mé otázky.
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_04");	//(øve) Arrh. Ptej se.
};


instance DIA_DRAGON_ROCK_WERBISTDU(C_INFO)
{
	nr = 6;
	condition = dia_dragon_rock_werbistdu_condition;
	information = dia_dragon_rock_werbistdu_info;
	description = "Kdo jsi?";
};


func int dia_dragon_rock_werbistdu_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_rock_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_rock_werbistdu_info()
{
	AI_Output(other,self,"DIA_Dragon_Rock_WERBISTDU_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Dragon_Rock_WERBISTDU_20_01");	//Jsem nazýván Pedrakhanem a stáhnu z tebe kùži zaživa, až tì chytím.
};


instance DIA_DRAGON_ROCK_HIERARCHIE(C_INFO)
{
	nr = 7;
	condition = dia_dragon_rock_hierarchie_condition;
	information = dia_dragon_rock_hierarchie_info;
	description = "Kdo je mezi draky ten nejsilnìjší?";
};


func int dia_dragon_rock_hierarchie_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_rock_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_rock_hierarchie_info()
{
	AI_Output(other,self,"DIA_Dragon_Rock_HIERARCHIE_15_00");	//Kdo je mezi draky ten nejsilnìjší?
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_01");	//Èerpáme svou sílu z elementù tohoto svìta. Jejich hierarchie je jasná a jednoduchá.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_02");	//Zemì, kterou pokrývá mìkká pùda, poskytla život všem stvoøením pod sluncem. Teï se otevøe a všechny vás pohltí, pokud se dostanete pøíliš blízko.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_03");	//Skály, jež by se radìji rozpadly, než by se vzdaly, se pyšnì tyèí k nebi a schovávají samy pøed sebou jistou nedbalost. A ještì poskytují nejlepší ochranu proti pøílivu.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_04");	//Jiskøièka života døímá v žáru hlubin tohoto svìta. A teï plameny spálí vše živé a nezùstane nic než popel.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_05");	//Všechny naše elementy dokáží chránit i nièit. Ale pouze ve vodì, která se mùže stát tvrdou a pevnou jako skála, se vše pøemìní na vìènou nehybnost, kde je život stìží možný.
};

func void b_assigndragontalk_rock(var C_NPC slf)
{
	dia_dragon_rock_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_rock_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_rock_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_rock_hierarchie.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

