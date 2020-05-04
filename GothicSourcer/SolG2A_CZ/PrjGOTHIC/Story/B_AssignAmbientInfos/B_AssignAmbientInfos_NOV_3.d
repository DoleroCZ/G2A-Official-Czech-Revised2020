
instance DIA_NOV_3_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_nov_3_exit_condition;
	information = dia_nov_3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_nov_3_exit_condition()
{
	return TRUE;
};

func void dia_nov_3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NOV_3_FEGEN(C_INFO)
{
	nr = 2;
	condition = dia_nov_3_fegen_condition;
	information = dia_nov_3_fegen_info;
	permanent = TRUE;
	description = "Potøebuju pomoci zamést pokoje novicù.";
};


var int feger1_permanent;
var int feger2_permanent;

func int dia_nov_3_fegen_condition()
{
	if((KAPITEL == 1) && (MIS_KLOSTERARBEIT == LOG_RUNNING) && (NOV_HELFER < 4))
	{
		return TRUE;
	};
};

func void dia_nov_3_fegen_info()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_15_00");	//Potøebuju pomoci zamést pokoje novicù.
	if(Hlp_GetInstanceID(feger1) == Hlp_GetInstanceID(self))
	{
		if((NOV_HELFER < 1) && (FEGER1_PERMANENT == FALSE))
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_01");	//Nikdo ti nechce jen tak pomoct, co? Pomùžu ti jen v pøípadì, že se ti podaøí pøesvìdèit ještì nìkoho dalšího, aby do toho šel taky.
			b_logentry(TOPIC_PARLANFEGEN,"Novic, který uklízí sklep, mi nabídl pomocnou ruku, pokud nìkterého z jeho bratrù pøesvìdèím, aby mu pomohl zamést komnaty.");
		}
		else if((NOV_HELFER >= 1) && (FEGER1_PERMANENT == FALSE))
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_02");	//To jsem sám, kdo ti pomáhá?
			AI_Output(other,self,"DIA_NOV_3_Fegen_15_03");	//Ne, už se mi podaøilo získat nìkoho dalšího.
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_04");	//Tak to jsem pro.
			NOV_HELFER = NOV_HELFER + 1;
			FEGER1_PERMANENT = TRUE;
			b_giveplayerxp(XP_FEGER);
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"FEGEN");
			b_logentry(TOPIC_PARLANFEGEN,"Novic ze sklepa mi nyní pomùže uklidit komnaty.");
		}
		else if(FEGER1_PERMANENT == TRUE)
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_05");	//Hej, bratøe - já už ti pøece pomáhám. Nemusíš mì pøemlouvat.
		};
	};
	if(Hlp_GetInstanceID(feger2) == Hlp_GetInstanceID(self))
	{
		if(FEGER2_PERMANENT == FALSE)
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_08");	//Jasnì, že ti pomùžu. My novicové musíme držet pøi sobì. Ruka ruku myje.
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_09");	//Potøebuju 50 zlatých, protože jsem stále ještì nezaplatil Parlanovi.
			b_logentry(TOPIC_PARLANFEGEN,"Novic pøed kostelem mi pomùže, pokud mu zaplatím padesát zlaákù.");
			Info_ClearChoices(dia_nov_3_fegen);
			Info_AddChoice(dia_nov_3_fegen,"Možná pozdìji ...",dia_nov_3_fegen_nein);
			if(Npc_HasItems(other,itmi_gold) >= 50)
			{
				Info_AddChoice(dia_nov_3_fegen,"Dobrá. Zaplatím.",dia_nov_3_fegen_ja);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_06");	//Však už jsem ti to slíbil. Tys pomohl mnì, já pomùžu tobì.
		};
	};
	if((Hlp_GetInstanceID(feger1) != Hlp_GetInstanceID(self)) && (Hlp_GetInstanceID(feger2) != Hlp_GetInstanceID(self)))
	{
		AI_Output(self,other,"DIA_NOV_3_Fegen_03_07");	//Zapomeò na to - nemám na takové vìci èas. Podívej se po nìkom jiném, kdo by ti mohl pomoct.
	};
};

func void dia_nov_3_fegen_nein()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_Nein_15_00");	//Možná pozdìji. Právì teï si to nemùžu dovolit.
	Info_ClearChoices(dia_nov_3_fegen);
};

func void dia_nov_3_fegen_ja()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_Ja_15_00");	//Dobrá. Zaplatím.
	AI_Output(self,other,"DIA_NOV_3_Fegen_Ja_03_01");	//Fajn, v tom pøípadì mùžu zaèít.
	b_giveinvitems(other,self,itmi_gold,50);
	NOV_HELFER = NOV_HELFER + 1;
	b_giveplayerxp(XP_FEGER);
	FEGER2_PERMANENT = TRUE;
	Info_ClearChoices(dia_nov_3_fegen);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FEGEN");
	b_logentry(TOPIC_PARLANFEGEN,"Novic pøed kostelem mi nyní pomùže s úklidem komnat.");
};


instance DIA_NOV_3_WURST(C_INFO)
{
	nr = 3;
	condition = dia_nov_3_wurst_condition;
	information = dia_nov_3_wurst_info;
	permanent = TRUE;
	description = "Nedal by sis klobásu?";
};


