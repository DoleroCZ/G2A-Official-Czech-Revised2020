
instance DIA_MARIA_EXIT(C_INFO)
{
	npc = bau_910_maria;
	nr = 999;
	condition = dia_maria_exit_condition;
	information = dia_maria_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maria_exit_condition()
{
	return TRUE;
};

func void dia_maria_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARIA_HALLO(C_INFO)
{
	npc = bau_910_maria;
	nr = 1;
	condition = dia_maria_hallo_condition;
	information = dia_maria_hallo_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int dia_maria_hallo_condition()
{
	return TRUE;
};

func void dia_maria_hallo_info()
{
	AI_Output(other,self,"DIA_Maria_Hallo_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Maria_Hallo_17_01");	//Jsem Onarova �ena, Maria.
	AI_Output(self,other,"DIA_Maria_Hallo_17_02");	//Co tady chce�?
};


instance DIA_MARIA_UMSEHEN(C_INFO)
{
	npc = bau_910_maria;
	nr = 2;
	condition = dia_maria_umsehen_condition;
	information = dia_maria_umsehen_info;
	permanent = FALSE;
	description = "Jen jsem si to cht�l tady prohl�dnout.";
};


func int dia_maria_umsehen_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_hallo))
	{
		return TRUE;
	};
};

func void dia_maria_umsehen_info()
{
	AI_Output(other,self,"DIA_Maria_Umsehen_15_00");	//Jen jsem si to cht�l tady prohl�dnout.
	AI_Output(self,other,"DIA_Maria_Umsehen_17_01");	//S tolika chlapama na farm� se te� nem��u uvnit� domu moc zdr�ovat.
	AI_Output(self,other,"DIA_Maria_Umsehen_17_02");	//Prost� sem jen tak vpadli.
};


instance DIA_MARIA_SOELDNER(C_INFO)
{
	npc = bau_910_maria;
	nr = 3;
	condition = dia_maria_soeldner_condition;
	information = dia_maria_soeldner_info;
	permanent = FALSE;
	description = "Obt�uj� t� ti �old�ci?";
};


func int dia_maria_soeldner_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_umsehen))
	{
		return TRUE;
	};
};

func void dia_maria_soeldner_info()
{
	AI_Output(other,self,"DIA_Maria_Soeldner_15_00");	//Obt�uj� t� ti �old�ci?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_01");	//Hele, zapome� na to, co jsem pr�v� �ekla - je tu te� mnohem bezpe�n�ji, co se ti chlapi objevili.
	}
	else
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_02");	//No, p�inejmen��m je tu te�, co jsou tu �old�ci, mnohem bezpe�n�ji.
	};
	AI_Output(self,other,"DIA_Maria_Soeldner_17_03");	//Dokud jsme tu byli sami, poka�d� p�i�la domobrana z m�sta a sebrala na�i �rodu.
	AI_Output(self,other,"DIA_Maria_Soeldner_17_04");	//Sebrali nejlep�� ��st �rody. A taky si vzali p�r ovc�. Nedali n�m za to v�bec nic.
	AI_Output(self,other,"DIA_Maria_Soeldner_17_05");	//N�kte�� z t�ch ni�em� se tu dokonce odv�ili kr�st.
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_06");	//Nevysv�tluj si to nijak zle, voj�ku. V�m, �e takov� nejsou v�ichni.
	};
};


instance DIA_MARIA_MISSION(C_INFO)
{
	npc = bau_910_maria;
	nr = 4;
	condition = dia_maria_mission_condition;
	information = dia_maria_mission_info;
	permanent = FALSE;
	description = "Tak co ti ukradli?";
};


