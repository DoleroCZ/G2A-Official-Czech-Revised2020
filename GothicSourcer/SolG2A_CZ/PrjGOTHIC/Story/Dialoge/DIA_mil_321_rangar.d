
instance DIA_RANGAR_EXIT(C_INFO)
{
	npc = mil_321_rangar;
	nr = 999;
	condition = dia_rangar_exit_condition;
	information = dia_rangar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rangar_exit_condition()
{
	return TRUE;
};

func void dia_rangar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RANGAR_PICKPOCKET(C_INFO)
{
	npc = mil_321_rangar;
	nr = 900;
	condition = dia_rangar_pickpocket_condition;
	information = dia_rangar_pickpocket_info;
	permanent = TRUE;
	description = "(Tenhle kl�� lze snadno ukr�st)";
};


func int dia_rangar_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_city_tower_02) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_rangar_pickpocket_info()
{
	Info_ClearChoices(dia_rangar_pickpocket);
	Info_AddChoice(dia_rangar_pickpocket,DIALOG_BACK,dia_rangar_pickpocket_back);
	Info_AddChoice(dia_rangar_pickpocket,DIALOG_PICKPOCKET,dia_rangar_pickpocket_doit);
};

func void dia_rangar_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itke_city_tower_02,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_rangar_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_rangar_pickpocket_back()
{
	Info_ClearChoices(dia_rangar_pickpocket);
};


instance DIA_RANGAR_HALLO(C_INFO)
{
	npc = mil_321_rangar;
	nr = 2;
	condition = dia_rangar_hallo_condition;
	information = dia_rangar_hallo_info;
	permanent = FALSE;
	description = "Zdar, jak se vede?";
};


