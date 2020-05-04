
instance DIA_JORGEN_KAP3_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 999;
	condition = dia_jorgen_kap3_exit_condition;
	information = dia_jorgen_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_jorgen_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_PICKPOCKET(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 900;
	condition = dia_jorgen_pickpocket_condition;
	information = dia_jorgen_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_jorgen_pickpocket_condition()
{
	return c_beklauen(59,70);
};

func void dia_jorgen_pickpocket_info()
{
	Info_ClearChoices(dia_jorgen_pickpocket);
	Info_AddChoice(dia_jorgen_pickpocket,DIALOG_BACK,dia_jorgen_pickpocket_back);
	Info_AddChoice(dia_jorgen_pickpocket,DIALOG_PICKPOCKET,dia_jorgen_pickpocket_doit);
};

func void dia_jorgen_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jorgen_pickpocket);
};

func void dia_jorgen_pickpocket_back()
{
	Info_ClearChoices(dia_jorgen_pickpocket);
};


instance DIA_JORGEN_HALLO(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 4;
	condition = dia_jorgen_hallo_condition;
	information = dia_jorgen_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jorgen_hallo_condition()
{
	if((KAPITEL == 3) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_hallo_info()
{
	AI_Output(self,other,"DIA_Jorgen_Hallo_07_00");	//Hej, ty!
	if((hero.guild == GIL_NOV) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_01");	//Vid�m, �e pat�� ke kl�teru m�g�.
		AI_Output(other,self,"DIA_Jorgen_Hallo_15_02");	//Ano, pro�?
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_03");	//Neu�ivili byste tam je�t� jednoho d�ln�ka?
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_04");	//Hej, ty, u� jsi byl n�kdy v kl�te�e?
		AI_Output(other,self,"DIA_Jorgen_Hallo_15_05");	//Mo�n�, pro�?
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_06");	//A je�t� po��d naj�maj� nov� lidi?
	};
	AI_Output(self,other,"DIA_Jorgen_Hallo_07_07");	//Nev�d�l jsem, kam jinam se obr�tit.
};


instance DIA_JORGEN_NOVICE(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 6;
	condition = dia_jorgen_novice_condition;
	information = dia_jorgen_novice_info;
	permanent = FALSE;
	description = "Nepro�el tudy n�jak� novic?";
};


func int dia_jorgen_novice_condition()
{
	if((MIS_NOVIZENCHASE == LOG_RUNNING) && (KAPITEL == 3) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_novice_info()
{
	AI_Output(other,self,"DIA_Jorgen_Novice_15_00");	//Nepro�el tudy n�jak� novic?
	AI_Output(self,other,"DIA_Jorgen_Novice_07_01");	//No jasn�, tamhletudy.
	AI_PointAt(self,"NW_TROLLAREA_NOVCHASE_01");
	AI_Output(self,other,"DIA_Jorgen_Novice_07_02");	//T�mhle z toho mostu sko�il do vody a plaval, jako by m�l v pat�ch �raloka.
	AI_StopPointAt(self);
};


instance DIA_JORGEN_MILTEN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 5;
	condition = dia_jorgen_milten_condition;
	information = dia_jorgen_milten_info;
	permanent = FALSE;
	description = "Jestli m��� do kl�tera, m�l by sis promluvit s Miltenem...";
};


func int dia_jorgen_milten_condition()
{
	if((KAPITEL == 3) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE) && (MIS_OLDWORLD == LOG_SUCCESS) && (miltennw.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_jorgen_milten_info()
{
	AI_Output(other,self,"DIA_Jorgen_Milten_15_00");	//Jestli m��� do kl�tera, m�l by sis promluvit s Miltenem, ten ti ur�it� dok�e pomoci.
	AI_Output(self,other,"DIA_Jorgen_Milten_07_01");	//Co mysl�, pust� m� v�bec dovnit�?
	AI_Output(other,self,"DIA_Jorgen_Milten_15_02");	//Snad. Ale jak se tak na tebe d�v�m, jen t�ko si t� dovedu p�edstavit v rou�e novic�.
	AI_Output(self,other,"DIA_Jorgen_Milten_07_03");	//Dost t�ch nesmysl� - jasn� �e roucho novic�. To je p�esn� to, po �em ba��m, i kdy� potom budu muset ohlod�vat k�ru ze strom�.
};


instance DIA_JORGEN_HOME(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 7;
	condition = dia_jorgen_home_condition;
	information = dia_jorgen_home_info;
	description = "Odkud jsi p�i�el?";
};


func int dia_jorgen_home_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_jorgen_home_info()
{
	AI_Output(other,self,"DIA_Jorgen_Home_15_00");	//Odkud jsi p�i�el?
	AI_Output(self,other,"DIA_Jorgen_Home_07_01");	//B�val jsem kapit�nem velryb��sk� lodi, chlap�e. Mo�e je m�m domovem.
	AI_Output(self,other,"DIA_Jorgen_Home_07_02");	//P�ed p�r m�s�ci ale moji lo�, starou dobrou Magdalenu, potopili pir�ti. A tak jsem tu zkejsnul.
	AI_Output(self,other,"DIA_Jorgen_Home_07_03");	//V�dycky jsem se cht�l vr�tit zp�tky na mo�e, ale od t� doby, co tu tr��m, nevyplul z tohohle proklet�ho p��stavu ani jeden �kuner.
	AI_Output(self,other,"DIA_Jorgen_Home_07_04");	//Jedin� lo�, kter� v Khorinisu kotv�, je ta zatracen� v�le�n� kr�lovsk� gal�ra - a tam nikoho dal��ho nep�ijmou.
	AI_Output(self,other,"DIA_Jorgen_Home_07_05");	//Tak co je�t� m��u d�lat? U� jsem zkou�el v�echno - ve m�st� pro m� ��dn� pr�ce nen�.
};


instance DIA_JORGEN_BECAREFULL(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 8;
	condition = dia_jorgen_becarefull_condition;
	information = dia_jorgen_becarefull_info;
	permanent = TRUE;
	description = "Ud�lals dob�e, �e jsi nikam ne�el.";
};


func int dia_jorgen_becarefull_condition()
{
	if((KAPITEL == 3) && Npc_KnowsInfo(other,dia_jorgen_home))
	{
		return TRUE;
	};
};

func void dia_jorgen_becarefull_info()
{
	AI_Output(other,self,"DIA_Jorgen_BeCarefull_15_00");	//Ud�lals dob�e, �e jsi nikam ne�el.
	AI_Output(self,other,"DIA_Jorgen_BeCarefull_07_01");	//��dn� strachy. U� jsem si v�imnul, �e v posledn�ch dvou dnech je okoln� divo�ina zpropaden� nebezpe�n�.
};


instance DIA_JORGEN_KAP4_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 999;
	condition = dia_jorgen_kap4_exit_condition;
	information = dia_jorgen_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_jorgen_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_NEUHIER(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 41;
	condition = dia_jorgen_neuhier_condition;
	information = dia_jorgen_neuhier_info;
	description = "Jak to v kl�te�e jde?";
};


func int dia_jorgen_neuhier_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_jorgen_neuhier_info()
{
	AI_Output(other,self,"DIA_Jorgen_NEUHIER_15_00");	//Jak to v kl�te�e jde?
	AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_01");	//Pomalu tu z toho v�eho bl�zn�m!
	if(Npc_KnowsInfo(other,dia_jorgen_milten))
	{
		AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_02");	//Ale i tak ti d�kuju za pomoc. S Miltenov�m p�isp�n�m jsem tu opravdu z�skal m�sto.
		b_giveplayerxp(XP_AMBIENT);
	};
	if(hero.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_03");	//Akor�t se mezi t�mi sebemrska�sk�mi lidumily c�t�m jako blbec.
	};
	AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_04");	//No, ale t�lu se ned� porou�et. Ne� um��t hlady ve m�st�, rad�i budu d�lat, co mi novicov� nak�ou.
};


instance DIA_JORGEN_PERM4(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 400;
	condition = dia_jorgen_perm4_condition;
	information = dia_jorgen_perm4_info;
	permanent = TRUE;
	description = "Mysl�m, �e se to podd�.";
};


func int dia_jorgen_perm4_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_jorgen_home) && Npc_KnowsInfo(other,dia_jorgen_neuhier) && (JORGENISCAPTAIN == FALSE))
	{
		return TRUE;
	};
};


var int dia_jorgen_perm4_onetime;

func void dia_jorgen_perm4_info()
{
	AI_Output(other,self,"DIA_Jorgen_PERM4_15_00");	//Mysl�m, �e se to podd�.
	if((DIA_JORGEN_PERM4_ONETIME == FALSE) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Jorgen_PERM4_07_01");	//Jenom si p�edstav - m�m jim vypl�t zahradu. Kdy� to takhle p�jde d�l, za chv�li se z toho zcvoknu.
		DIA_JORGEN_PERM4_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Jorgen_PERM4_07_02");	//Jedin�, co pot�ebuju, je zase star� dobr� paluba pod nohama.
};


instance DIA_JORGEN_KAP5_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 999;
	condition = dia_jorgen_kap5_exit_condition;
	information = dia_jorgen_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_jorgen_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_BEMYCAPTAIN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 51;
	condition = dia_jorgen_bemycaptain_condition;
	information = dia_jorgen_bemycaptain_info;
	permanent = TRUE;
	description = "Mo�n� bych ti mohl nab�dnout m�sto kapit�na.";
};


func int dia_jorgen_bemycaptain_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (MIS_PYROKARCLEARDEMONTOWER != LOG_SUCCESS) && Npc_KnowsInfo(other,dia_jorgen_home))
	{
		return TRUE;
	};
};


var int dia_jorgen_bemycaptain_onetime;

func void dia_jorgen_bemycaptain_info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN_15_00");	//Mo�n� bych ti mohl nab�dnout m�sto kapit�na.
	if(DIA_JORGEN_BEMYCAPTAIN_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_01");	//Nehoupe� m�, k�mo? Jestli mluv� pravdu, tak do toho ur�it� jdu!
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_02");	//Ehm - je tu ale men�� probl�m. Vyjedl jsem t�m novic�m p�lku spi��rny.
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_03");	//Ti chl�pkov� jsou z toho cel� nep���etn�. Nemysl�m, �e by m� hlavn� m�g nechal takhle odej�t.
		DIA_JORGEN_BEMYCAPTAIN_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_04");	//Je mi l�to, ale nejd��v si mus�m n�co vy��dit s Pyrokarem.
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"Jorgen svolil, �e se stane m�m kapit�nem, ale nejd��v za n�j mus�m zaplatit v�echny dluhy v kl�te�e.");
};