func int dia_maria_mission_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_soeldner) && (MIS_MARIA_BRINGPLATE != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_maria_mission_info()
{
	AI_Output(other,self,"DIA_Maria_Mission_15_00");	//Tak co ti ukradli?
	AI_Output(self,other,"DIA_Maria_Mission_17_01");	//V�t�inou zlato a st��bro. Taky n�m sebrali svatebn� dar. Zlat� t�c.
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Maria_Mission_17_02");	//Vsad�m se, �e te� se na n�m usazuje prach v truhle n�jak�ho mizern�ho m�stsk�ho str�n�ho.
	};
	MIS_MARIA_BRINGPLATE = LOG_RUNNING;
};


instance DIA_MARIA_BRINGPLATE(C_INFO)
{
	npc = bau_910_maria;
	nr = 5;
	condition = dia_maria_bringplate_condition;
	information = dia_maria_bringplate_info;
	permanent = FALSE;
	description = "M�m u sebe zlat� tal��. Nen� n�hodou tv�j?";
};


func int dia_maria_bringplate_condition()
{
	if(Npc_HasItems(other,itmi_mariasgoldplate) > 0)
	{
		return TRUE;
	};
};

func void dia_maria_bringplate_info()
{
	b_giveinvitems(other,self,itmi_mariasgoldplate,1);
	AI_Output(other,self,"DIA_Maria_BringPlate_15_00");	//M�m u sebe zlat� tal��. Nen� n�hodou tv�j?
	AI_Output(self,other,"DIA_Maria_BringPlate_17_01");	//Ano! To je on! Tis�cer� d�ky!
	MIS_MARIA_BRINGPLATE = LOG_SUCCESS;
	b_giveplayerxp(XP_MARIA_TELLER);
};


var int maria_belohnung;

instance DIA_MARIA_BELOHNUNG(C_INFO)
{
	npc = bau_910_maria;
	nr = 6;
	condition = dia_maria_belohnung_condition;
	information = dia_maria_belohnung_info;
	permanent = TRUE;
	description = "A co takhle n�jakou odm�nu?";
};


func int dia_maria_belohnung_condition()
{
	if((MIS_MARIA_BRINGPLATE == LOG_SUCCESS) && (MARIA_BELOHNUNG == FALSE))
	{
		return TRUE;
	};
};

func void dia_maria_belohnung_info()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_15_00");	//A co takhle n�jakou odm�nu?
	if((other.guild == GIL_SLD) || Npc_KnowsInfo(other,dia_onar_howmuch))
	{
		AI_Output(self,other,"DIA_Maria_Belohnung_17_01");	//Pracuje� pro m�ho man�ela jako �oldn��, ne?
		AI_Output(other,self,"DIA_Maria_Belohnung_15_02");	//Spr�vn�.
		AI_Output(self,other,"DIA_Maria_Belohnung_17_03");	//Kolik ti plat�?
		b_say_gold(other,self,SOLD);
		AI_Output(self,other,"DIA_Maria_Belohnung_17_04");	//To tedy moc nen�. Zajdi za n�m a �ekni mu, a� ti p�id�.
		AI_Output(other,self,"DIA_Maria_Belohnung_15_05");	//A mysl�, �e to ud�l�?
		AI_Output(self,other,"DIA_Maria_Belohnung_17_06");	//V�, co by se stalo, kdyby ne. V�� mi.
		MARIA_MEHRGOLD = TRUE;
		MARIA_BELOHNUNG = TRUE;
	}
	else if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Maria_Belohnung_17_07");	//Chce� se tady na farm� nechat najmout jako �old�k?
		Info_ClearChoices(dia_maria_belohnung);
		Info_AddChoice(dia_maria_belohnung,"Ne - v�n� ne.",dia_maria_belohnung_gold);
		Info_AddChoice(dia_maria_belohnung,"Ano.",dia_maria_belohnung_sold);
	}
	else
	{
		b_giveinvitems(self,other,itmi_gold,50);
		MARIA_BELOHNUNG = TRUE;
		AI_Output(self,other,"DIA_Maria_Belohnung_17_08");	//Tady, vezmi si to. Zaslou�� si to.
	};
};

