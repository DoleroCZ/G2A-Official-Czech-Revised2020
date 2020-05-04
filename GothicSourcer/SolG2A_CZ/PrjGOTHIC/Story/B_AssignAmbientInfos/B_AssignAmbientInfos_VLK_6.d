
instance DIA_VLK_6_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_vlk_6_exit_condition;
	information = dia_vlk_6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vlk_6_exit_condition()
{
	return TRUE;
};

func void dia_vlk_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_vlk_6_join_condition;
	information = dia_vlk_6_join_info;
	permanent = TRUE;
	description = "Jak se mùžu stát obèanem tohoto mìsta?";
};


func int dia_vlk_6_join_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_vlk_6_join_info()
{
	AI_Output(other,self,"DIA_VLK_6_JOIN_15_00");	//Jak se mùžu stát obèanem tohoto mìsta?
	AI_Output(self,other,"DIA_VLK_6_JOIN_06_01");	//Chceš se tu usadit? Teï? Když všechno smìøuje ke konci svìta?
	AI_Output(other,self,"DIA_VLK_6_JOIN_15_02");	//Nechci tu zùstat napoøád.
	AI_Output(self,other,"DIA_VLK_6_JOIN_06_03");	//Fajn, pokud stojíš o moji radu, mìl bys odsud upalovat nejdál, co mùžeš. Ale když na tom trváš, mìl by sis promluvit s jedním z vlivných mìšanù.
};


instance DIA_VLK_6_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_6_people_condition;
	information = dia_vlk_6_people_info;
	permanent = TRUE;
	description = "Kde najdu vlivné obèany Khorinisu?";
};


func int dia_vlk_6_people_condition()
{
	return TRUE;
};

func void dia_vlk_6_people_info()
{
	AI_Output(other,self,"DIA_VLK_6_PEOPLE_15_00");	//Kde najdu vlivné obèany Khorinisu?
	AI_Output(self,other,"DIA_VLK_6_PEOPLE_06_01");	//Zkus to u kováøe nebo truhláøe v dolní èásti mìsta. Najdeš tam i nìkolik dalších vážených mistrù.
	AI_Output(self,other,"DIA_VLK_6_PEOPLE_06_02");	//Pokud tady má kromì mìstské stráže a paladinù nìkdo nìjaké slovo, jsou to tihle muži.
};


instance DIA_VLK_6_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_6_location_condition;
	information = dia_vlk_6_location_info;
	permanent = TRUE;
	description = "Jak se mám ve mìstì vyznat?";
};


func int dia_vlk_6_location_condition()
{
	return TRUE;
};

func void dia_vlk_6_location_info()
{
	AI_Output(other,self,"DIA_VLK_6_LOCATION_15_00");	//Jak se mám ve mìstì vyznat?
	AI_Output(self,other,"DIA_VLK_6_LOCATION_06_01");	//Není tak snadné najít správný smìr, co? Ani ty ukazatele nedokážou pomoct úplnì vždycky.
	AI_Output(self,other,"DIA_VLK_6_LOCATION_06_02");	//Pokud máš špatný orientaèní smysl, mìl bys zajít dolù do pøístavu - teda pokud tam trefíš - a poohlédnout se po domku kartografa.
	AI_Output(self,other,"DIA_VLK_6_LOCATION_06_03");	//Je to hned za hospodou v pøístavišti. Brahim pro tebe urèitì bude nìjakou mapu mìsta mít.
};


instance DIA_VLK_6_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_6_standard_condition;
	information = dia_vlk_6_standard_info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int dia_vlk_6_standard_condition()
{
	return TRUE;
};

func void dia_vlk_6_standard_info()
{
	AI_Output(other,self,"DIA_VLK_6_STANDARD_15_00");	//Co je nového?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_VLK_6_STANDARD_06_01");	//Od té doby, co bariéra vzala za své, je tohle mìsto plné banditù. Ale paladinové nedìlají vùbec nic. Tak proè tu ksakru vùbec jsou?
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_VLK_6_STANDARD_06_02");	//Poslední dobou už to s tìmi bandity není tak zlé. Skoro to vypadá, že s tím nìkdo zaèal nìco dìlat.
	};
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_VLK_6_STANDARD_06_03");	//Nechali jít toho mizernýho žoldáka, co zabil paladina. Nebylo by od vìci, kdyby ho místo toho radìji obìsili.
		}
		else
		{
			AI_Output(self,other,"DIA_VLK_6_STANDARD_06_04");	//Øíká se, že jeden z Onarových žoldákù zabil paladina. Toho chlápka chytili a uvrhli do žaláøe. Už brzo se bude houpat.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_6_STANDARD_06_05");	//Rád bych vìdìl, co je na tìch draèích povídaèkách pravdy.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_VLK_6_STANDARD_06_06");	//Øíká se, že lord Hagen shromažïuje své muže, aby osvobodili Hornické údolí. Koneènì se zaèaly vìci hýbat!
	};
};

func void b_assignambientinfos_vlk_6(var C_NPC slf)
{
	dia_vlk_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_6_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_6_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_6_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_6_standard.npc = Hlp_GetInstanceID(slf);
};