instance DIA_JORGEN_BEMYCAPTAIN2(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 52;
	condition = dia_jorgen_bemycaptain2_condition;
	information = dia_jorgen_bemycaptain2_info;
	description = "Tv�j ��et jsem u� vyrovnal - jsi voln�.";
};


func int dia_jorgen_bemycaptain2_condition()
{
	if(MIS_PYROKARCLEARDEMONTOWER == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_jorgen_bemycaptain2_info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN2_15_00");	//Tv�j ��et jsem u� vyrovnal - jsi voln�.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_01");	//Opravdu? Jak jsi to za��dil?
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN2_15_02");	//Do toho ti nic nen�.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_03");	//No, vlastn� je mi to jedno. Je�t� jednou ti teda mili�nkr�t d�kuju.
	if(SCGOTCAPTAIN == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_04");	//A co ta tvoje nab�dka? M��u s t�m po��d po��tat?
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_05");	//Skv�l�. A te� bychom odsud m�li zmizet.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"RausAusKloster");
	};
};


instance DIA_JORGEN_BEMYCAPTAIN3(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 53;
	condition = dia_jorgen_bemycaptain3_condition;
	information = dia_jorgen_bemycaptain3_info;
	description = "Bu� m�m kapit�nem.";
};


func int dia_jorgen_bemycaptain3_condition()
{
	if(Npc_KnowsInfo(other,dia_jorgen_bemycaptain2) && (SCGOTCAPTAIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_bemycaptain3_info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN3_15_00");	//Bu� m�m kapit�nem.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_01");	//Je to pro m� �est, ale m� v�bec n�jakou lo� a pos�dku?
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_02");	//�ekl bych, �e budeme pot�ebovat aspo� p�t chlap�.
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN3_15_03");	//Dob�e, uvid�m, co se d� d�lat. Zat�m na m� po�kej v p��stavu.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_04");	//Rozkaz, pane.
	AI_StopProcessInfos(self);
	SCGOTCAPTAIN = TRUE;
	JORGENISCAPTAIN = TRUE;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	b_giveplayerxp(XP_CAPTAIN_SUCCESS);
};