func void dia_maria_belohnung_gold()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_Gold_15_00");	//Ne - v�n� ne.
	b_giveinvitems(self,other,itmi_gold,50);
	MARIA_BELOHNUNG = TRUE;
	AI_Output(self,other,"DIA_Maria_Belohnung_Gold_17_01");	//Tak si na opl�tku vezmi tohle zlato. Zaslou�il sis to.
	Info_ClearChoices(dia_maria_belohnung);
};

func void dia_maria_belohnung_sold()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_SOLD_15_00");	//Ano.
	AI_Output(self,other,"DIA_Maria_Belohnung_SOLD_17_01");	//Dobr�, pokud tady pracuje�, tak dohl�dnu na to, abys dost�val slu�n� �old.
	AI_Output(self,other,"DIA_Maria_Belohnung_SOLD_17_02");	//Vra� se, a� si s m�m man�elem promluv� o tv�m platu.
	Info_ClearChoices(dia_maria_belohnung);
};


instance DIA_MARIA_ABOUTONAR(C_INFO)
{
	npc = bau_910_maria;
	nr = 7;
	condition = dia_maria_aboutonar_condition;
	information = dia_maria_aboutonar_info;
	permanent = FALSE;
	description = "�ekni mi n�co o Onarovi.";
};


func int dia_maria_aboutonar_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_hallo))
	{
		return TRUE;
	};
};

func void dia_maria_aboutonar_info()
{
	AI_Output(other,self,"DIA_Maria_AboutOnar_15_00");	//�ekni mi n�co o Onarovi.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_01");	//Je to fajn chlap. Trochu nabru�en� a hodn� netrp�liv�, ale v�ichni m�me sv� chyby.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_02");	//�ekla jsem sv�mu mu�i, pro� ty voj�ky nech� se sebou takhle zach�zet?
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_03");	//D�lej n�co, ��k�m.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_04");	//Tak najal �oldn��e. Te� se c�t�m jako uprost�ed v�lky.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_05");	//Ale mi vlastn� jsme ve v�lce, nebo ne?
};


instance DIA_MARIA_PERM(C_INFO)
{
	npc = bau_910_maria;
	nr = 8;
	condition = dia_maria_perm_condition;
	information = dia_maria_perm_info;
	permanent = FALSE;
	description = "Stalo se posledn� dobou n�co zaj�mav�ho?";
};


func int dia_maria_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_hallo))
	{
		return TRUE;
	};
};

func void dia_maria_perm_info()
{
	AI_Output(other,self,"DIA_Maria_PERM_15_00");	//Stalo se posledn� dobou n�co zaj�mav�ho?
	if(KAPITEL <= 2)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_01");	//Pro�li tudy paladinov�.
		AI_Output(self,other,"DIA_Maria_PERM_17_02");	//Nejd��v jsme si mysleli, �e p�i�li napadnout farmu, ale ve skute�nosti m�li nam��eno do Hornick�ho �dol�.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_03");	//Wasili na�apal p�ed p�r dny v noci zlod�je. Jinak je tady klid.
	};
	if(KAPITEL >= 4)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_04");	//Je to tu mnohem klidn�j��, co n�kte�� ze �oldn��� ode�li.
	};
};


instance DIA_MARIA_PICKPOCKET(C_INFO)
{
	npc = bau_910_maria;
	nr = 900;
	condition = dia_maria_pickpocket_condition;
	information = dia_maria_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_maria_pickpocket_condition()
{
	return c_beklauen(60,110);
};

func void dia_maria_pickpocket_info()
{
	Info_ClearChoices(dia_maria_pickpocket);
	Info_AddChoice(dia_maria_pickpocket,DIALOG_BACK,dia_maria_pickpocket_back);
	Info_AddChoice(dia_maria_pickpocket,DIALOG_PICKPOCKET,dia_maria_pickpocket_doit);
};

func void dia_maria_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_maria_pickpocket);
};

func void dia_maria_pickpocket_back()
{
	Info_ClearChoices(dia_maria_pickpocket);
};

