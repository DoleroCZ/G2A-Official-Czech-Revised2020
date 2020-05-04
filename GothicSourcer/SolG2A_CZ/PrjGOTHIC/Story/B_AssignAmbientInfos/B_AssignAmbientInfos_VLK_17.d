
instance DIA_VLK_17_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_vlk_17_exit_condition;
	information = dia_vlk_17_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vlk_17_exit_condition()
{
	return TRUE;
};

func void dia_vlk_17_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_17_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_vlk_17_join_condition;
	information = dia_vlk_17_join_info;
	permanent = TRUE;
	description = "Co mus�m ud�lat, abych se mohl st�t ob�anem m�sta?";
};


func int dia_vlk_17_join_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_vlk_17_join_info()
{
	AI_Output(other,self,"DIA_VLK_17_JOIN_15_00");	//Co mus�m ud�lat, abych se mohl st�t ob�anem m�sta?
	AI_Output(self,other,"DIA_VLK_17_JOIN_17_01");	//Tady v Khorinisu maj� velk� slovo �emeslni�t� mist�i z doln� ��sti m�sta. M�l by sis s jedn�m z nich promluvit.
};


instance DIA_VLK_17_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_17_people_condition;
	information = dia_vlk_17_people_info;
	permanent = TRUE;
	description = "Kdo v tomhle m�st� po��v� nejv�t�� v�nosti?";
};


func int dia_vlk_17_people_condition()
{
	return TRUE;
};

func void dia_vlk_17_people_info()
{
	AI_Output(other,self,"DIA_VLK_17_PEOPLE_15_00");	//Kdo v tomhle m�st� po��v� nejv�t�� v�nosti?
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_01");	//Jakmile dorazili paladinov� do m�sta, p�evzali velen� nad cel�m Khorinisem.
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_02");	//Lord Andre tu p�edstavuje z�kon. Nalezne� ho v kas�rn�ch.
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_03");	//Ale smysl k n�mu m� chodit jen tehdy, pokud se dostane� do konfliktu se z�konem nebo se bude� cht�t p�idat k domobran�.
};


instance DIA_VLK_17_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_17_location_condition;
	information = dia_vlk_17_location_info;
	permanent = TRUE;
	description = "Co je tady v Khorinisu nejzaj�mav�j��?";
};


func int dia_vlk_17_location_condition()
{
	return TRUE;
};

func void dia_vlk_17_location_info()
{
	AI_Output(other,self,"DIA_VLK_17_LOCATION_15_00");	//Co je tady v Khorinisu nejzaj�mav�j��?
	AI_Output(self,other,"DIA_VLK_17_LOCATION_17_01");	//(sm�ch) Mo�n� by ses na to m�l rad�ji zeptat n�jak�ho chlapa. Pokud m� na mysli z�bavu, zkus se pod�vat do p��stavu.
	AI_Output(self,other,"DIA_VLK_17_LOCATION_17_02");	//Ale pokud chce� n�co koupit, zajdi na trh u v�chodn� br�ny nebo do doln� ��sti m�sta.
};


instance DIA_VLK_17_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_17_standard_condition;
	information = dia_vlk_17_standard_info;
	permanent = TRUE;
	description = "Co je nov�ho?";
};


func int dia_vlk_17_standard_condition()
{
	return TRUE;
};

func void dia_vlk_17_standard_info()
{
	AI_Output(other,self,"DIA_VLK_17_STANDARD_15_00");	//Co je nov�ho?
	if((KAPITEL == 1) || (KAPITEL == 2))
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_01");	//Zaj�malo by m�, pro� tady ti paladinov� vlastn� jsou. Zabrali radnici, kas�rna i p��stav, ale zat�m neud�lali v�bec nic.
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_02");	//Pokud p�ijeli kv�li sk�et�m a bandit�m, m�li zakro�it u� p�ed drahnou dobou. Mus� m�t je�t� jin� d�vod.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_03");	//U� mi do�lo, pro� tu ti paladinov� jsou - je to kv�li rud�. Ud�lali by l�p, kdyby m�sto toho rad�ji br�nili na�e m�sto.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_04");	//Douf�m, �e je na t�ch dra��ch pov�da�k�ch n�co pravdy. V tom p��pad� toti� bude muset lord Hagen za��t n�co d�lat. Nem��e n�s p�ece jen tak nechat drak�m napospas.
	};
	if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_05");	//Te�, kdy� jsou ti draci mrtv�, zato�� paladinov� snadno i ostatn�m ne��dstvem.
	};
};

func void b_assignambientinfos_vlk_17(var C_NPC slf)
{
	dia_vlk_17_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_standard.npc = Hlp_GetInstanceID(slf);
};