instance DIA_JORGEN_LOSFAHREN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 59;
	condition = dia_jorgen_losfahren_condition;
	information = dia_jorgen_losfahren_info;
	permanent = TRUE;
	description = "Jsi p�ipraven m� p�ev�zt na ostrov?";
};


func int dia_jorgen_losfahren_condition()
{
	if((JORGENISCAPTAIN == TRUE) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_losfahren_info()
{
	AI_Output(other,self,"DIA_Jorgen_LOSFAHREN_15_00");	//Jsi p�ipraven m� p�ev�zt na ostrov?
	if(b_captainconditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_01");	//Ale samoz�ejm�. Dej mi tu mapu.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_02");	//Skv�l�, tak napn�me plachty, a� u� jsme odsud pry�!
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_03");	//Rad�i by sis m�l nejd��v sbalit v�echna fidl�tka. Z mo�e se sem u� nem��eme vr�tit.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_04");	//A� v�echno vy��d�, tak si trochu zd��mni - v kapit�nsk� kajut� m� p�ipravenou pry�nu. Dobrou noc.
		AI_StopProcessInfos(self);
		b_captaincallsallonboard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_05");	//Pot�ebuje� lo�, pos�dku aspo� p�ti mu�� a n�mo�n� mapu, podle kter� bych mohl plavbu navigovat.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_06");	//Nem��eme odrazit, dokud neuvid�m, �e jsi sehnal v�echno pot�ebn�.
		AI_StopProcessInfos(self);
	};
};


