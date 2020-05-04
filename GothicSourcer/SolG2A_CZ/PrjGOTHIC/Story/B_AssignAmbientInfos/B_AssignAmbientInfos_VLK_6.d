
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
	description = "Jak se m��u st�t ob�anem tohoto m�sta?";
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
	AI_Output(other,self,"DIA_VLK_6_JOIN_15_00");	//Jak se m��u st�t ob�anem tohoto m�sta?
	AI_Output(self,other,"DIA_VLK_6_JOIN_06_01");	//Chce� se tu usadit? Te�? Kdy� v�echno sm��uje ke konci sv�ta?
	AI_Output(other,self,"DIA_VLK_6_JOIN_15_02");	//Nechci tu z�stat napo��d.
	AI_Output(self,other,"DIA_VLK_6_JOIN_06_03");	//Fajn, pokud stoj� o moji radu, m�l bys odsud upalovat nejd�l, co m��e�. Ale kdy� na tom trv�, m�l by sis promluvit s jedn�m z vlivn�ch m욝an�.
};


instance DIA_VLK_6_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_6_people_condition;
	information = dia_vlk_6_people_info;
	permanent = TRUE;
	description = "Kde najdu vlivn� ob�any Khorinisu?";
};


func int dia_vlk_6_people_condition()
{
	return TRUE;
};

func void dia_vlk_6_people_info()
{
	AI_Output(other,self,"DIA_VLK_6_PEOPLE_15_00");	//Kde najdu vlivn� ob�any Khorinisu?
	AI_Output(self,other,"DIA_VLK_6_PEOPLE_06_01");	//Zkus to u kov��e nebo truhl��e v doln� ��sti m�sta. Najde� tam i n�kolik dal��ch v�en�ch mistr�.
	AI_Output(self,other,"DIA_VLK_6_PEOPLE_06_02");	//Pokud tady m� krom� m�stsk� str�e a paladin� n�kdo n�jak� slovo, jsou to tihle mu�i.
};


instance DIA_VLK_6_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_6_location_condition;
	information = dia_vlk_6_location_info;
	permanent = TRUE;
	description = "Jak se m�m ve m�st� vyznat?";
};


func int dia_vlk_6_location_condition()
{
	return TRUE;
};

func void dia_vlk_6_location_info()
{
	AI_Output(other,self,"DIA_VLK_6_LOCATION_15_00");	//Jak se m�m ve m�st� vyznat?
	AI_Output(self,other,"DIA_VLK_6_LOCATION_06_01");	//Nen� tak snadn� naj�t spr�vn� sm�r, co? Ani ty ukazatele nedok�ou pomoct �pln� v�dycky.
	AI_Output(self,other,"DIA_VLK_6_LOCATION_06_02");	//Pokud m� �patn� orienta�n� smysl, m�l bys zaj�t dol� do p��stavu - teda pokud tam tref� - a poohl�dnout se po domku kartografa.
	AI_Output(self,other,"DIA_VLK_6_LOCATION_06_03");	//Je to hned za hospodou v p��stavi�ti. Brahim pro tebe ur�it� bude n�jakou mapu m�sta m�t.
};


instance DIA_VLK_6_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_6_standard_condition;
	information = dia_vlk_6_standard_info;
	permanent = TRUE;
	description = "Co je nov�ho?";
};


func int dia_vlk_6_standard_condition()
{
	return TRUE;
};

func void dia_vlk_6_standard_info()
{
	AI_Output(other,self,"DIA_VLK_6_STANDARD_15_00");	//Co je nov�ho?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_VLK_6_STANDARD_06_01");	//Od t� doby, co bari�ra vzala za sv�, je tohle m�sto pln� bandit�. Ale paladinov� ned�laj� v�bec nic. Tak pro� tu ksakru v�bec jsou?
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_VLK_6_STANDARD_06_02");	//Posledn� dobou u� to s t�mi bandity nen� tak zl�. Skoro to vypad�, �e s t�m n�kdo za�al n�co d�lat.
	};
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_VLK_6_STANDARD_06_03");	//Nechali j�t toho mizern�ho �old�ka, co zabil paladina. Nebylo by od v�ci, kdyby ho m�sto toho rad�ji ob�sili.
		}
		else
		{
			AI_Output(self,other,"DIA_VLK_6_STANDARD_06_04");	//��k� se, �e jeden z Onarov�ch �old�k� zabil paladina. Toho chl�pka chytili a uvrhli do �al��e. U� brzo se bude houpat.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_6_STANDARD_06_05");	//R�d bych v�d�l, co je na t�ch dra��ch pov�da�k�ch pravdy.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_VLK_6_STANDARD_06_06");	//��k� se, �e lord Hagen shroma��uje sv� mu�e, aby osvobodili Hornick� �dol�. Kone�n� se za�aly v�ci h�bat!
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

