
instance DIA_PAL_9_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_pal_9_exit_condition;
	information = dia_pal_9_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_9_exit_condition()
{
	return TRUE;
};

func void dia_pal_9_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_pal_9_join_condition;
	information = dia_pal_9_join_info;
	permanent = TRUE;
	description = "Jak se mohu st·t paladinem?";
};


func int dia_pal_9_join_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_pal_9_join_info()
{
	AI_Output(other,self,"DIA_PAL_9_JOIN_15_00");	//Jak se mohu st·t paladinem?
	AI_Output(self,other,"DIA_PAL_9_JOIN_09_01");	//Jen ten, kdo v Innosov˝ch Ëi kr·lov˝ch sluûb·ch prok·ûe, ûe je toho hoden, se m˘ûe st·t vyvolen˝m!
	AI_Output(self,other,"DIA_PAL_9_JOIN_09_02");	//Jinak ¯eËeno: Vybr·ni mohou b˝t jen ti nejlepöÌ. Ale TY do toho m·ö hodnÏ daleko, hochu!
};


instance DIA_PAL_9_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_pal_9_people_condition;
	information = dia_pal_9_people_info;
	permanent = TRUE;
	description = "Kdo tomu tady velÌ?";
};


func int dia_pal_9_people_condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_pal_9_people_info()
{
	AI_Output(other,self,"DIA_PAL_9_PEOPLE_15_00");	//Kdo tomu tady velÌ?
	AI_Output(self,other,"DIA_PAL_9_PEOPLE_09_01");	//Lord Hagen.
	AI_Output(other,self,"DIA_PAL_9_PEOPLE_15_02");	//A?
	AI_Output(self,other,"DIA_PAL_9_PEOPLE_09_03");	//A nikdo dalöÌ. Lord Hagen je nejvyööÌm velitelem celÈho ostrova.
};


instance DIA_PAL_9_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_pal_9_location_condition;
	information = dia_pal_9_location_info;
	permanent = TRUE;
	description = "ProË jste vy, paladinovÈ, p¯iöli do Khorinisu?";
};


func int dia_pal_9_location_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_pal_9_location_info()
{
	AI_Output(other,self,"DIA_PAL_9_LOCATION_15_00");	//ProË jste vy, paladinovÈ, p¯iöli do Khorinisu?
	AI_Output(self,other,"DIA_PAL_9_LOCATION_09_01");	//Do toho ti nic nenÌ, p¯Ìteli! MusÌ ti staËit, ûe jsme tu v Innosov˝ch a kr·lov˝ch sluûb·ch!
};


instance DIA_PAL_9_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_pal_9_standard_condition;
	information = dia_pal_9_standard_info;
	permanent = TRUE;
	description = "Co se stalo?";
};


func int dia_pal_9_standard_condition()
{
	return TRUE;
};

func void dia_pal_9_standard_info()
{
	AI_Output(other,self,"DIA_PAL_9_STANDARD_15_00");	//Co se stalo?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(KAPITEL <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_9_STANDARD_09_01");	//TeÔ kdyû vÌme, ûe m·me co do ËinÏnÌ s draky, zaËne n·ö velitel urËitÏ brzy nÏco dÏlat.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_9_STANDARD_09_02");	//JeötÏ st·le nem·me û·dnÈ zpr·vy od naöich muû˘ z HornickÈho ˙dolÌ. To je velmi znepokojivÈ.
			};
		};
		if(KAPITEL >= 5)
		{
			AI_Output(self,other,"DIA_PAL_9_STANDARD_09_03");	//DÌky Innosovi! DraËÌ hrozba byla zaûehn·na. TeÔ uû se musÌme jen vypo¯·dat s tÏmi sk¯ety a cesta k rudÏ je voln·.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_9_STANDARD_09_04");	//Jestli je to vöechno, co mi m˘ûeö ¯Ìct, tak uû se ztraù, p¯Ìteli!
	};
};

func void b_assignambientinfos_pal_9(var C_NPC slf)
{
	dia_pal_9_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_standard.npc = Hlp_GetInstanceID(slf);
};