instance DIA_JORGEN_PERM5_NOTCAPTAIN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 59;
	condition = dia_jorgen_perm5_notcaptain_condition;
	information = dia_jorgen_perm5_notcaptain_info;
	permanent = TRUE;
	description = "Jak se m�?";
};


func int dia_jorgen_perm5_notcaptain_condition()
{
	if(Npc_KnowsInfo(other,dia_jorgen_bemycaptain2) && (SCGOTCAPTAIN == TRUE) && (JORGENISCAPTAIN == FALSE))
	{
		return TRUE;
	};
};


var int dia_jorgen_perm5_notcaptain_xpgiven;

func void dia_jorgen_perm5_notcaptain_info()
{
	AI_Output(other,self,"DIA_Jorgen_PERM5_NOTCAPTAIN_15_00");	//Jak se m�?
	if(Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_OUT_06") < 1000)
	{
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_01");	//Fajn, tady to nen� a� tak �patn�.
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_02");	//Je�t� po��d sice mus�m d�lat takov� pitomosti jako t�eba p�st ovce, ale po��d to nejsou ani z p�lky takov� omezenci jako ti v kl�te�e.
		if(DIA_JORGEN_PERM5_NOTCAPTAIN_XPGIVEN == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			DIA_JORGEN_PERM5_NOTCAPTAIN_XPGIVEN = TRUE;
		};
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_03");	//Budu si muset naj�t nov� p��bytek. Uvid�me, kam m� v�tr zavane p��t�.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"RausAusKloster");
	};
};


instance DIA_JORGEN_KAP6_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 999;
	condition = dia_jorgen_kap6_exit_condition;
	information = dia_jorgen_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_jorgen_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

