
instance DIA_MIL_6_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_mil_6_exit_condition;
	information = dia_mil_6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_6_exit_condition()
{
	return TRUE;
};

func void dia_mil_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_6_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_mil_6_join_condition;
	information = dia_mil_6_join_info;
	permanent = TRUE;
	description = "Co mus�m ud�lat, aby m� vzali do domobrany?";
};


func int dia_mil_6_join_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_mil_6_join_info()
{
	AI_Output(other,self,"DIA_MIL_6_JOIN_15_00");	//Co mus�m ud�lat, aby m� vzali do domobrany?
	AI_Output(self,other,"DIA_MIL_6_JOIN_06_01");	//Zajdi za lordem Andrem a promluv si s n�m. Od chv�le, kdy do m�sta dorazili paladinov�, vel� cel� domobran� on.
	if(c_npcisinquarter(self) != Q_KASERNE)
	{
		AI_Output(self,other,"DIA_MIL_6_JOIN_06_02");	//Najde� ho v kas�rn�ch. Je tam vlastn� po��d.
	};
};


instance DIA_ADDON_MIL_6_MISSINGPEOPLE(C_INFO)
{
	nr = 2;
	condition = dia_addon_mil_6_missingpeople_condition;
	information = dia_addon_mil_6_missingpeople_info;
	permanent = TRUE;
	description = "Sly�el jsem, �e n�kte�� obyvatel� zmizeli.";
};


func int dia_addon_mil_6_missingpeople_condition()
{
	if((KAPITEL == 1) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_mil_6_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_MIL_6_MissingPeople_15_00");	//Sly�el jsem, �e n�kte�� obyvatel� zmizeli.
	AI_Output(self,other,"DIA_Addon_MIL_6_MissingPeople_06_01");	//Vskutku - v posledn�ch dnech jsme zaznamenali mizen� lid� celkem �asto.
	AI_Output(self,other,"DIA_Addon_MIL_6_MissingPeople_06_02");	//Nem��u ti to vysv�tlit tak, jak bych cht�l.
	AI_Output(self,other,"DIA_Addon_MIL_6_MissingPeople_06_03");	//Nicm�n� nem��eme ud�lat v�c ne� m�t o�i otev�en� a st�t na str�i.
};


instance DIA_MIL_6_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_mil_6_people_condition;
	information = dia_mil_6_people_info;
	permanent = TRUE;
	description = "�ekni mi n�co o t�ch paladinech.";
};


func int dia_mil_6_people_condition()
{
	if(hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_mil_6_people_info()
{
	AI_Output(other,self,"DIA_MIL_6_PEOPLE_15_00");	//�ekni mi n�co o t�ch paladinech.
	AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_01");	//Jakmile p�ijeli do Khorinisu, obsadili horn� ��st m�sta.
	AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_02");	//Nikoho dal��ho u� tam necht�j� pou�t�t. Samoz�ejm� krom� ob�an� m�sta a domobrany.
	AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_03");	//Tak� tu je n�kolik paladin�, kte�� hl�daj� jejich lo� dole v p��stavu. Ale ti maj� do ukecanosti hodn� daleko.
};


instance DIA_MIL_6_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_mil_6_location_condition;
	information = dia_mil_6_location_info;
	permanent = TRUE;
	description = "Co bych m�l v�d�t o tomhle m�st�?";
};


func int dia_mil_6_location_condition()
{
	return TRUE;
};

func void dia_mil_6_location_info()
{
	AI_Output(other,self,"DIA_MIL_6_LOCATION_15_00");	//Co bych m�l v�d�t o tomhle m�st�?
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_01");	//Paladinov� p�evzali kontrolu nad cel�m m�stem. Zodpov�daj� se jim i v�ichni �lenov� domobrany.
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_02");	//Lord Andre je velitel domobrany - a z�rove� zast�v� i funkci soudce.
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_03");	//Pokud by ses snad n�kdy dostal do konfliktu se z�konem, bude� se muset ospravedlnit p��mo p�ed n�m.
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_04");	//Ale ke �len�m vojska je docela shov�vav�. Obvykle to vy�e�� n�jak� pokuta.
};


instance DIA_MIL_6_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_mil_6_standard_condition;
	information = dia_mil_6_standard_info;
	permanent = TRUE;
	description = "Co je nov�ho?";
};


func int dia_mil_6_standard_condition()
{
	return TRUE;
};

func void dia_mil_6_standard_info()
{
	AI_Output(other,self,"DIA_MIL_6_STANDARD_15_00");	//Co je nov�ho?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_01");	//Do m�sta se posledn� dobou stahuje v�c a v�c l�zy.
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_02");	//Loupe�e se pomalu st�vaj� b�nou z�le�itost� a lord Andre to p�i��t� na vrub n�jak� v�t�� skupiny.
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_03");	//Nen� to tak dlouho, co jsme vy�istili celou p��stavn� �tvr�, ale nena�li jsme ani jedinou ukradenou v�c.
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_04");	//Vypad� to, �e te� m�me probl�m s lupi�i v�ce m�n� pod kontrolou. P�epady se dot�kaly �pln� v�ech, ale ned�vno to ustalo.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_05");	//Od t� doby, co se l�za stahuje do m�sta, to jde od des�ti k p�ti. Minulou noc jsem v horn� ��sti m�sta sledoval mu�e v �ern� r�b�.
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_06");	//Jsem si jist, �e nem�l za lubem nic dobr�ho. Ale kdy� jsem za n�m �el kolem domu m�stodr��c�ho, prost� zmizel. Pochybn� existence, kter�...
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_07");	//��k� se, �e lord Hagen najal �oldn��e na boj proti drak�m. Mn� to docela vyhovuje, necht�l bych s t�ma potvorama bojovat s�m osobn�.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_08");	//Pov�d� se, �e se ty draky poda�ilo porazit! Lord Hagen shroma��uje svoje mu�e, aby Hornick� �dol� zbavili i v�ech ostatn�ch nestv�r.
	};
};

func void b_assignambientinfos_mil_6(var C_NPC slf)
{
	dia_mil_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_join.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_people.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_location.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_standard.npc = Hlp_GetInstanceID(slf);
};

