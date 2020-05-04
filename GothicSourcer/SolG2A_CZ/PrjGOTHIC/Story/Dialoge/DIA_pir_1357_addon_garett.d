
instance DIA_ADDON_GARETT_EXIT(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 999;
	condition = dia_addon_garett_exit_condition;
	information = dia_addon_garett_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_garett_exit_condition()
{
	return TRUE;
};

func void dia_addon_garett_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GARETT_PICKPOCKET(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 900;
	condition = dia_addon_garett_pickpocket_condition;
	information = dia_addon_garett_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_garett_pickpocket_condition()
{
	return c_beklauen(36,55);
};

func void dia_addon_garett_pickpocket_info()
{
	Info_ClearChoices(dia_addon_garett_pickpocket);
	Info_AddChoice(dia_addon_garett_pickpocket,DIALOG_BACK,dia_addon_garett_pickpocket_back);
	Info_AddChoice(dia_addon_garett_pickpocket,DIALOG_PICKPOCKET,dia_addon_garett_pickpocket_doit);
};

func void dia_addon_garett_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_garett_pickpocket);
};

func void dia_addon_garett_pickpocket_back()
{
	Info_ClearChoices(dia_addon_garett_pickpocket);
};


instance DIA_ADDON_GARETT_ANHEUERN(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 1;
	condition = dia_addon_garett_anheuern_condition;
	information = dia_addon_garett_anheuern_info;
	important = TRUE;
};


func int dia_addon_garett_anheuern_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_garett_anheuern_info()
{
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_00");	//Ani se m� neptej, jestli s tebou p�jdu na lov.
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_01");	//Co si mysl�, �e by si tu beze m� po�ali, co?
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_02");	//Ne� bych se vr�til, nezbyla by mi tu ani JEDNA pln� krabice!
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_03");	//Z�st�v�m tady a budu se starat o z�soby!
};


instance DIA_ADDON_GARETT_HELLO(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 1;
	condition = dia_addon_garett_hello_condition;
	information = dia_addon_garett_hello_info;
	important = TRUE;
};


func int dia_addon_garett_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (MIS_ADDON_GREG_CLEARCANYON != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_garett_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_00");	//Copak to tu m�me, nov� tv��? Douf�m, �e nejsi ��dn� z t�ch v�iv�ch bandit�!
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_01");	//J� jsem Garett. Kdy� bude� n�co pot�ebovat, p�ij� nejprve za mnou.
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_02");	//M�m t�m�� v�echno. V�no, zbran� a je�t� mnoho dal��ho, co lid� pot�ebuj�.
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_03");	//Krom� ko�alky - jestli hled� kvalitn� ko�alku, jdi za Samuelem.
	Log_CreateTopic(TOPIC_ADDON_PIR_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_PIR_TRADER,LOG_TEXT_ADDON_GARETTTRADE);
};


instance DIA_ADDON_GARETT_SAMUEL(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 2;
	condition = dia_addon_garett_samuel_condition;
	information = dia_addon_garett_samuel_info;
	permanent = FALSE;
	description = "Kdo je Samuel?";
};


func int dia_addon_garett_samuel_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_garett_hello) && (samuel.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_garett_samuel_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Samuel_15_00");	//Kdo je Samuel?
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_01");	//N� pali�. Jeho jeskyn� je t�mhle o kousek d�l, napravo od pl�e.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_02");	//Nen� t�k� to naj�t, jdi prost� na sever.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_03");	//Ale n�co ti porad�m - z�sob se grogem.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_04");	//N�kte�� mlad�ci tady nemaj� moc r�di nov� chlapy, jestli ch�pe� ...
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_05");	//V tom p��pad� m��e tro�ka kvalitn�ho grogu urovnat situaci!
	b_logentry(TOPIC_ADDON_PIR_TRADER,LOG_TEXT_ADDON_SAMUELTRADE);
};


instance DIA_ADDON_GARETT_WAREZ(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 3;
	condition = dia_addon_garett_warez_condition;
	information = dia_addon_garett_warez_info;
	description = "Od koho bere� sv� zbo��?";
};


func int dia_addon_garett_warez_condition()
{
	return TRUE;
};

