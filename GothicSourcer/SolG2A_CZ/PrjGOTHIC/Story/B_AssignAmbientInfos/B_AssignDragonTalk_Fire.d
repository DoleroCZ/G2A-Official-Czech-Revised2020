
instance DIA_DRAGON_FIRE_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_dragon_fire_exit_condition;
	information = dia_dragon_fire_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_fire_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_fire_exit_info()
{
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_Output(self,other,"DIA_Dragon_Fire_Exit_20_00");	//Oko ztratilo svou moc a ty se nedoèkáš pøíštího dne.
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
	if(DJG_BIFF_STAY == TRUE)
	{
		b_startotherroutine(biff,"Follow");
		DJG_BIFF_STAY = FALSE;
	};
};


instance DIA_DRAGON_FIRE_HELLO(C_INFO)
{
	nr = 1;
	condition = dia_dragon_fire_hello_condition;
	information = dia_dragon_fire_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragon_fire_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return 1;
	};
};

func void dia_dragon_fire_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_00");	//Prostì nemùžu uvìøit, že opravdu ještì existují lidé, kteøí jsou ochotni obìtovat svùj život jen proto, aby na vlastní oèi vidìli draka.
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_01");	//Jsi docela výøeèný - na takovou neskladnou obludu.
	};
	AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_02");	//Nepøišel jsem se obdivovat tvému zevnìjšku. Mám ponìkud radikálnìjší úmysly, je mi líto.
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_03");	//Nechceš tím øíct, že se mi hodláš postavit?
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_04");	//Ha ha ha. Zlomím ti ten tvùj hubený krèek.
	AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_05");	//Ne tak rychle, pøíteli. Mám u sebe Innosovo oko. Nemùžeš odolat mé moci. Odpovìz na mé otázky, nebo okusíš nesnesitelná muka.
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_06");	//c(øve) Arrgh. Tak se pochlub s tìmi tvými otázkami, dokud mùžeš. Tvá moc nebude mít dlouhého trvání.
};


instance DIA_DRAGON_FIRE_WERBISTDU(C_INFO)
{
	nr = 5;
	condition = dia_dragon_fire_werbistdu_condition;
	information = dia_dragon_fire_werbistdu_info;
	description = "Kdo jsi?";
};


func int dia_dragon_fire_werbistdu_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_fire_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_fire_werbistdu_info()
{
	AI_Output(other,self,"DIA_Dragon_Fire_WerBistDu_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Dragon_Fire_WerBistDu_20_01");	//Jmenuju se Feomathar, a to je vše, co se o mnì dozvíš.
	AI_Output(self,other,"DIA_Dragon_Fire_WerBistDu_20_02");	//Jakmile uniknu úèinkùm kouzla Oka, užiješ si žáru poøádného plamene.
};


instance DIA_DRAGON_FIRE_HORT(C_INFO)
{
	nr = 5;
	condition = dia_dragon_fire_hort_condition;
	information = dia_dragon_fire_hort_info;
	description = "Tak kde máš ty své poklady?";
};


func int dia_dragon_fire_hort_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_fire_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_fire_hort_info()
{
	AI_Output(other,self,"DIA_Dragon_Fire_HORT_15_00");	//Každý drak má skrýš, ve které schovává své poklady. Takže, kde ta skrýš je?
	AI_Output(self,other,"DIA_Dragon_Fire_HORT_20_01");	//Na místì, na které se nemùžeš dostat, protože já se nakonec zbavím øetìzù toho Oka.
	AI_Output(self,other,"DIA_Dragon_Fire_HORT_20_02");	//Vzal jsem svùj poklad nahoru na žhavé útesy, které lze nazvat všelijak, jenom ne pøístupnými neokøídlenému èlovíèkovi, jako jsi ty.
};

func void b_assigndragontalk_fire(var C_NPC slf)
{
	dia_dragon_fire_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_fire_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_fire_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_fire_hort.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

