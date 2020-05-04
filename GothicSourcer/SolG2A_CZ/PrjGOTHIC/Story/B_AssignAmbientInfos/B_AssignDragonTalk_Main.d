
instance DIA_DRAGONTALK_MAIN_1(C_INFO)
{
	nr = 10;
	condition = dia_dragontalk_main_1_condition;
	information = dia_dragontalk_main_1_info;
	permanent = FALSE;
	description = "Kde ses tu vzal?";
};


func int dia_dragontalk_main_1_condition()
{
	if(MIS_KILLEDDRAGONS == 0)
	{
		return 1;
	};
};

func void dia_dragontalk_main_1_info()
{
	AI_Output(other,self,"DIA_DragonTalk_Main_1_15_00");	//Služebníku zla. Proè ses tu objevil? Pøišel jsi jen kvùli tomu, aby rozséval dìs a hrùzu?
	AI_Output(self,other,"DIA_DragonTalk_Main_1_20_01");	//Nejvyšší zájmy našeho shromáždìní, èlovíèku, ti zùstanou utajeny.
	Info_AddChoice(dia_dragontalk_main_1,"Jak se dostanu za ostatními draky?",dia_dragontalk_main_1_reden);
	Info_AddChoice(dia_dragontalk_main_1,"Co u Innose musím udìlat, abych tì vykázal z domova lidského pokolení?",dia_dragontalk_main_1_verbannen);
	DRAGONTALK_EXIT_FREE = TRUE;
};

func void dia_dragontalk_main_1_verbannen()
{
	AI_Output(other,self,"DIA_DragonTalk_MAIN_1_verbannen_15_00");	//Co u Innose musím udìlat, abych tì vykázal z domova lidského pokolení?
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_01");	//(smích) Pøedtím, než budeš moci jednat, musíš nejprve poznat zájmy našeho shromáždìní.
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_02");	//Nicménì, nikdo ti to dobrovolnì neprozradí.
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_03");	//Jen samotné Oko mùže rozvázat naše jazyky a prozradit naše skuteèné zámìry.
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_04");	//V každém pøípadì ti to bude k nièemu, až budeš mrtvý.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_05");	//Doneslo se k nám, že sis zvolil cestu drakobijce.
		AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_06");	//Proto jsme do vašeho svìta vyslali naše potomky, aby zajistili pokraèování našeho starobylého rodu.
		AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_07");	//Jsi ztracen, èlovíèku.
		Log_CreateTopic(TOPIC_DRACHENEIER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DRACHENEIER,LOG_RUNNING);
		b_logentry(TOPIC_DRACHENEIER,"Jeden z drakù mumlal nìco o 'potomstvu' a o pokraèování rodu. Obávám se, že svá mláïata roznesli po celém civilizovaném svìtì.");
	}
	else
	{
		AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_08");	//Oko ti zajistilo pøístup. Nicménì až samotný boj rozhodne, jestli jsi mì vùbec hoden.
	};
};

func void dia_dragontalk_main_1_reden()
{
	AI_Output(other,self,"DIA_DragonTalk_MAIN_1_reden_15_00");	//Jak se dostanu za ostatními draky?
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_reden_20_01");	//Pouze mé srdce ti mùže pomoci obnovit moc Oka.
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_reden_20_02");	//Ale nikdy se ti nepodaøí vytrhnout mi srdce.
};


instance DIA_DRAGONTALK_MAIN_2(C_INFO)
{
	nr = 10;
	condition = dia_dragontalk_main_2_condition;
	information = dia_dragontalk_main_2_info;
	permanent = FALSE;
	description = "Kdo tì sem poslal?";
};


func int dia_dragontalk_main_2_condition()
{
	if(MIS_KILLEDDRAGONS == 1)
	{
		return 1;
	};
};

func void dia_dragontalk_main_2_info()
{
	AI_Output(other,self,"DIA_DragonTalk_Main_2_15_00");	//Kdo ti rozkazuje? Kdo tì sem poslal?
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_01");	//Naše budoucnost a dobré bydlo je v rukou Pána využívajícího Mocné slovo. Už brzo mu nebude nikdo schopen vzdorovat.
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_02");	//Jeho dlouhé ruce vždycky dosahovaly daleko za hranice Øíše mrtvých. Jeho pøíchod naplòuje duchy noci radostným oèekáváním.
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_03");	//Pøemùže vaše lidské pokolení a stane se vládcem svìta.
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_04");	//V temnotì nejsme nièím jiným, než pøisluhovaèi jeho tvùrèí síly.
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_05");	//Pán sestoupí mezi vás a pozvedne vaše zubožená tìla z popela a využije jich ke zmìnì bìhu svìta.
	b_logentry(TOPIC_DRACHENJAGD,"Draci nejsou vlastními pány. Slouží vládci, který jim nedovoluje vyslovit nic než mlhavá proroctví, jako že náš pán pøijde, znièí celý svìt a tak dále. Prostì obvyklé vìci.");
	DRAGONTALK_EXIT_FREE = TRUE;
};