func void dia_addon_garett_warez_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Warez_15_00");	//Od koho bere� sv� zbo��?
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_01");	//Skip v�dycky doveze hodn� z Khorinisu, kam chod�v�.
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_02");	//A� do te� prod�val hodn� v�c� bandit�m.
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_03");	//Ale jak te� s bandity v�l��me, v�echno to zbo�� kon�� u m�.
};


instance DIA_ADDON_GARETT_BANDITS(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 3;
	condition = dia_addon_garett_bandits_condition;
	information = dia_addon_garett_bandits_info;
	description = "Co v� o banditech?";
};


func int dia_addon_garett_bandits_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_garett_warez))
	{
		return TRUE;
	};
};

func void dia_addon_garett_bandits_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Bandits_15_00");	//Co v� o banditech?
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_01");	//Na to je odborn�k Skip.
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_02");	//�eknu ti, on m�l s t�mi idioty hodn� sch�zek.
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_03");	//Greg rozk�zal zlikvidovat ka�d�ho banditu, co se p�ibl�� k t�boru.
};


instance DIA_ADDON_GARETT_GREG(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 4;
	condition = dia_addon_garett_greg_condition;
	information = dia_addon_garett_greg_info;
	permanent = FALSE;
	description = "Tv�j kapit�n Greg. Jak� je?";
};


func int dia_addon_garett_greg_condition()
{
	return TRUE;
};

func void dia_addon_garett_greg_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Greg_15_00");	//Tv�j kapit�n Greg. Jak� je?
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_01");	//Je to tuh� chl�pek, to ur�it�.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_02");	//A chamtiv� jako nikdo jin�.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_03");	//Nechal na�eho pokladn�ka Francise, aby n�m platil akor�t tolik, abychom se nevzbou�ili.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_04");	//A kdy� jeden z n�s n�co opravdu zam��lel, postaral se o n�ho osobn�.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_05");	//Jednou jsem ukradl kompas z jedn� kr�lovk� fregaty.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_06");	//Greg, ten bastard, mi ho samoz�ejm� zabavil.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_07");	//Pf! Asi ho n�kam schoval, jako v�echny jeho poklady.
};


instance DIA_ADDON_GARETT_TIPS(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 5;
	condition = dia_addon_garett_tips_condition;
	information = dia_addon_garett_tips_info;
	description = "Kde mohl Greg ukr�t ten kompas?";
};


func int dia_addon_garett_tips_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_garett_greg))
	{
		return TRUE;
	};
};

func void dia_addon_garett_tips_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Tips_15_00");	//Kde mohl Greg ukr�t ten kompas?
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_01");	//Greg mi jednou �ekl, �e o m�j kompas se star� smrt a pak se za�al sm�t.
	AI_Output(other,self,"DIA_Addon_Garett_Tips_15_02");	//N�co dal��ho?
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_03");	//Na ji�n�m pob�e�� je pl�. D� se tam dostat jen po mo�i.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_04");	//��k� se, �e Greg tam ob�as chod�. Mo�n� bys tam n�co na�el.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_05");	//Jednou jsem tam byl, ale je tam plno potvor.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_06");	//Jestli to chce� opravdu risknout, nezapome� si krump��.
	MIS_ADDON_GARETT_BRINGKOMPASS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_KOMPASS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KOMPASS,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KOMPASS,"Greg sebral Garretovi vz�cn� kompas. Garett si mysl�, �e ho schoval n�kde na ji�n� pl�i.");
};


instance DIA_ADDON_GARETT_GIVEKOMPASS(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 6;
	condition = dia_addon_garett_givekompass_condition;
	information = dia_addon_garett_givekompass_info;
	permanent = FALSE;
	description = "Tady je tv�j kompas.";
};


