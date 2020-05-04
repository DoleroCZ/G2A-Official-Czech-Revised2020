
instance DIA_CORAGON_EXIT(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 999;
	condition = dia_coragon_exit_condition;
	information = dia_coragon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_coragon_exit_condition()
{
	return TRUE;
};

func void dia_coragon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CORAGON_PICKPOCKET(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 900;
	condition = dia_coragon_pickpocket_condition;
	information = dia_coragon_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_coragon_pickpocket_condition()
{
	return c_beklauen(40,45);
};

func void dia_coragon_pickpocket_info()
{
	Info_ClearChoices(dia_coragon_pickpocket);
	Info_AddChoice(dia_coragon_pickpocket,DIALOG_BACK,dia_coragon_pickpocket_back);
	Info_AddChoice(dia_coragon_pickpocket,DIALOG_PICKPOCKET,dia_coragon_pickpocket_doit);
};

func void dia_coragon_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_coragon_pickpocket);
};

func void dia_coragon_pickpocket_back()
{
	Info_ClearChoices(dia_coragon_pickpocket);
};


instance DIA_CORAGON_HALLO(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 2;
	condition = dia_coragon_hallo_condition;
	information = dia_coragon_hallo_info;
	permanent = FALSE;
	description = "Mohu tu dostat n�co k pit�?";
};


func int dia_coragon_hallo_condition()
{
	return TRUE;
};

func void dia_coragon_hallo_info()
{
	AI_Output(other,self,"DIA_Coragon_HALLO_15_00");	//Mohu tu dostat n�co k pit�?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_00");	//M��e� dostat dokonce n�co k j�dlu, pokud m� zlato.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"J�dlo a pit� m��u nakoupit u hostinsk�ho Coragona.");
};


instance DIA_CORAGON_TRADE(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 2;
	condition = dia_coragon_trade_condition;
	information = dia_coragon_trade_info;
	permanent = TRUE;
	description = "Uka� mi sv� zbo��.";
	trade = TRUE;
};


func int dia_coragon_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_hallo))
	{
		return TRUE;
	};
};

func void dia_coragon_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Coragon_Trade_15_00");	//Uka� mi sv� zbo��.
};


instance DIA_CORAGON_WHATSUP(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 3;
	condition = dia_coragon_whatsup_condition;
	information = dia_coragon_whatsup_info;
	permanent = FALSE;
	description = "Tak co, jak jdou k�efty?";
};


func int dia_coragon_whatsup_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_hallo))
	{
		return TRUE;
	};
};

func void dia_coragon_whatsup_info()
{
	AI_Output(other,self,"DIA_Coragon_Gelaber_15_00");	//Tak co, jak jdou k�efty?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_01");	//Ani mi nemluv. Lord Andre d�v� pivo zadarmo.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_02");	//Nyn� sem chod� docela dost lid� z horn� �tvti, jen tak posed�t.
	AI_Output(other,self,"DIA_Coragon_Add_15_03");	//A co je s nimi?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_04");	//(pobaven�) N�kte�� z t�ch chl�pk� mi opravdu lezou na nervy.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_05");	//Nap��klad Valentino - nemohu toho chlapa vyst�t.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_06");	//Ale nemohu si vyb�rat z�kazn�ky, pot�ebuji ka�dou minci.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_07");	//V�echno mi ukradli, dokonce i m� st��bro.
};


instance DIA_ADDON_CORAGON_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 5;
	condition = dia_addon_coragon_missingpeople_condition;
	information = dia_addon_coragon_missingpeople_info;
	description = "V� n�co o zmizel�ch?";
};


