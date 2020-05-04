
instance DIA_MIL_7_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_mil_7_exit_condition;
	information = dia_mil_7_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_7_exit_condition()
{
	return TRUE;
};

func void dia_mil_7_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_7_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_mil_7_join_condition;
	information = dia_mil_7_join_info;
	permanent = TRUE;
	description = "Chci se pøidat k domobranì!";
};


func int dia_mil_7_join_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_mil_7_join_info()
{
	AI_Output(other,self,"DIA_MIL_7_JOIN_15_00");	//Chci se pøidat k domobranì!
	if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(self,other,"DIA_MIL_7_JOIN_07_01");	//Ještì ses nestal obèanem Khorinisu! Proè si myslíš, že by tì mìl lord Andre pøijmout?
		AI_Output(self,other,"DIA_MIL_7_JOIN_07_02");	//Takhle by mohl pøijít každý - dostal by zbraò a nìjakou zbroj a pak s tím zmizel!
		if(c_npcisinquarter(self) != Q_KASERNE)
		{
			AI_Output(other,self,"DIA_MIL_7_JOIN_15_03");	//Ale já mám dobrou povìst!
			AI_Output(self,other,"DIA_MIL_7_JOIN_07_04");	//To nevysvìtluj mnì, ale lordu Andremu. Najdeš ho v kasárnách.
		};
	}
	else
	{
		b_say(self,other,"$ABS_GOOD");
	};
};


instance DIA_MIL_7_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_mil_7_people_condition;
	information = dia_mil_7_people_info;
	permanent = TRUE;
	description = "Co víš o paladinech?";
};


func int dia_mil_7_people_condition()
{
	if(hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_mil_7_people_info()
{
	AI_Output(other,self,"DIA_MIL_7_PEOPLE_15_00");	//Co víš o paladinech?
	AI_Output(self,other,"DIA_MIL_7_PEOPLE_07_01");	//Nic moc. Nikdo poøádnì neví, proè jsou vlastnì tady. Alespoò nikdo z mìstské stráže.
	AI_Output(self,other,"DIA_MIL_7_PEOPLE_07_02");	//Pøevzali kontrolu nad mìstem, zabrali místodržícímu jeho zastupitelskou síò a ujali se funkce soudu.
	AI_Output(self,other,"DIA_MIL_7_PEOPLE_07_03");	//Pokud to chceš vìdìt, tak si myslím, že to je jen ku prospìchu vìci. Ti nafoukaní oslové už vážnì potøebovali lekci slušného chování.
};


instance DIA_MIL_7_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_mil_7_location_condition;
	information = dia_mil_7_location_info;
	permanent = TRUE;
	description = "Co mohu tady ve mìstì dìlat?";
};


func int dia_mil_7_location_condition()
{
	return TRUE;
};

func void dia_mil_7_location_info()
{
	AI_Output(other,self,"DIA_MIL_7_LOCATION_15_00");	//Co mohu tady ve mìstì dìlat?
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_01");	//Pokud nechceš skonèit ve stoce v pøístavní ètvrti, najdi si slušné zamìstnání. Poptej se tady v dolní èásti mìsta - možná se na tebe usmìje štìstí.
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_02");	//Jestli se tu chystáš zùstat trochu déle, mìl by ses pøipojit k domobranì nebo alespoò zaèít s bojovým výcvikem.
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_03");	//Vedoucí výcviku, kterého najdeš v kasárnách, uèí i civilisty.
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_04");	//Skøeti pøijdou už brzo a pak budeš vdìèný za každou hodinu, kterou jsi strávil na cvièišti.
};


instance DIA_MIL_7_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_mil_7_standard_condition;
	information = dia_mil_7_standard_info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int dia_mil_7_standard_condition()
{
	return TRUE;
};

func void dia_mil_7_standard_info()
{
	var int randy;
	AI_Output(other,self,"DIA_MIL_7_STANDARD_15_00");	//Co je nového?
	if(KAPITEL == 1)
	{
		randy = Hlp_Random(2);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Addon_MIL_7_STANDARD_07_00");	//Jeden po druhém lidé mizí. Bohužel jsme ještì nezjistili, co se s nimi stalo. Mùžou za tím být skøeti?
			if(SC_HEAREDABOUTMISSINGPEOPLE == FALSE)
			{
				Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
				b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,LOGTEXT_ADDON_SCKNOWSMISSPEAPL);
			};
			SC_HEAREDABOUTMISSINGPEOPLE = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_MIL_7_STANDARD_07_01");	//Øíká se, že se farmáøi vzbouøili. Takový zatracený problémy nám byl èert dlužen, zrovna teï, když jsme uprostøed války se skøety!
		};
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_02");	//Je na èase, aby paladinové koneènì tu rebelii potlaèili. Každý, kdo poruší zákon, musí být potrestán. Zvláš teï, když jsme ve válce.
	};
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_MIL_7_STANDARD_07_03");	//Žoldnéø, co byl obvinìn z vraždy Lothara, je pravdìpodobnì nevinen. Kdosi pøinesl dùkaz o tom, že na nìj nìkdo ušil boudu.
		}
		else
		{
			AI_Output(self,other,"DIA_MIL_7_STANDARD_07_04");	//Jeden z Onarových žoldnéøù zavraždil ctihodného paladina Lothara. Ale nakonec ho chytili a uvrhli do žaláøe.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_05");	//Nìkteøí ze žoldnéøù už Onarovu farmu opustili. Nìkteré problémy se vyøeší èasem samy.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_06");	//Draci to mají spoèítané, ale ještì není všemu konec. Další na øadì jsou skøeti. My své záležitosti øešíme s øádnou dùsledností!
	};
};

func void b_assignambientinfos_mil_7(var C_NPC slf)
{
	dia_mil_7_exit.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_join.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_people.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_location.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_standard.npc = Hlp_GetInstanceID(slf);
};