func int dia_addon_garett_givekompass_condition()
{
	if((Npc_HasItems(other,itmi_addon_kompass_mis) >= 1) && (MIS_ADDON_GARETT_BRINGKOMPASS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_garett_givekompass_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_GiveKompass_15_00");	//Tady je tv�j kompas.
	if(b_giveinvitems(other,self,itmi_addon_kompass_mis,1))
	{
		Npc_RemoveInvItems(self,itmi_addon_kompass_mis,1);
	};
	AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_01");	//(raduje se) Jo, to je on. Ne�ekal jsem, �e ho je�t� n�kdy uvid�m.
	AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_02");	//D�ky, chlape!
	if(Npc_HasItems(self,itbe_addon_prot_edgpoi) > 0)
	{
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_03");	//Tentokr�t u� ho Greg NEDOSTANE ...
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_04");	//Tady, vezmi si za to tenhle opasek. Je celkem cenn�.
		b_giveinvitems(self,other,itbe_addon_prot_edgpoi,1);
	}
	else if(self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_05");	//Tento p�sek si ode m� koupil, pamatuje�?
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_06");	//Zaplatil jsi za n�j hodn� - (rychle) a je opravdu cenn�. Tady - vezmi si ty pen�ze zp�t.
		b_giveinvitems(self,other,itmi_gold,VALUE_ITBE_ADDON_PROT_EDGPOI);
	};
	b_logentry(TOPIC_ADDON_KOMPASS,"Garret byl velmi pot�en, kdy� jsem mu vr�til jeho kompas.");
	MIS_ADDON_GARETT_BRINGKOMPASS = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_GARETT_BRING_KOMPASS);
};


instance DIA_ADDON_GARETT_FRANCIS(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 7;
	condition = dia_addon_garett_francis_condition;
	information = dia_addon_garett_francis_info;
	permanent = FALSE;
	description = "Co mi m��e� ��ct o Francisovi?";
};


func int dia_addon_garett_francis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_garett_greg))
	{
		return TRUE;
	};
};

func void dia_addon_garett_francis_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Francis_15_00");	//Co mi m��e� ��ct o Francisovi?
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_01");	//Greg mu p�edal velen�, dokud tu nen�.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_02");	//Ale jako kapit�n je Francis absolutn� nemo�n�!
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_03");	//Ani nedok�zal vyt�hnout Morgana z postele.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_04");	//Henry a jeho chlapci jsou jedin�, kdo tu n�co d�l�.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_05");	//Ti ostatn� se jen fl�kaj�.
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Garett_Francis_09_06");	//Douf�m, �e se Greg vr�t� brzy.
		AI_Output(self,other,"DIA_Addon_Garett_Francis_09_07");	//Pak je p�kn� nakope do zadku.
	};
};


instance DIA_ADDON_GARETT_PERM(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 99;
	condition = dia_addon_garett_perm_condition;
	information = dia_addon_garett_perm_info;
	permanent = TRUE;
	description = "N�co nov�ho?";
};


func int dia_addon_garett_perm_condition()
{
	return TRUE;
};

func void dia_addon_garett_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_PERM_15_00");	//N�co nov�ho?
	if((GREGISBACK == FALSE) || Npc_IsDead(greg))
	{
		AI_Output(self,other,"DIA_Addon_Garett_PERM_09_02");	//Dokud bude Greg pry�, nic se tu d�t nebude.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Garett_PERM_09_01");	//Te�, kdy� je Greg zp�t, v�ci se vrac� do norm�lu.
	};
};


instance DIA_ADDON_GARETT_TRADE(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 888;
	condition = dia_addon_garett_trade_condition;
	information = dia_addon_garett_trade_info;
	permanent = TRUE;
	description = DIALOG_TRADE;
	trade = TRUE;
};


func int dia_addon_garett_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_garett_hello) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_garett_trade_info()
{
	var int garett_random;
	var int mcbolzenamount;
	var int mcarrowamount;
	garett_random = Hlp_Random(3);
	if(garett_random == 0)
	{
		b_say(other,self,"$TRADE_1");
	}
	else if(garett_random == 1)
	{
		b_say(other,self,"$TRADE_2");
	}
	else
	{
		b_say(other,self,"$TRADE_3");
	};
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
	mcbolzenamount = KAPITEL * 25;
	CreateInvItems(self,itrw_bolt,mcbolzenamount);
	Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
	mcarrowamount = KAPITEL * 25;
	CreateInvItems(self,itrw_arrow,mcarrowamount);
};

