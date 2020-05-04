
instance DIA_PAL_12_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_pal_12_exit_condition;
	information = dia_pal_12_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_12_exit_condition()
{
	return TRUE;
};

func void dia_pal_12_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_12_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_pal_12_join_condition;
	information = dia_pal_12_join_info;
	permanent = TRUE;
	description = "Chci se stát paladinem!";
};


func int dia_pal_12_join_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_pal_12_join_info()
{
	AI_Output(other,self,"DIA_PAL_12_JOIN_15_00");	//Chci se stát paladinem!
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_01");	//Ty? Nenech se vysmát! Ještì nejsi ani èlenem mìstských stráží.
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_02");	//Kdybych nevidìl, jakej seš tupej buran, musel bych si myslet, že ses mì pokusil urazit.
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_03");	//Pouze ti nejlepší z nejlepších vìrných následovníkù krále a našeho Pána Innose se mohou stát paladiny.
};


instance DIA_PAL_12_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_pal_12_people_condition;
	information = dia_pal_12_people_info;
	permanent = TRUE;
	description = "Kdo tomu tady velí?";
};


func int dia_pal_12_people_condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_pal_12_people_info()
{
	AI_Output(other,self,"DIA_PAL_12_PEOPLE_15_00");	//Kdo tomu tady velí?
	AI_Output(self,other,"DIA_PAL_12_PEOPLE_12_01");	//Ctihodný lord Hagen. Ale vše, co se týká prostého lidu, má na starosti lord Andre.
	AI_Output(self,other,"DIA_PAL_12_PEOPLE_12_02");	//Najdeš ho v kasárnách. Možná budeš mít štìstí a vìnuje ti pár minut svého drahocenného èasu.
};


instance DIA_PAL_12_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_pal_12_location_condition;
	information = dia_pal_12_location_info;
	permanent = TRUE;
	description = "Co dìláte vy, paladinové, tady v Khorinisu?";
};


func int dia_pal_12_location_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_pal_12_location_info()
{
	AI_Output(other,self,"DIA_PAL_12_LOCATION_15_00");	//Co dìláte vy, paladinové, tady v Khorinisu?
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_01");	//Lidi, co mají takovéhle otázky, vìtšinou skonèí na šibenici døív, než si toho staèí všimnout.
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_02");	//Pokud si lord Andre nemùže nìco dovolit, tak vìdomí toho, že naše mise byla vyzrazena.
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_03");	//No, mìl by sis dávat vìtší pozor, na co se ptáš.
};


instance DIA_PAL_12_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_pal_12_standard_condition;
	information = dia_pal_12_standard_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_pal_12_standard_condition()
{
	return TRUE;
};

func void dia_pal_12_standard_info()
{
	AI_Output(other,self,"DIA_PAL_12_STANDARD_15_00");	//Jak se vede?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(KAPITEL <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_12_STANDARD_12_01");	//Teï když víme, že máme co do èinìní s draky, zaène náš velitel urèitì brzy nìco dìlat.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_12_STANDARD_12_02");	//Ještì stále nemáme žádné zprávy od našich mužù z Hornického údolí. To je velmi znepokojivé.
			};
		};
		if(KAPITEL >= 5)
		{
			AI_Output(self,other,"DIA_PAL_12_STANDARD_12_03");	//Díky Innosovi! Draèí hrozba byla zažehnána. Teï už se musíme jen vypoøádat s tìmi skøety a cesta k rudì je volná.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_12_STANDARD_12_04");	//Ty ve skuteènosti nechceš, abych ti na tu otázku odpovìdìl, hochu!
	};
};

func void b_assignambientinfos_pal_12(var C_NPC slf)
{
	dia_pal_12_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_standard.npc = Hlp_GetInstanceID(slf);
};

