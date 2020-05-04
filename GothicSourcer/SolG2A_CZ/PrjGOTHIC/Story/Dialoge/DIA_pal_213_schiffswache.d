
instance DIA_PAL_213_SCHIFFSWACHE_EXIT(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 999;
	condition = dia_pal_213_schiffswache_exit_condition;
	information = dia_pal_213_schiffswache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_213_schiffswache_exit_condition()
{
	return TRUE;
};

func void dia_pal_213_schiffswache_exit_info()
{
	AI_StopProcessInfos(self);
};


const string PAL_213_CHECKPOINT = "SHIP_DECK_09";

instance DIA_PAL_213_SCHIFFSWACHE_FIRSTWARN(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 1;
	condition = dia_pal_213_schiffswache_firstwarn_condition;
	information = dia_pal_213_schiffswache_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_213_schiffswache_firstwarn_condition()
{
	if((MIS_SHIPISFREE == FALSE) && (self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_firstwarn_info()
{
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_FirstWarn_01_00");	//Po�kej! Kam si mysl�, �e jde�?
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_FirstWarn_15_01");	//Cht�l jsem...
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_FirstWarn_01_02");	//Je n�m l�to. Tudy neprojde�.
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_FirstWarn_01_03");	//Tady nen� nic k vid�n�. Pokra�uj.
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PAL_213_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};


instance DIA_PAL_213_SCHIFFSWACHE_SECONDWARN(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 2;
	condition = dia_pal_213_schiffswache_secondwarn_condition;
	information = dia_pal_213_schiffswache_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_213_schiffswache_secondwarn_condition()
{
	if((MIS_SHIPISFREE == FALSE) && (self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PAL_213_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_secondwarn_info()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_SecondWarn_01_00");	//Ani o krok d�l. Bez v�jimek.
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_SecondWarn_01_01");	//Nechce� m� snad NUTIT, abych ti ubl�il, ne?
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PAL_213_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_213_SCHIFFSWACHE_ATTACK(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 3;
	condition = dia_pal_213_schiffswache_attack_condition;
	information = dia_pal_213_schiffswache_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_213_schiffswache_attack_condition()
{
	if((MIS_SHIPISFREE == FALSE) && (self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PAL_213_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,1);
};


instance DIA_PAL_213_SCHIFFSWACHE_GOONBOARD(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 5;
	condition = dia_pal_213_schiffswache_goonboard_condition;
	information = dia_pal_213_schiffswache_goonboard_info;
	permanent = FALSE;
	description = "R�d bych se dostal na tu lo�.";
};


func int dia_pal_213_schiffswache_goonboard_condition()
{
	return TRUE;
};

func void dia_pal_213_schiffswache_goonboard_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_GoOnBoard_15_00");	//R�d bych se dostal na tu lo�.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_01");	//Nikdo nesm� vstoupit na palubu! M�m sv� rozkazy!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_02");	//Zabiju ka�d�ho, kdo bez povolen� vstoup� na lo�.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_03");	//Ve jm�n� Innosov�, budu lo� chr�nit sv�m vlastn�m �ivotem.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf_condition;
	information = dia_pal_213_schiffswache_iamkdf_info;
	permanent = FALSE;
	description = "Ty zpochyb�uje� p��n� m�g� ohn�?";
};


func int dia_pal_213_schiffswache_iamkdf_condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_goonboard))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdf_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF_15_00");	//Ty zpochyb�uje� p��n� m�g� ohn�?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_01");	//(nerv�zn�) Ne, to samoz�ejm� ne. Snad mi Innos odpust�.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_02");	//(nerv�zn�) Ohniv� m�gov� jsou str�ci Innosovy moudrosti...
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_03");	//(nerv�zn�)... a kdo pochybuje o jejich �inech, pochybuje o Innosovi a nezaslou�� si slitov�n�.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF2(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf2_condition;
	information = dia_pal_213_schiffswache_iamkdf2_info;
	permanent = FALSE;
	description = "Co se stane, kdy� p�jdu na palubu?";
};


func int dia_pal_213_schiffswache_iamkdf2_condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdf))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdf2_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF2_15_00");	//Co se stane, kdy� p�jdu na palubu?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF2_01_01");	//(nerv�zn�) Zabiju... tedy, zastav�m t�.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF3(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf3_condition;
	information = dia_pal_213_schiffswache_iamkdf3_info;
	permanent = FALSE;
	description = "Ty bys za�to�il na m�ga ohn�?";
};


func int dia_pal_213_schiffswache_iamkdf3_condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdf2))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdf3_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF3_15_00");	//Ty bys za�to�il na m�ga ohn�?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF3_01_01");	//(nerv�zn�) Nikdy bych nevzt�hl ruku na m�ga.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF3_15_02");	//Tak�e co by se stalo, kdybych �el na palubu?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF3_01_03");	//(pokorn�) Nic, pane.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF4(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf4_condition;
	information = dia_pal_213_schiffswache_iamkdf4_info;
	permanent = FALSE;
	description = "P�jdu te� na palubu.";
};


