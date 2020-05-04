
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
	description = "Chci se st�t paladinem!";
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
	AI_Output(other,self,"DIA_PAL_12_JOIN_15_00");	//Chci se st�t paladinem!
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_01");	//Ty? Nenech se vysm�t! Je�t� nejsi ani �lenem m�stsk�ch str��.
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_02");	//Kdybych nevid�l, jakej se� tupej buran, musel bych si myslet, �e ses m� pokusil urazit.
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_03");	//Pouze ti nejlep�� z nejlep��ch v�rn�ch n�sledovn�k� kr�le a na�eho P�na Innose se mohou st�t paladiny.
};


instance DIA_PAL_12_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_pal_12_people_condition;
	information = dia_pal_12_people_info;
	permanent = TRUE;
	description = "Kdo tomu tady vel�?";
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
	AI_Output(other,self,"DIA_PAL_12_PEOPLE_15_00");	//Kdo tomu tady vel�?
	AI_Output(self,other,"DIA_PAL_12_PEOPLE_12_01");	//Ctihodn� lord Hagen. Ale v�e, co se t�k� prost�ho lidu, m� na starosti lord Andre.
	AI_Output(self,other,"DIA_PAL_12_PEOPLE_12_02");	//Najde� ho v kas�rn�ch. Mo�n� bude� m�t �t�st� a v�nuje ti p�r minut sv�ho drahocenn�ho �asu.
};


instance DIA_PAL_12_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_pal_12_location_condition;
	information = dia_pal_12_location_info;
	permanent = TRUE;
	description = "Co d�l�te vy, paladinov�, tady v Khorinisu?";
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
	AI_Output(other,self,"DIA_PAL_12_LOCATION_15_00");	//Co d�l�te vy, paladinov�, tady v Khorinisu?
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_01");	//Lidi, co maj� takov�hle ot�zky, v�t�inou skon�� na �ibenici d��v, ne� si toho sta�� v�imnout.
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_02");	//Pokud si lord Andre nem��e n�co dovolit, tak v�dom� toho, �e na�e mise byla vyzrazena.
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_03");	//No, m�l by sis d�vat v�t�� pozor, na co se pt�.
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
				AI_Output(self,other,"DIA_PAL_12_STANDARD_12_01");	//Te� kdy� v�me, �e m�me co do �in�n� s draky, za�ne n� velitel ur�it� brzy n�co d�lat.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_12_STANDARD_12_02");	//Je�t� st�le nem�me ��dn� zpr�vy od na�ich mu�� z Hornick�ho �dol�. To je velmi znepokojiv�.
			};
		};
		if(KAPITEL >= 5)
		{
			AI_Output(self,other,"DIA_PAL_12_STANDARD_12_03");	//D�ky Innosovi! Dra�� hrozba byla za�ehn�na. Te� u� se mus�me jen vypo��dat s t�mi sk�ety a cesta k rud� je voln�.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_12_STANDARD_12_04");	//Ty ve skute�nosti nechce�, abych ti na tu ot�zku odpov�d�l, hochu!
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