func int dia_rangar_hallo_condition()
{
	if(((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) == FALSE) && ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rangar_hallo_info()
{
	AI_Output(other,self,"DIA_Rangar_Hallo_15_00");	//Zdar, jak se vede?
	AI_Output(self,other,"DIA_Rangar_Hallo_07_01");	//Ne� mi paladinov� daj� n�jak� dal�� p��kazy, m��u si tady v klidu d�t n�kolik piv. Co v�c by si jeden mohl p��t? (za�kleb� se)
	AI_Output(other,self,"DIA_Rangar_Hallo_15_02");	//Pracuje� pro paladiny?
	AI_Output(self,other,"DIA_Rangar_Hallo_07_03");	//Jo, pod�v�m jim hl�en� o d�n� ve m�st�. Moment�ln� je tady docela klid.
};


instance DIA_RANGAR_ORK(C_INFO)
{
	npc = mil_321_rangar;
	nr = 3;
	condition = dia_rangar_ork_condition;
	information = dia_rangar_ork_info;
	permanent = FALSE;
	description = "Jak to vypad� se sk�ety?";
};


func int dia_rangar_ork_condition()
{
	if(Npc_KnowsInfo(other,dia_rangar_hallo) && ((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) == FALSE) && ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rangar_ork_info()
{
	AI_Output(other,self,"DIA_Rangar_Ork_15_00");	//Jak to vypad� se sk�ety?
	AI_Output(self,other,"DIA_Rangar_Ork_07_01");	//Nen� d�vod si d�lat t�kou hlavu - my z m�stsk� str�e a paladinov� m�me v�echno pod kontrolou.
	AI_Output(self,other,"DIA_Rangar_Ork_07_02");	//B� dom� a nech n�s d�lat na�i pr�ci. Dohl��me na m�sto a jeho ob�any. -�KYT-
};


instance DIA_RANGAR_BIER(C_INFO)
{
	npc = mil_321_rangar;
	nr = 4;
	condition = dia_rangar_bier_condition;
	information = dia_rangar_bier_info;
	permanent = TRUE;
	description = "Dal by sis je�t� pivo?";
};


func int dia_rangar_bier_condition()
{
	if(Npc_KnowsInfo(other,dia_rangar_hallo) && ((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) == FALSE) && ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rangar_bier_info()
{
	AI_Output(other,self,"DIA_Rangar_Bier_15_00");	//Dal by sis je�t� pivo?
	if(b_giveinvitems(other,self,itfo_beer,1))
	{
		if(KNOWS_PALADINS == FALSE)
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_01");	//��� - nic se nevyrovn� spr�vn� vychlazen�mu pivku.
			CreateInvItems(self,itfo_booze,1);
			b_useitem(self,itfo_booze);
			AI_Output(other,self,"DIA_Rangar_Bier_15_02");	//Chystal ses ��ct n�co o sk�etech.
			AI_Output(self,other,"DIA_Rangar_Bier_07_03");	//Jo, no jo, jasn�. Sk�eti nep�edstavuj� pro m�sto v�bec ��dnou hrozbu.
			AI_Output(self,other,"DIA_Rangar_Bier_07_04");	//Obsadili Hornick� �dol�. A pr�smyk dr�� paladinov�.
			AI_Output(self,other,"DIA_Rangar_Bier_07_05");	//Neproklouzne kolem nich ani my�.
			KNOWS_PALADINS = 1;
			Info_ClearChoices(dia_rangar_bier);
		}
		else if((KNOWS_PALADINS == 1) && (KNOWS_ORK == TRUE))
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_06");	//Po��dnou pintu rozhodn� neodm�tnu.
			CreateInvItems(self,itfo_booze,1);
			b_useitem(self,itfo_booze);
			AI_Output(other,self,"DIA_Rangar_Bier_15_07");	//Dokonce vid�li sk�eta hned za m�stem.
			AI_Output(self,other,"DIA_Rangar_Bier_07_08");	//No jo, jasn�, nebezpe�n� sk�et za m�stem. Opravdu p��ern� sk�et. Ur�it� co nevid�t za�to�� na m�sto.
			AI_Output(self,other,"DIA_Rangar_Bier_07_09");	//Poslouchej, toho tlust�ho sk�eta nakopeme do toho jeho tlust�ho zadku ve chv�li, kdy se moc p�ibl�� k m�stu. Jasan?
			AI_Output(other,self,"DIA_Rangar_Bier_15_10");	//Aha.
			KNOWS_PALADINS = 2;
			Info_ClearChoices(dia_rangar_bier);
		}
		else
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_11");	//Dobr� ho�k� pivko je to nejlep��, co m��e b�t.
			CreateInvItems(self,itfo_booze,1);
			b_useitem(self,itfo_booze);
			AI_Output(self,other,"DIA_Rangar_Bier_07_12");	//V�, nenaraz� �asto na n�koho, kdo by t� pozval na pivo. Jsi docela fajn.
			Info_ClearChoices(dia_rangar_bier);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Rangar_Bier_07_13");	//Jasn�, �e si je�t� d�m pivo. Jedno pro m�.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_RANGAR_ERWISCHT(C_INFO)
{
	npc = mil_321_rangar;
	nr = 5;
	condition = dia_addon_rangar_erwischt_condition;
	information = dia_addon_rangar_erwischt_info;
	description = "Co tady d�l�?";
};


var int dia_addon_rangar_erwischt_onetime;

func int dia_addon_rangar_erwischt_condition()
{
	if((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) && (DIA_ADDON_RANGAR_ERWISCHT_ONETIME == FALSE) && (MIS_ADDON_MARTIN_GETRANGAR == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_rangar_erwischt_info()
{
	AI_Output(other,self,"DIA_Addon_Rangar_Erwischt_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Addon_Rangar_Erwischt_07_01");	//(c�t� se p�isti�en) Eeehm. J�...eh..to t� nemus� zaj�mat. Ztra� se.
	AI_Output(other,self,"DIA_Addon_Rangar_Erwischt_15_02");	//Martin bude r�d, a� mu pov�m, kdo se ��oural v jeho v�cech mezi t�m, co byl pry�.
	AI_Output(self,other,"DIA_Addon_Rangar_Erwischt_07_03");	//(v�sm�n�) Ud�lej, co chce�. P�jdu je�t� jednou, chlap�e.
	b_giveplayerxp(XP_ADDON_MARTIN_GOTRANGAR);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	SC_GOTRANGAR = TRUE;
};


instance DIA_ADDON_RANGAR_NACHHAKEN(C_INFO)
{
	npc = mil_321_rangar;
	nr = 2;
	condition = dia_addon_rangar_nachhaken_condition;
	information = dia_addon_rangar_nachhaken_info;
	permanent = TRUE;
	description = "Asi si mysl�, �e t� nech�m uniknout trestu?";
};


func int dia_addon_rangar_nachhaken_condition()
{
	if((SC_GOTRANGAR == TRUE) && (MIS_ADDON_MARTIN_GETRANGAR == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_rangar_nachhaken_info()
{
	AI_Output(other,self,"DIA_Addon_Rangar_nachhaken_15_00");	//Asi si mysl�, �e t� nech�m uniknout trestu?
	AI_Output(self,other,"DIA_Addon_Rangar_nachhaken_07_01");	//(lhostejn�) Ned�lej tak velk� d�sledky kv�li tro�ce z�sob a potravin.
};

