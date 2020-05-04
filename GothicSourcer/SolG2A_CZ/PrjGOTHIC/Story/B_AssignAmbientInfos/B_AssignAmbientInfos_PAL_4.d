
instance DIA_PAL_4_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_pal_4_exit_condition;
	information = dia_pal_4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_4_exit_condition()
{
	return TRUE;
};

func void dia_pal_4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_4_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_pal_4_join_condition;
	information = dia_pal_4_join_info;
	permanent = TRUE;
	description = "Jak bych se mohl stát paladinem?";
};


func int dia_pal_4_join_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_pal_4_join_info()
{
	AI_Output(other,self,"DIA_PAL_4_JOIN_15_00");	//Jak bych se mohl stát paladinem?
	AI_Output(self,other,"DIA_PAL_4_JOIN_04_01");	//Pokud to myslíš vážnì, mìl bys nejprve vstoupit do jejich služeb.
	AI_Output(self,other,"DIA_PAL_4_JOIN_04_02");	//Zajdi do kasáren a promluv si s lordem Andrem. Nech se pøijmout k domobranì.
	AI_Output(self,other,"DIA_PAL_4_JOIN_04_03");	//Pak možná dostaneš šanci ukázat, co v tobì vìzí.
};


instance DIA_PAL_4_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_pal_4_people_condition;
	information = dia_pal_4_people_info;
	permanent = TRUE;
	description = "Kdo tomu tady velí?";
};


func int dia_pal_4_people_condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_pal_4_people_info()
{
	AI_Output(other,self,"DIA_PAL_4_PEOPLE_15_00");	//Kdo tomu tady velí?
	AI_Output(self,other,"DIA_PAL_4_PEOPLE_04_01");	//Velitelem všech jednotek na ostrovì je lord Hagen. Také po celou dobu naší pøítomnosti ve mìstì zastává úøad místodržícího.
	AI_Output(self,other,"DIA_PAL_4_PEOPLE_04_02");	//Ale je velmi zaneprázdnìný. Pokud potøebuješ nìco zaøídit, zajdi do kasáren za lordem Andrem.
};


instance DIA_PAL_4_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_pal_4_location_condition;
	information = dia_pal_4_location_info;
	permanent = TRUE;
	description = "Co dìláte vy, paladinové, tady v Khorinisu?";
};


func int dia_pal_4_location_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_pal_4_location_info()
{
	AI_Output(other,self,"DIA_PAL_4_LOCATION_15_00");	//Co dìláte vy, paladinové, tady v Khorinisu?
	AI_Output(self,other,"DIA_PAL_4_LOCATION_04_01");	//To ti nemùžu øíct.
};


instance DIA_PAL_4_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_pal_4_standard_condition;
	information = dia_pal_4_standard_info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int dia_pal_4_standard_condition()
{
	return TRUE;
};

func void dia_pal_4_standard_info()
{
	AI_Output(other,self,"DIA_PAL_4_STANDARD_15_00");	//Co je nového?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(KAPITEL <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_4_STANDARD_04_01");	//Teï když víme, že máme co do èinìní s draky, zaène náš velitel urèitì brzy nìco dìlat.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_4_STANDARD_04_02");	//Ještì stále nemáme žádné zprávy od našich mužù z Hornického údolí. To je velmi znepokojivé.
			};
		};
		if(KAPITEL >= 5)
		{
			AI_Output(self,other,"DIA_PAL_4_STANDARD_04_03");	//Díky Innosovi! Draèí hrozba byla zažehnána. Teï už se musíme jen vypoøádat s tìmi skøety a cesta k rudì je volná.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_4_STANDARD_04_04");	//Nemám èas zabývat se každým drbem, co se po mìstì šíøí.
	};
};

func void b_assignambientinfos_pal_4(var C_NPC slf)
{
	dia_pal_4_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_standard.npc = Hlp_GetInstanceID(slf);
};

