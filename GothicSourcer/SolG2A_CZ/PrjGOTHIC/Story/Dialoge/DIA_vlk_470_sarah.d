
instance DIA_SARAH_EXIT(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 999;
	condition = dia_sarah_exit_condition;
	information = dia_sarah_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sarah_exit_condition()
{
	return TRUE;
};

func void dia_sarah_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SARAH_PICKPOCKET(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 900;
	condition = dia_sarah_pickpocket_condition;
	information = dia_sarah_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_sarah_pickpocket_condition()
{
	return c_beklauen(57,60);
};

func void dia_sarah_pickpocket_info()
{
	Info_ClearChoices(dia_sarah_pickpocket);
	Info_AddChoice(dia_sarah_pickpocket,DIALOG_BACK,dia_sarah_pickpocket_back);
	Info_AddChoice(dia_sarah_pickpocket,DIALOG_PICKPOCKET,dia_sarah_pickpocket_doit);
};

func void dia_sarah_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sarah_pickpocket);
};

func void dia_sarah_pickpocket_back()
{
	Info_ClearChoices(dia_sarah_pickpocket);
};


instance DIA_SARAH_GREET(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 1;
	condition = dia_sarah_greet_condition;
	information = dia_sarah_greet_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sarah_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CANTHAR_AUSGELIEFERT == TRUE))
	{
		return TRUE;
	};
};

func void dia_sarah_greet_info()
{
	AI_Output(self,other,"DIA_Sarah_Add_16_07");	//�! To jsi zase ty!
};


instance DIA_SARAH_HALLO(C_INFO)
{
	npc = vlk_470_sarah;
	condition = dia_sarah_hallo_condition;
	information = dia_sarah_hallo_info;
	permanent = FALSE;
	description = "Jak jdou obchody?";
};


func int dia_sarah_hallo_condition()
{
	return TRUE;
};

func void dia_sarah_hallo_info()
{
	AI_Output(other,self,"DIA_Sarah_HALLO_15_00");	//Jak jdou obchody?
	AI_Output(self,other,"DIA_Sarah_HALLO_16_01");	//Kdy� dorazili paladinov�, nejd��v jsem si myslela, �e to je p��le�itost k dobr�m obchod�m.
	AI_Output(self,other,"DIA_Sarah_HALLO_16_02");	//Ale pak nechali Harada, aby jim vyr�b�l zbran�, a ani Hakon ani j� jsme od nich nevid�li ani zlatku.
	AI_Output(self,other,"DIA_Sarah_HALLO_16_03");	//Nav�c farm��i u� d�l necht�j� z�sobovat m�sto potravinami, a v�echny ceny tak jdou nahoru.
	AI_Output(self,other,"DIA_Sarah_Add_16_00");	//�e mi paladinov� plat� hotel, je jen slabou �t�chou.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Sarah prod�v� na tr�i�ti zbran�.");
};


instance DIA_SARAH_BAUERN(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 2;
	condition = dia_sarah_bauern_condition;
	information = dia_sarah_bauern_info;
	permanent = FALSE;
	description = "Co je s farm��i za probl�my?";
};


func int dia_sarah_bauern_condition()
{
	if(Npc_KnowsInfo(other,dia_sarah_hallo))
	{
		return TRUE;
	};
};

func void dia_sarah_bauern_info()
{
	AI_Output(other,self,"DIA_Sarah_Bauern_15_00");	//Co je s farm��i za probl�my?
	AI_Output(self,other,"DIA_Sarah_Bauern_16_01");	//Odm�taj� dov�et sv� zbo��.
	AI_Output(self,other,"DIA_Sarah_Bauern_16_02");	//Te�, kdy� u� sem nep�iplouvaj� ��dn� lod�, je m�sto samoz�ejm� z�visl� jen na tom, co poskytnou farm��i.
	AI_Output(self,other,"DIA_Sarah_Bauern_16_03");	//A Onar, ten nejv�t�� z farm���, si najal �oldn��e, aby chr�nili jeho farmu p�ed m�stskou str��. Jinak by si domobrana v�echno zabrala pro sebe.
	AI_Output(self,other,"DIA_Sarah_Add_16_01");	//Ale ti �old�ci nechr�n� jenom Onarovu farmu.
	AI_Output(self,other,"DIA_Sarah_Add_16_02");	//Za�li tak daleko, �e zastra�uj� i mal� farm��e tady u m�sta.
	AI_Output(self,other,"DIA_Sarah_Add_16_03");	//Vid�la jsem je, kdy� jsem proch�zela p�es Akilovu farmu. Necht�la bych te� b�t v jeho k��i.
};