func int dia_addon_coragon_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_hallo) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_coragon_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Coragon_MissingPeople_15_00");	//V� n�co o zmizel�ch?
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_01");	//Sly�el jsem, �e jsou to pov�t�inou lid� z p��stavu. Zn�m to tam a v�bec m� to nep�ekvapuje.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_02");	//Dokonce Thorben ��k�, �e mu zmizel u�edn�k.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_03");	//Hakon, jeden z obchodn�k� na tr�i�ti mi �ekl velmi podivnou historku.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_04");	//��kal, �e v�d�val jednoho chl�pka ka�d� den. Jednoho kr�sn�ho dne prost� zmizel. Dokonce se na to ptal i domobrany.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_05");	//Mnoho obyvatel pak propadlo panice. Nev�m, co si o tom myslet, ale �ekl bych, �e je to nesmysl.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_06");	//Khorinis je tvrd� m�sto a za jeho branami na tebe �ek� mnoho nebezpe��.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_07");	//Mimo m�sto m��e� b�t p�epaden bandity nebo divok�mi zv��aty. Je to jednoduch�.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Hakon - obchodn�k na tr�i�ti - a Thorben - tesa� - by mi mohli n�co pov�d�t.");
};


instance DIA_CORAGON_BESTOHLEN(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 4;
	condition = dia_coragon_bestohlen_condition;
	information = dia_coragon_bestohlen_info;
	permanent = FALSE;
	description = "Co�e, okradli t�?";
};


func int dia_coragon_bestohlen_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_whatsup))
	{
		return TRUE;
	};
};

func void dia_coragon_bestohlen_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_08");	//Co�e, okradli t�?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_09");	//Ano, p�ed p�r dny. Toto m�sto bylo p�ecpan� a j� jsem tu nebyl jen chvilku.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_10");	//Nebyl jsem za barem jen chvili�ku - ale t�m parchant�m ta chvilka sta�ila.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_11");	//�ekl jsem to domobran� - samoz�ejm� nic nena�li. Maj� plno pr�ce s pit�m piva venku.
	MIS_CORAGON_SILBER = LOG_RUNNING;
};


var int coragon_bier;

func void b_coragon_bier()
{
	CORAGON_BIER = CORAGON_BIER + 1;
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_14");	//Tady je tv� odm�na.
	b_giveinvitems(self,other,itfo_coragonsbeer,1);
	if(CORAGON_BIER < 2)
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_21");	//Je to SPECI�LN� pivo. M�j posledn� sud.
	}
	else
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_22");	//Toto je posledn� dou�ek.
	};
};


instance DIA_CORAGON_BRINGSILBER(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 5;
	condition = dia_coragon_bringsilber_condition;
	information = dia_coragon_bringsilber_info;
	permanent = FALSE;
	description = "Tvoje st��bro m�m zrovna u sebe.";
};


func int dia_coragon_bringsilber_condition()
{
	if((MIS_CORAGON_SILBER == LOG_RUNNING) && (Npc_HasItems(other,itmi_coragonssilber) >= 8))
	{
		return TRUE;
	};
};

func void dia_coragon_bringsilber_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_12");	//Tvoje st��bro m�m zrovna u sebe.
	if(b_giveinvitems(other,self,itmi_coragonssilber,8))
	{
		Npc_RemoveInvItems(self,itmi_coragonssilber,8);
	};
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_13");	//Opravdu!
	b_giveplayerxp(XP_CORAGONSSILBER);
	b_coragon_bier();
	MIS_CORAGON_SILBER = LOG_SUCCESS;
};


instance DIA_CORAGON_SCHULDENBUCH(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 6;
	condition = dia_coragon_schuldenbuch_condition;
	information = dia_coragon_schuldenbuch_info;
	permanent = FALSE;
	description = "Pod�vej, co tady m�m.";
};


func int dia_coragon_schuldenbuch_condition()
{
	if(Npc_HasItems(other,itwr_schuldenbuch) > 0)
	{
		return TRUE;
	};
};

func void dia_coragon_schuldenbuch_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_15");	//Pod�vej, co tady m�m.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_16");	//Hmm? To je Lehmar�v dluhopis!
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_17");	//Co s t�m zam��l� d�lat?
};


instance DIA_CORAGON_GIVEBOOK(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 7;
	condition = dia_coragon_givebook_condition;
	information = dia_coragon_givebook_info;
	permanent = FALSE;
	description = "Tady m� svou knihu.";
};