func int dia_pal_213_schiffswache_iamkdf4_condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdf3))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdf4_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF4_15_00");	//P�jdu te� na palubu.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF4_01_01");	//(nerv�zn�) To nesm�, rozkazy lorda Hagena byly v tomto sm�ru naprosto jasn�.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF5(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf5_condition;
	information = dia_pal_213_schiffswache_iamkdf5_info;
	permanent = FALSE;
	description = "Vztahuj� se rozkazy lorda Hagena i na m�?";
};


func int dia_pal_213_schiffswache_iamkdf5_condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdf4))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdf5_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF5_15_00");	//Vztahuj� se rozkazy lorda Hagena i na m�?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF5_01_01");	//(nerv�zn�) To nev�m.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF5_15_02");	//Zkus p�em��let - dovolil by si snad lord Hagen podez�rat m�ga z kr�de�e?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF5_01_03");	//Tomu nev���m.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF6(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf6_condition;
	information = dia_pal_213_schiffswache_iamkdf6_info;
	permanent = FALSE;
	description = "Tak�e naposledy: Pus� m� na tu lo�!";
};


func int dia_pal_213_schiffswache_iamkdf6_condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdf5))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdf6_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF6_15_00");	//Tak�e naposledy: Pus� m� na tu lo�!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF6_01_01");	//(nerv�zn�) Rozum�m. M��e� na palubu.
	MIS_SHIPISFREE = TRUE;
	b_startotherroutine(girion,"WaitForShip");
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMPAL(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iampal_condition;
	information = dia_pal_213_schiffswache_iampal_info;
	permanent = FALSE;
	description = "Copak mi nev���, ryt��i?";
};


func int dia_pal_213_schiffswache_iampal_condition()
{
	if((hero.guild == GIL_PAL) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_goonboard))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iampal_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmPAL_15_00");	//Copak mi nev���, ryt��i?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmPAL_01_01");	//To ne, ale pln�m sv� rozkazy.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMPAL2(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iampal2_condition;
	information = dia_pal_213_schiffswache_iampal2_info;
	permanent = FALSE;
	description = "Pak bys asi m�l v�d�t, kdo z n�s m� vy��� hodnost.";
};


func int dia_pal_213_schiffswache_iampal2_condition()
{
	if((hero.guild == GIL_PAL) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iampal))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iampal2_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmPAL2_15_00");	//Pak bys asi m�l v�d�t, kdo z n�s m� vy��� hodnost.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmPAL2_01_01");	//Ano, pane!
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMPAL3(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iampal3_condition;
	information = dia_pal_213_schiffswache_iampal3_info;
	permanent = FALSE;
	description = "T�mto ti p�ikazuj�, abys mi umo�nil vstup na lo�.";
};


func int dia_pal_213_schiffswache_iampal3_condition()
{
	if((hero.guild == GIL_PAL) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iampal2))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iampal3_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmPAL3_15_00");	//T�mto ti p�ikazuj�, abys mi umo�nil vstup na lo�.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmPAL3_01_01");	//Rozum�m, pane, vstup povolen.
	MIS_SHIPISFREE = TRUE;
	b_startotherroutine(girion,"WaitForShip");
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMDJG(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamdjg_condition;
	information = dia_pal_213_schiffswache_iamdjg_info;
	permanent = FALSE;
	description = "A ne�lo by s t�m n�co ud�lat?";
};


func int dia_pal_213_schiffswache_iamdjg_condition()
{
	if((hero.guild == GIL_DJG) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_goonboard))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamdjg_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmDJG_15_00");	//A ne�lo by s t�m n�co ud�lat?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG_01_01");	//Asi ti nerozum�m.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMDJG2(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamdjg2_condition;
	information = dia_pal_213_schiffswache_iamdjg2_info;
	permanent = FALSE;
	description = "Mohl bych ti d�t n�jak� pen�ze. Za to, �e se bude� zrovna d�vat na druhou stranu.";
};


func int dia_pal_213_schiffswache_iamdjg2_condition()
{
	if((hero.guild == GIL_DJG) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamdjg))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamdjg2_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmDJG2_15_00");	//Mohl bych ti d�t n�jak� pen�ze. Za to, �e se bude� zrovna d�vat na druhou stranu.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG2_01_01");	//Nen� mo�n� m� uplatit, a jestli okam�it� nezmiz�, budu to br�t jako ur�ku.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMDJG3(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamdjg3_condition;
	information = dia_pal_213_schiffswache_iamdjg3_info;
	permanent = FALSE;
	description = "M�m povolen�. M��u na palubu t� lodi vstoupit.";
};


func int dia_pal_213_schiffswache_iamdjg3_condition()
{
	if((hero.guild == GIL_DJG) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamdjg) && (Npc_HasItems(other,itwr_forgedshipletter_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamdjg3_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmDJG3_15_00");	//M�m povolen�. M��u na palubu t� lodi vstoupit.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG3_01_01");	//Uka� mi ho.
	b_giveinvitems(other,self,itwr_forgedshipletter_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG3_01_02");	//Dobr�, m��e� j�t.
	MIS_SHIPISFREE = TRUE;
	b_startotherroutine(girion,"WaitForShip");
};