instance DIA_SARAH_AKILSHOF(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 3;
	condition = dia_sarah_akilshof_condition;
	information = dia_sarah_akilshof_info;
	permanent = FALSE;
	description = "Kde najdu Akilovu farmu?";
};


func int dia_sarah_akilshof_condition()
{
	if(Npc_KnowsInfo(other,dia_sarah_bauern))
	{
		return TRUE;
	};
};

func void dia_sarah_akilshof_info()
{
	AI_Output(other,self,"DIA_Sarah_AkilsHof_15_00");	//Kde najdu Akilovu farmu?
	AI_Output(self,other,"DIA_Sarah_Add_16_04");	//Pokud odejde� v�chodn� br�nou a d� se cestou napravo, dostane� se ke schodi�ti.
	AI_Output(self,other,"DIA_Sarah_Add_16_05");	//To vede nahoru k Akilov� farm�.
	AI_Output(self,other,"DIA_Sarah_Add_16_06");	//Ale j� bych tam te� nechodila - ur�it� tam je�t� po��d jsou �old�ci.
};


instance DIA_SARAH_TRADE(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 99;
	condition = dia_sarah_trade_condition;
	information = dia_sarah_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Uka� mi sv� zbo��.";
};


func int dia_sarah_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_sarah_hallo) && (MIS_CANTHARS_KOMPROBRIEF != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_sarah_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Sarah_Trade_15_00");	//Uka� mi sv� zbo��.
	SARAH_WAFFENGESEHEN = TRUE;
};


instance DIA_SARAH_IMKNAST(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 99;
	condition = dia_sarah_imknast_condition;
	information = dia_sarah_imknast_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sarah_imknast_condition()
{
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_SUCCESS) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_sarah_imknast_info()
{
	AI_Output(self,other,"DIA_Sarah_IMKNAST_16_00");	//Ty! Ty m� tu drzost tady je�t� uk�zat sv�j ksicht! Nem��u to dok�zat, ale vsad�m se, �e jsi namo�enej do p�kn� �pinav� hry.
	AI_Output(self,other,"DIA_Sarah_IMKNAST_16_01");	//Je to tvoje chyba, �e jsem tady. Tvoje a toho zatracen�ho Canthara - a� v�s Innos ztrest�!
	AI_StopProcessInfos(self);
};


instance DIA_SARAH_SUCCESS(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 4;
	condition = dia_sarah_success_condition;
	information = dia_sarah_success_info;
	permanent = FALSE;
	description = "Canthar se t� sna�il obelst�t...";
};


func int dia_sarah_success_condition()
{
	if(CANTHAR_AUSGELIEFERT == TRUE)
	{
		return TRUE;
	};
};

func void dia_sarah_success_info()
{
	AI_Output(other,self,"DIA_Sarah_Success_15_00");	//Canthar se t� pokusil podv�st a z�skat tv�j st�nek pro sebe. Ale j� jsem ho p�edhodil m�stsk�m str��m.
	AI_Output(self,other,"DIA_Sarah_Success_16_01");	//Tak to sis znep��telil nebezpe�n�ho mu�e. Zn�m toho bastarda u� p�kn� dlouho, a v�dycky cht�l m�j st�nek pro sebe.
	AI_Output(self,other,"DIA_Sarah_Success_16_02");	//Vezmi si tuhle zbra� jako vyj�d�en� m� vd��nosti.
	b_giveplayerxp(XP_CANTHARIMKNAST);
	b_giveinvitems(self,other,itmw_piratensaebel,1);
};