func int dia_coragon_givebook_condition()
{
	if(Npc_HasItems(other,itwr_schuldenbuch) > 0)
	{
		return TRUE;
	};
};

func void dia_coragon_givebook_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_18");	//Tady m� svou knihu.
	b_giveinvitems(other,self,itwr_schuldenbuch,1);
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_19");	//D�ky! Zachr�nils m�! Lehmar je docela nep��jemn� pokud jde o jeho pen�ze.
	b_giveplayerxp(XP_SCHULDENBUCH);
	b_coragon_bier();
};


instance DIA_CORAGON_TOOV(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 9;
	condition = dia_coragon_toov_condition;
	information = dia_coragon_toov_info;
	permanent = FALSE;
	description = "Co mus�m ud�lat, abych se dostal do horn� �tvrti?";
};


func int dia_coragon_toov_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_whatsup) && (other.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_coragon_toov_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_23");	//Co mus�m ud�lat, abych se dostal do horn� �tvrti?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_24");	//Mus� se st�t ob�anem. Najdi si n�jakou pr�ci.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_25");	//Mo�n� bys m�l promluvit s obchodn�ky, co d�laj� v doln� ��sti m�sta.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_26");	//Pokud ti to nesta��, m��e� promluvit s lordem Andrem, kter� je v kas�rn�ch.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_27");	//Mo�n� t� nech� st�t se m�stskou str��. Pak m��e� tak� do horn� �tvrti.
};


instance DIA_CORAGON_VALENTINO(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 8;
	condition = dia_coragon_valentino_condition;
	information = dia_coragon_valentino_info;
	permanent = FALSE;
	description = "Co je s t�m Valentinem?";
};


func int dia_coragon_valentino_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_whatsup))
	{
		return TRUE;
	};
};

func void dia_coragon_valentino_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_28");	//Co je s t�m Valentinem?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_29");	//Je docela bohat� a nemus� pracovat. A d�v� to ka�d�mu najevo.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_30");	//Bez ohledu jestli t� to zaj�m� nebo ne.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_31");	//Pije hodn� a odch�z� obvykle nad r�nem. A pak se pomalu vrac� zp�t do horn� �tvrti.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_32");	//Ka�d� den.
};


instance DIA_CORAGON_NEWS(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 1;
	condition = dia_coragon_news_condition;
	information = dia_coragon_news_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_coragon_news_condition()
{
	if(valentino.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		if(REGIS_RING == TRUE)
		{
			return TRUE;
		};
	};
};

func void dia_coragon_news_info()
{
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_33");	//Valentino m�l v�era t�kou noc.
	if(valentino.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_34");	//Sna�il se mi namluvit, �e byl okraden a du�oval se, �e zaplat� p��t�. V�n�!
	}
	else
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_35");	//He, p�edt�m se vytahoval, kolik pen�z u sebe m�.
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_36");	//A pak se pod�val do pen�enky, hloup� se zatv��il a rozhl�dl se kolem. Pak mi �ekl, �e byl okraden.
	};
	AI_Output(other,self,"DIA_Coragon_Add_15_37");	//A jak ses zachoval ty?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_38");	//Dal jsem mu dal po��dnej v�prask!
};


instance DIA_CORAGON_RING(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 10;
	condition = dia_coragon_ring_condition;
	information = dia_coragon_ring_info;
	permanent = FALSE;
	description = "Na, vezmi si tento prsten.";
};


func int dia_coragon_ring_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_news) && (Npc_HasItems(other,itri_valentinosring) > 0))
	{
		return TRUE;
	};
};

func void dia_coragon_ring_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_39");	//Na, vezmi si tento prsten.
	b_giveinvitems(other,self,itri_valentinosring,1);
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_40");	//Co? Nerozum�m ...
	AI_Output(other,self,"DIA_Coragon_Add_15_41");	//Je to Valentin�v prsten.
	AI_Output(other,self,"DIA_Coragon_Add_15_42");	//P�edej ho zase n�komu, kdo mu d� v�prask p��t�.
	b_giveplayerxp(300);
	AI_StopProcessInfos(self);
};