func int dia_nov_3_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_nov_3_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_NOV_3_Wurst_15_00");	//Nedal by sis klobásu?
	AI_Output(self,other,"DIA_NOV_3_Wurst_03_01");	//Jasnì, dej to sem. Taková klobása není vùbec k zahození.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_NOV_3_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_nov_3_join_condition;
	information = dia_nov_3_join_info;
	permanent = TRUE;
	description = "Chci se stát mágem!";
};


func int dia_nov_3_join_condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_nov_3_join_info()
{
	AI_Output(other,self,"DIA_NOV_3_JOIN_15_00");	//Chci se stát mágem!
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_01");	//To chce každý novic. Ale jen nìkolika z nich je požehnáno být Vyvoleným a dostat šanci na pøijetí do Kruhu ohnì.
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_02");	//Být mágem Kruhu ohnì je tou nejvyšší poctou, jaké se ti u nás mùže dostat.
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_03");	//Budeš muset tvrdì pracovat, abys dostal svou šanci.
};


instance DIA_NOV_3_PEOPLE(C_INFO)
{
	nr = 5;
	condition = dia_nov_3_people_condition;
	information = dia_nov_3_people_info;
	permanent = TRUE;
	description = "Kdo je pøedstaveným tohoto kláštera?";
};


func int dia_nov_3_people_condition()
{
	return TRUE;
};

func void dia_nov_3_people_info()
{
	AI_Output(other,self,"DIA_NOV_3_PEOPLE_15_00");	//Kdo je pøedstaveným tohoto kláštera?
	AI_Output(self,other,"DIA_NOV_3_PEOPLE_03_01");	//My novicové sloužíme mágùm Kruhu ohnì. Ti se zodpovídají Nejvyššímu shromáždìní, které sestává ze tøí nejmocnìjších èarodìjù.
	AI_Output(self,other,"DIA_NOV_3_PEOPLE_03_02");	//Ale za vše, co se týká novicù, je zodpovìdný otec Parlan. Veškerý svùj èas tráví na nádvoøí, kde kontroluje práci novicù.
};


instance DIA_NOV_3_LOCATION(C_INFO)
{
	nr = 6;
	condition = dia_nov_3_location_condition;
	information = dia_nov_3_location_info;
	permanent = TRUE;
	description = "Co mi mùžeš øíct o tomto klášteru?";
};


func int dia_nov_3_location_condition()
{
	return TRUE;
};

func void dia_nov_3_location_info()
{
	AI_Output(other,self,"DIA_NOV_3_LOCATION_15_00");	//Co mi mùžeš øíct o tomto klášteru?
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_01");	//Tady se staráme o to, abychom si zajistili své skromné zásoby. Chováme ovce a dìláme víno.
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_02");	//Tady je knihovna, ale mohou ji využívat pouze mágové a vyvolení novicové.
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_03");	//My novicové se do ní podíváme jen, když sem pro nìco zajdeme mágùm Kruhu ohnì.
};


instance DIA_NOV_3_STANDARD(C_INFO)
{
	nr = 10;
	condition = dia_nov_3_standard_condition;
	information = dia_nov_3_standard_info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int dia_nov_3_standard_condition()
{
	return TRUE;
};

func void dia_nov_3_standard_info()
{
	AI_Output(other,self,"DIA_NOV_3_STANDARD_15_00");	//Co je nového?
	if(KAPITEL == 1)
	{
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_01");	//Ty jsi zrovna ten pravý, co by se na to mìl ptát! O nièem jiném než o tobì novicové nemluví.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_02");	//Jen málokdy se stane, že by se takový nováèek jako ty stal vyvoleným pro Kruh ohnì.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_03");	//Èas znovu nadešel. Jeden z novicù bude brzy pøijat do Kruhu ohnì.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_04");	//Zkouška zaène už brzy.
		};
	};
	if((KAPITEL == 2) || (KAPITEL == 3))
	{
		if((PEDRO_TRAITOR == TRUE) && (MIS_NOVIZENCHASE != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_05");	//Do našeho øádu pronikl Beliar! Zlo musí být velmi silné, když si dokázalo najít spojence už i tady.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_06");	//Pedro byl tady v klášteøe už celá léta. Dlouhý èas, který strávil venku, musel oslabit jeho víru, a tak snadno podlehl Beliarovu pokoušení.
		}
		else if(MIS_NOVIZENCHASE == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_07");	//Pøišel jsi právì vèas. Sám Innos by nemohl zvolit vhodnìjší dobu pro tvùj pøíchod.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_08");	//Zapíšeš se do kroniky našeho kláštera jako mocný zachránce Oka.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_09");	//Zprávy z Hornického údolí jsou znepokojivé. Innos nás tìžce zkouší.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_10");	//Øíká se, že od paladinù, kteøí se vydali ho Hornického údolí, zatím nedorazily žádné zprávy. Nejvyšší rada bude vìdìt, co má být uèinìno.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_NOV_3_STANDARD_03_11");	//Øíkají, že bychom draky mìli znièit za pomoci našeho Pána. Beliarovy zrùdy stihne Innosùv hnìv.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_NOV_3_STANDARD_03_12");	//Jen díky Innosovi se nám podaøilo zažehnat bezprostøední hrozbu. Musíme se vrátit na cestu našeho Pána, protože pouze s jeho pomocí se mùžeme postavit zlu.
	};
};

func void b_assignambientinfos_nov_3(var C_NPC slf)
{
	dia_nov_3_exit.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_join.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_people.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_location.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_standard.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_fegen.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_wurst.npc = Hlp_GetInstanceID(slf);
};