instance DIA_DRAGONTALK_MAIN_3(C_INFO)
{
	nr = 10;
	condition = dia_dragontalk_main_3_condition;
	information = dia_dragontalk_main_3_info;
	permanent = FALSE;
	description = "Jak mùžu zabít vašeho Pána?";
};


func int dia_dragontalk_main_3_condition()
{
	if(MIS_KILLEDDRAGONS == 2)
	{
		return 1;
	};
};

func void dia_dragontalk_main_3_info()
{
	AI_Output(other,self,"DIA_DragonTalk_Main_3_15_00");	//Jak mùžu zabít vašeho Pána?
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_01");	//Je všemohoucí a témìø neporazitelný. Pokud budeš tak pošetilý a pøesto se s ním setkáš, zemøeš pomalou a bolestivou smrtí.
	AI_Output(other,self,"DIA_DragonTalk_Main_3_15_02");	//Neslyším o tom poprvé. Témìø úplná nezranitelnost neznamená, že ho nemùžu zabít.
	AI_Output(other,self,"DIA_DragonTalk_Main_3_15_03");	//No, skonèeme to: Co musím udìlat?
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_04");	//Aby ses mohl postavit mému Pánu, musíš získat pøedmìty, jež on není schopen jakkoli sehnat.
	AI_Output(other,self,"DIA_DragonTalk_Main_3_15_05");	//A co to má být?
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_06");	//Musíš získat tu nejlepší zbroj, jakou vaše pozemská spoleènost kdy poznala, a chránit si jí svou kùži.
	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Dragons_Add_20_01");	//Potøebuješ meè, jenž byl posvìcen vaším bohem.
	}
	else if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Dragons_Add_20_02");	//Potøebuješ runu, která bude vyrobena jen pro tebe.
	}
	else
	{
		AI_Output(self,other,"DIA_Dragons_Add_20_00");	//Potøebuješ zbraò, jež vyrobili jen pro tvé použití.
	};
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_08");	//Ale tou nejtìžší podmínkou je, že musíš získat pìt spoleèníkù, kteøí budou ochotni tì následovat i na druhý bøeh.
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_09");	//Jedinì tak se mùžeš odvážit postavit Pánu.
	DRAGONTALK_EXIT_FREE = TRUE;
};


instance DIA_DRAGONTALK_MAIN_4(C_INFO)
{
	nr = 10;
	condition = dia_dragontalk_main_4_condition;
	information = dia_dragontalk_main_4_info;
	permanent = FALSE;
	description = "Jak mùžu nalézt vašeho Pána?";
};


func int dia_dragontalk_main_4_condition()
{
	if(MIS_KILLEDDRAGONS == 3)
	{
		return 1;
	};
};

func void dia_dragontalk_main_4_info()
{
	AI_Output(other,self,"DIA_DragonTalk_Main_4_15_00");	//Jak mùžu nalézt vašeho Pána?
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_01");	//Postavil si úkryt v pevné skále Irdorathských síní a èeká tam na svùj osud.
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_02");	//Do té doby, než bude schopen obnovit podobu svìta, jež mu byla pøedurèena, èeká tam v hluboké meditaci a...
	AI_Output(other,self,"DIA_DragonTalk_Main_4_15_03");	//Ušetøi mì podrobností. Prostì mi øekni, kde najdu ty Irdorathské sínì.
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_04");	//Ha ha ha. Zklamal jsi mì, èlovíèku. Dokázals pøekonat všechna nebezpeèí a porazit všechny z nás a teï skonèíš na tom, že nedokážeš pochopit vyšší vìdìní.
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_05");	//Pokud ti Irdorath nic neøíká, pak udìláš líp, když zajdeš za vašimi mágy a požádáš je, aby si uspoøádali své svìtské záležitosti.
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_06");	//Je více než zøejmé, že ještì nejsi pøipraven na tìžké bøímì vyššího vzdìlání.
	Log_CreateTopic(TOPIC_BUCHHALLENVONIRDORATH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BUCHHALLENVONIRDORATH,LOG_RUNNING);
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Pán drakù prý sídlí na mohutné skále v posvátných Irdoratských síních. Hmm. To je mi nìjak povìdomé - kde jsem o tom jenom èetl?");
	b_npc_isalivecheck(OLDWORLD_ZEN);
	DRAGONTALK_EXIT_FREE = TRUE;
};

func void b_assigndragontalk_main(var C_NPC slf)
{
	dia_dragontalk_main_1.npc = Hlp_GetInstanceID(slf);
	dia_dragontalk_main_2.npc = Hlp_GetInstanceID(slf);
	dia_dragontalk_main_3.npc = Hlp_GetInstanceID(slf);
	dia_dragontalk_main_4.npc = Hlp_GetInstanceID(slf);
};

