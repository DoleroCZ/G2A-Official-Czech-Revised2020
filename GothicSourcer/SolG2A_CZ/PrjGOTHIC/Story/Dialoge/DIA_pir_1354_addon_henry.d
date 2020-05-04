
instance DIA_ADDON_HENRY_EXIT(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 999;
	condition = dia_addon_henry_exit_condition;
	information = dia_addon_henry_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_henry_exit_condition()
{
	return TRUE;
};

func void dia_addon_henry_exit_info()
{
	AI_StopProcessInfos(self);
};

func void b_henry_gold(var int gold)
{
	if(gold == 500)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold500_04_00");	//500 zlatych.
	}
	else if(gold == 400)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold400_04_00");	//400 zlatych.
	}
	else if(gold == 300)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold300_04_00");	//300 zlatych.
	}
	else if(gold == 200)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold200_04_00");	//200 zlatych.
	}
	else if(gold == 100)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold100_04_00");	//100 zlatych.
	}
	else
	{
		b_say_gold(self,other,gold);
	};
};


instance DIA_ADDON_HENRY_PICKPOCKET(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 900;
	condition = dia_addon_henry_pickpocket_condition;
	information = dia_addon_henry_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_henry_pickpocket_condition()
{
	return c_beklauen(40,60);
};

func void dia_addon_henry_pickpocket_info()
{
	Info_ClearChoices(dia_addon_henry_pickpocket);
	Info_AddChoice(dia_addon_henry_pickpocket,DIALOG_BACK,dia_addon_henry_pickpocket_back);
	Info_AddChoice(dia_addon_henry_pickpocket,DIALOG_PICKPOCKET,dia_addon_henry_pickpocket_doit);
};

func void dia_addon_henry_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_henry_pickpocket);
};

func void dia_addon_henry_pickpocket_back()
{
	Info_ClearChoices(dia_addon_henry_pickpocket);
};


const string PIR_1354_CHECKPOINT = "ADW_PIRATECAMP_WAY_02";

instance DIA_ADDON_HENRY_HELLO(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 5;
	condition = dia_addon_henry_hello_condition;
	information = dia_addon_henry_hello_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_henry_hello_condition()
{
	if(Npc_GetDistToWP(other,PIR_1354_CHECKPOINT) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Henry_Hello_04_00");	//ST�T!
	AI_Output(self,other,"DIA_Addon_Henry_Hello_04_01");	//P��tel nebo nep��tel?
	Info_ClearChoices(dia_addon_henry_hello);
	Info_AddChoice(dia_addon_henry_hello,"Nep��tel!",dia_addon_henry_hello_feind);
	Info_AddChoice(dia_addon_henry_hello,"P��tel!",dia_addon_henry_hello_freund);
};


var int henry_sc_frech;

func void dia_addon_henry_hello_feind()
{
	AI_Output(other,self,"DIA_Addon_Henry_Hello_Feind_15_00");	//Nep��tel!
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Feind_04_01");	//Hlup�ku. Jsi p�ipraven� na v�prask?
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Feind_04_02");	//Pov�z co chce�, nebo vypadni.
	HENRY_SC_FRECH = TRUE;
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PIR_1354_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
	Info_ClearChoices(dia_addon_henry_hello);
};

func void dia_addon_henry_hello_freund()
{
	AI_Output(other,self,"DIA_Addon_Henry_Hello_Freund_15_00");	//P��tel!
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Freund_04_01");	//To m��e ��ct ka�d�! Ani t� nezn�m. Co tu vlastn� d�l�?
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PIR_1354_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
	Info_ClearChoices(dia_addon_henry_hello);
};


instance DIA_ADDON_HENRY_SECONDWARN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 2;
	condition = dia_addon_henry_secondwarn_condition;
	information = dia_addon_henry_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_henry_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PIR_1354_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_addon_henry_secondwarn_info()
{
	AI_Output(self,other,"DIA_Addon_Henry_SecondWarn_04_00");	//P�ibl� se je�t� o krok bl� k t�boru a nakrm�m s tebou �raloky.
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PIR_1354_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_HENRY_ATTACK(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 3;
	condition = dia_addon_henry_attack_condition;
	information = dia_addon_henry_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_henry_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PIR_1354_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_addon_henry_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_Output(self,other,"DIA_Addon_Henry_Attack_04_00");	//Koledoval sis o to ...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};


var int henry_zoll_whatfor;

instance DIA_ADDON_HENRY_WANTENTER(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 1;
	condition = dia_addon_henry_wantenter_condition;
	information = dia_addon_henry_wantenter_info;
	permanent = FALSE;
	description = "Chci j�t do t�bora!";
};


func int dia_addon_henry_wantenter_condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_henry_wantenter_info()
{
	var C_ITEM itm;
	AI_Output(other,self,"DIA_Addon_Henry_WantEnter_15_00");	//Chci j�t do t�bora!
	AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_01");	//Fakt? Tak to t� v�jde p�kn� draze.
	b_henry_gold(500);
	if(HENRY_ZOLL_WHATFOR == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_WantEnter_15_02");	//Co�e? A pro�?
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_03");	//Ty se� n�jak neodbytnej.
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_04");	//Tady v t�bo�e je mnoho v�c�, o kter� by ses mohl zaj�mat ...
		HENRY_ZOLL_WHATFOR = TRUE;
	};
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,itar_kdf_l) == TRUE) || (Hlp_IsItem(itm,itar_kdf_h) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon) == TRUE) || (Hlp_IsItem(itm,itar_mil_l) == TRUE) || (Hlp_IsItem(itm,itar_mil_m) == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_07");	//Vypad�, �e ma� dostatek zlata.
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_08");	//Men�� poplatek t� ur�it� nezabije.
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_09");	//Nebo jsi ty fajnov� hadry n�komu ukradl?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_10");	//Ur�it� m� n�jak� zlato, �e?
	};
};

func void b_henry_nojoin()
{
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_00");	//Jestli se k n�m chce� p�idat, tak t� asi mus�m zklamat, ml�den�e!
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_01");	//Kapit�n s polovinou chlap� z t�bora odplul na mo�e. A on je jedin�, kdo p��jm� nov� �leny.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_02");	//Ale m��e� po�kat, dokud se nevr�t�.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_03");	//Nesna� se tu ov�em zpusobit n�jak� probl�m!
};


instance DIA_ADDON_HENRY_EINIGEN2(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 2;
	condition = dia_addon_henry_einigen2_condition;
	information = dia_addon_henry_einigen2_info;
	description = "Tu m� 500 zlat�ch.";
};


func int dia_addon_henry_einigen2_condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,dia_addon_henry_wantenter) && !Npc_KnowsInfo(other,dia_addon_henry_einigen) && (Npc_HasItems(other,itmi_gold) >= 500))
	{
		return TRUE;
	};
};

func void dia_addon_henry_einigen2_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Einigen2_15_00");	//Tu ma� 500 zlat�ch.
	b_giveinvitems(other,self,itmi_gold,500);
	AI_Output(self,other,"DIA_Addon_Henry_Einigen2_04_01");	//V�born�. V�t�m t� v t�bo�e.
	b_henry_nojoin();
	self.aivar[AIV_PASSGATE] = TRUE;
};


instance DIA_ADDON_HENRY_EINIGEN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 3;
	condition = dia_addon_henry_einigen_condition;
	information = dia_addon_henry_einigen_info;
	description = "Nemohli bychom se dohodnut n�jak l�p?";
};


func int dia_addon_henry_einigen_condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,dia_addon_henry_wantenter))
	{
		return TRUE;
	};
};

func void dia_addon_henry_einigen_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Einigen_15_00");	//Nemohli bychom se dohodnut n�jak l�p?
	AI_Output(self,other,"DIA_Addon_Henry_Einigen_04_01");	//Mo�n�. Dej mi n�jak� dobr� d�vod a mo�n� t� to vyjde levn�ji.
};


instance DIA_ADDON_HENRY_MEATFORMORGAN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 4;
	condition = dia_addon_henry_meatformorgan_condition;
	information = dia_addon_henry_meatformorgan_info;
	permanent = FALSE;
	description = "M�m p�in�st Morganovi tohle maso.";
};


func int dia_addon_henry_meatformorgan_condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,dia_addon_henry_einigen) && (MIS_ALLIGATORJACK_BRINGMEAT == LOG_RUNNING) && (Npc_HasItems(other,itfomuttonraw) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_henry_meatformorgan_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_MeatForMorgan_15_00");	//M�m p�in�st Morganovi tohle maso.
	AI_Output(self,other,"DIA_Addon_Henry_MeatForMorgan_04_01");	//(ost�e) A kdo t� poslal?
	AI_Output(other,self,"DIA_Addon_Henry_MeatForMorgan_15_02");	//Alligator Jack. �ekl mi, �e Morgan na n�j u� �ek�.
	AI_Output(self,other,"DIA_Addon_Henry_MeatForMorgan_04_03");	//Rozum�m, rozum�m. P�ece se nebude obt�ovat s�m, �e?
};


instance DIA_ADDON_HENRY_MALCOM(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 5;
	condition = dia_addon_henry_malcom_condition;
	information = dia_addon_henry_malcom_info;
	description = "Pos�la m� Malcom...";
};


func int dia_addon_henry_malcom_condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,dia_addon_henry_einigen) && (MALCOMBOTSCHAFT == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_malcom_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Malcom_15_00");	//Pos�la m� Malcom. M�m ti vzk�zat, �e na ty tr�my pot�ebuje je�t� n�jak� �as.
	AI_Output(self,other,"DIA_Addon_Henry_Malcom_04_01");	//(lamentov�n�) Och ano, ano. To jsem si mohl myslet. Ur�it� mu to bude trvat celou v��nost.
	b_malcomexident();
};


instance DIA_ADDON_HENRY_BALTRAMPACK(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 6;
	condition = dia_addon_henry_baltrampack_condition;
	information = dia_addon_henry_baltrampack_info;
	description = "M�m z�silku pro Skipa. Je v t�bo�e?";
};


func int dia_addon_henry_baltrampack_condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,dia_addon_henry_einigen) && Npc_HasItems(other,itmi_packet_baltram4skip_addon))
	{
		return TRUE;
	};
};

func void dia_addon_henry_baltrampack_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_BaltramPack_15_00");	//M�m z�silku pro Skipa. Je v t�bo�e?
	AI_Output(self,other,"DIA_Addon_Henry_BaltramPack_04_01");	//Ano. Skip tu je. A co je�t� chce�?
};


var int henry_amount;

instance DIA_ADDON_HENRY_TRIBUT(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 7;
	condition = dia_addon_henry_tribut_condition;
	information = dia_addon_henry_tribut_info;
	permanent = TRUE;
	description = "Pus� m� dovnit�.";
};


func int dia_addon_henry_tribut_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_henry_einigen) && (self.aivar[AIV_PASSGATE] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_tribut_info()
{
	HENRY_AMOUNT = 500;
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_15_00");	//Pus� m� dovnit�.
	AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_01");	//Hmm ...
	if(Npc_KnowsInfo(other,dia_addon_henry_malcom))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_02");	//P�inesl jsi mi vzkaz od d�evorubce.
		HENRY_AMOUNT = HENRY_AMOUNT - 100;
	};
	if(Npc_KnowsInfo(other,dia_addon_henry_meatformorgan))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_03");	//Chce� si hr�t na posl��ka Aligatora Jacka a doru�it maso z mo��lov�ch krys Morganovi.
		HENRY_AMOUNT = HENRY_AMOUNT - 100;
	};
	if(Npc_KnowsInfo(other,dia_addon_henry_baltrampack))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_04");	//M� z�silku pro Skipa.
		HENRY_AMOUNT = HENRY_AMOUNT - 100;
	};
	if(MIS_HENRY_FREEBDTTOWER == LOG_SUCCESS)
	{
		if(HENRY_AMOUNT < 500)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_00");	//A nejlep�� na tom je:
		};
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_01");	//Postaral JSI se o ty spr�skan� psy na v�i.
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_02");	//Nemyslel jsem si, �e to vzl�dne� s�m.
		HENRY_AMOUNT = HENRY_AMOUNT - 200;
	};
	if(HENRY_AMOUNT <= 0)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_03");	//V� co, m��e� j�t dovnit� zadarmo.
		self.aivar[AIV_PASSGATE] = TRUE;
		Info_ClearChoices(dia_addon_henry_tribut);
	}
	else
	{
		b_henry_gold(HENRY_AMOUNT);
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_05");	//... anebo znovu zmizne�. Je to jednoduch�.
		Info_ClearChoices(dia_addon_henry_tribut);
		Info_AddChoice(dia_addon_henry_tribut,"To je dost.",dia_addon_henry_tribut_nein);
		if(Npc_HasItems(other,itmi_gold) >= HENRY_AMOUNT)
		{
			Info_AddChoice(dia_addon_henry_tribut,"Dobr�. Tu je tv� zlato.",dia_addon_henry_tribut_ja);
		};
	};
};

func void dia_addon_henry_tribut_ja()
{
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_ja_15_00");	//Dobr�. Tu je tv� zlato.
	b_giveinvitems(other,self,itmi_gold,HENRY_AMOUNT);
	AI_Output(self,other,"DIA_Addon_Henry_Tribut_ja_04_01");	//D�kuji. V�tam t� v na�em t�bo�e.
	b_henry_nojoin();
	Info_ClearChoices(dia_addon_henry_tribut);
	self.aivar[AIV_PASSGATE] = TRUE;
};

func void dia_addon_henry_tribut_nein()
{
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_nein_15_00");	//To je dost.
	if(HENRY_AMOUNT < 500)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_nein_04_03");	//No tak, u� jsem ti to dost zlevnil.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_nein_04_04");	//Tak potom vypadni.
	};
	Info_ClearChoices(dia_addon_henry_tribut);
};


instance DIA_ADDON_HENRY_PALISADE(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 11;
	condition = dia_addon_henry_palisade_condition;
	information = dia_addon_henry_palisade_info;
	permanent = FALSE;
	description = "Co tu dela�?";
};


func int dia_addon_henry_palisade_condition()
{
	if(GREGISBACK == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_henry_palisade_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_15_00");	//Co tu dela�?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_01");	//Co si mysl�? Mus�m dohl�dnut na tyhle slabochy, aby dostav�li palis�du.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_02");	//Jak to nepostav�me, tak m� kapit�n Greg nakope do zadku.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_03");	//Nav�c mus�m dohl�et na to, aby sem nenapochodoval ka�d�, komu se zachce!
};


instance DIA_ADDON_HENRY_PALISADE_WHATFOR(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 12;
	condition = dia_addon_henry_palisade_whatfor_condition;
	information = dia_addon_henry_palisade_whatfor_info;
	permanent = FALSE;
	description = "Pro� tu stav�te palisadu?";
};


func int dia_addon_henry_palisade_whatfor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_henry_palisade))
	{
		return TRUE;
	};
};

func void dia_addon_henry_palisade_whatfor_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_WhatFor_15_00");	//Pro� tu stav�te palisadu?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_10");	//Aby to banditi nem�li TAK jednoduch�!
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_02");	//Ti bastardi jsou ��md�l drzej��. Ji� n�kolik dn� obkli�uj� n� t�bor. P�esn� jako �raloci obkli�uj� ztroskotance na mo�i.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_11");	//N�kolik t�ch bastard� se ukrylo do v�e na jih od t�bora.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_12");	//Ale jsem si jist, �e je to jen v�zv�dn� hl�dka.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_03");	//Jestli jsou tak blb�, �e na n�s za�to��, tak je p�iv�t�me jak se pat��.
	Log_CreateTopic(TOPIC_ADDON_BANDITSTOWER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BANDITSTOWER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BANDITSTOWER,"N�kolik bandit� se usadilo ve v�i na jih od pir�tsk�ho t�bora a zabarik�dovali se tam.");
};

func void b_henry_whereistower()
{
	AI_Output(other,self,"DIA_Addon_Francis_BanditsDead_15_08");	//Kde p�esn� je ta v�?
	AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_07");	//Vyjdi odsud a dr� se vpravo.
	AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_08");	//Tam, na mal�m �tesu, najde� v�.
};


instance DIA_ADDON_HENRY_TURMBANDITEN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 13;
	condition = dia_addon_henry_turmbanditen_whatfor_condition;
	information = dia_addon_henry_turmbanditen_whatfor_info;
	permanent = TRUE;
	description = "Ohledn� t�ch bandit� z v�e ...";
};


func int dia_addon_henry_turmbanditen_whatfor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_henry_palisade_whatfor) && (MIS_HENRY_FREEBDTTOWER != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_henry_turmbanditen_whatfor_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Turmbanditen_15_00");	//Ohledn� t�ch bandit� z v�e ...
	if(c_towerbanditsdead() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_01");	//Ano?
		AI_Output(other,self,"DIA_Addon_Francis_BanditsDead_15_01");	//Postaral jsem se o to.
		if(MIS_HENRY_FREEBDTTOWER == LOG_RUNNING)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_02");	//Vyborn�! O jeden probl�m m��.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_03");	//Fakt jsi je vyhnal s�m? Jse� dobrej!
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_04");	//Kdo v�, mo�n� se z tebe jednou stane opravdov� pir�t!
		};
		sawpirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(sawpirate,"START");
		hammerpirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(hammerpirate,"START");
		MIS_HENRY_FREEBDTTOWER = LOG_SUCCESS;
		b_logentry(TOPIC_ADDON_BANDITSTOWER,"Banditi z v�e jsou mrtv�.");
		b_giveplayerxp(XP_ADDON_HENRY_FREEBDTTOWER);
	}
	else if(MIS_HENRY_FREEBDTTOWER == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_07");	//Co te�?
		b_henry_whereistower();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_05");	//Jestli se chyst� j�t na n� S�M, tak na to zapome�!
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_06");	//P�inejhor��m tam po�lu dva sv� chlapy. Oni se o ty bandity postaraj�.
		KNOWS_HENRYSENTERTRUPP = TRUE;
	};
};


instance DIA_ADDON_HENRY_PALISADE_BANDITS(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 14;
	condition = dia_addon_henry_palisade_bandits_condition;
	information = dia_addon_henry_palisade_bandits_info;
	permanent = FALSE;
	description = "Pro� na v�s banditi �to��?";
};


func int dia_addon_henry_palisade_bandits_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_henry_palisade_whatfor))
	{
		return TRUE;
	};
};

func void dia_addon_henry_palisade_bandits_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_Bandits_15_00");	//Pro� na v�s banditi �to��?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_04");	//Proto�e boj mezi n�mi a nimi pokra�uje! Co sis myslel?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_05");	//Na za��tku to bylo v po��dku. P�ivezli jsme je sem a oni se usadili v ba�in�ch, nechaj�c n�s na pokoji.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_06");	//Od t� doby za�ali napadat ka�d�ho, kdo k nim nepat��.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_07");	//Co jsem se doslechl, d�moni je vyhnali.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_08");	//Myslel jsem, �e cht�j� na�e lod�. Prece jen - nen� ��dnej jinej zp�sob, jak se odsud dostat.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_09");	//Zeptej se na to Skipa. Byl tam - a vyv�zl �ivej.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_10");	//Je to zaj�mav� p��b�h. U� mi o tom hodn� ��kal.
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_11");	//(podez��vav�) �koda �e si to nem��e� poslechnout, kdy� te� nem� na zaplacen� cla.
		HENRY_ZOLL_WHATFOR = TRUE;
	};
};


var int henry_entercrewmember;

instance DIA_ADDON_HENRY_ENTERCREW(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 31;
	condition = dia_addon_henry_entercrew_condition;
	information = dia_addon_henry_entercrew_info;
	permanent = TRUE;
	description = "Chci se p�idat do va�� party.";
};


func int dia_addon_henry_entercrew_condition()
{
	if((KNOWS_HENRYSENTERTRUPP == TRUE) && (HENRY_ENTERCREWMEMBER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_entercrew_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Entercrew_15_00");	//Chci se p�idat do va�� party.
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_00");	//(sm�ch) To nen� tak jednoduch� dostat se k n�m, chlap�e!
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_01");	//Nejd��v si mus�me popov�dat, zda t� v�bec pust�m do t�bora.
		HENRY_ZOLL_WHATFOR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_04_06");	//J�, v�t�m t� v na�� part�!
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_04_07");	//O jednoho mu�e v�c, kter� n�m pom��e ubr�nit se p�ed bandity.
		if(MIS_HENRY_FREEBDTTOWER == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_02");	//Hmm, cht�l jsem ��ct, aby sis vzal jednoho chlapa a vymydlil ty lumpy z v�e.
			AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_03");	//Ale ty jsi to u� ud�lal.
		}
		else
		{
			if(Npc_IsDead(sawpirate) && Npc_IsDead(hammerpirate))
			{
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_04");	//Oba moji chlapi jsou mrtv�. Vypad� to tak, �e si bude� muset poradit s�m.
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_05");	//Zbav sa t�ch bandit� ve v�i.
				b_logentry(TOPIC_ADDON_BANDITSTOWER,"Henry chce abych vyhnal bandity z v�e. Nedal mi ov�em nic na obranu.");
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_06");	//Seber si jednoho chlapa a vy�e�te ty bandity z v�e.
				HENRY_GETPARTYMEMBER = TRUE;
				b_logentry(TOPIC_ADDON_BANDITSTOWER,"Henry chce abych vyhnal bandity z v�e. M��u sebou vz�t jednoho mu�e.");
			};
			b_henry_whereistower();
			AI_Output(other,self,"DIA_Addon_Henry_Entercrew_15_09");	//V�dy s v�ma, pane.
			MIS_HENRY_FREEBDTTOWER = LOG_RUNNING;
		};
		HENRY_ENTERCREWMEMBER = TRUE;
	};
};


instance DIA_ADDON_HENRY_OWEN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 32;
	condition = dia_addon_henry_owen_condition;
	information = dia_addon_henry_owen_info;
	description = "Je je�t� n�co, s ��m bych mohl pomoct?";
};


func int dia_addon_henry_owen_condition()
{
	if((MIS_HENRY_FREEBDTTOWER == LOG_SUCCESS) && (HENRY_ENTERCREWMEMBER == TRUE) && !Npc_IsDead(malcom))
	{
		return TRUE;
	};
};

func void dia_addon_henry_owen_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Owen_15_01");	//Je je�t� n�co, s ��m bych mohl pomoct?
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_01");	//U� n�kolik dn� �ek�me na z�silku tr�m� na palis�du.
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_05");	//Malcom a Owen to m�li don�st u� d�vno.
	if(!Npc_KnowsInfo(other,dia_addon_henry_malcom))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Owen_04_06");	//D�evorubeck� t�bor je nedaleko odsud, u jezera na jihov�chod�.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Owen_04_07");	//Malcom s�ce �ekl �e to m��e trvat trochu d�le, ale ne�ekl �e to bude trvat celou v��nost.
	};
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_08");	//�ekni jim, �e �ek�me na ty tr�my.
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_09");	//Nezdr�uj se. Pov�z to rad�i OWENOVI. Malcom nen� spolehliv�.
	b_malcomexident();
	MIS_HENRY_HOLOWEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_HOLOWEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_HOLOWEN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_HOLOWEN,"Henry �ek� na tr�my na hradby. Ozn�mil jsem to Owenovi. Stoj� u jezera spolu s Malcomem.");
};

func void b_addon_henry_malcomsdead()
{
	AI_Output(self,other,"DIA_Addon_Henry_Owen2_Add_04_00");	//Stalo se n�co Malcomovi?
	AI_Output(other,self,"DIA_Addon_Henry_Owen2_Add_15_01");	//Je mrtv�.
	AI_Output(self,other,"DIA_Addon_Henry_Owen2_Add_04_02");	//Vypad� to, �e jeho �test� pominulo, co?
};


instance DIA_ADDON_HENRY_OWEN2(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 33;
	condition = dia_addon_henry_owen2_condition;
	information = dia_addon_henry_owen2_info;
	permanent = TRUE;
	description = "O d�evorubci Owenovi ...";
};


func int dia_addon_henry_owen2_condition()
{
	if(MIS_HENRY_HOLOWEN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_henry_owen2_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_00");	//O d�evorubci Owenovi ...
	if(Npc_IsDead(pir_1367_addon_owen) == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_01");	//Je mrtv�.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_02");	//Sakra! To znamen�, �e se o to mus� postarat n�kdo jin�.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_03");	//(podr�d�n�) Je na�ase, aby Morgan za�al d�lat svoji pr�ci po��dn� a vy�istil oblast od v�ech p��er.
		b_addon_henry_malcomsdead();
		MIS_HENRY_HOLOWEN = LOG_OBSOLETE;
		b_logentry(TOPIC_ADDON_HOLOWEN,"Owen a Malcom jsou mrtv�.");
		Log_SetTopicStatus(TOPIC_ADDON_HOLOWEN,LOG_OBSOLETE);
	}
	else if(OWEN_COMESTOHENRY == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_03");	//Owen brzo po�le tr�my.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_04");	//V�born�, u� bylo na�ase.
		b_addon_henry_malcomsdead();
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_05");	//Tady je tv� odm�na.
		b_giveinvitems(self,other,itmi_gold,200);
		b_startotherroutine(pir_1367_addon_owen,"PostStart");
		b_logentry(TOPIC_ADDON_HOLOWEN,"Owen po�le tr�my Henrymu.");
		MIS_HENRY_HOLOWEN = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_OWEN_COMESTOHENRY);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_06");	//Kde se zase ut�bo�il?
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_07");	//Nen� to daleko odsud, sm�rem na jihov�chod, bl�zko jezera.
	};
};


var int henry_perm_once;

instance DIA_ADDON_HENRY_PALISADE_CANHELP(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 34;
	condition = dia_addon_henry_palisade_canhelp_condition;
	information = dia_addon_henry_palisade_canhelp_info;
	permanent = TRUE;
	description = "Pot�ebuje� pomoc?";
};


func int dia_addon_henry_palisade_canhelp_condition()
{
	if((MIS_HENRY_HOLOWEN == LOG_SUCCESS) || (MIS_HENRY_HOLOWEN == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_palisade_canhelp_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_CanHelp_15_00");	//Pot�ebuje� pomoc?
	if(HENRY_PERM_ONCE == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_01");	//M� zku�enosti se stav�n�m palis�d?
		AI_Output(other,self,"DIA_Addon_Henry_Palisade_CanHelp_15_02");	//Ne, v�bec.
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_03");	//V tom p��pad� pro tebe nem�m vyu�it�. Jdi pomoct n�kam jinam.
		HENRY_PERM_ONCE = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_04");	//UH! A te� b� pro m� za m� kam chce�, ale hlavn� nevyru�uj m� d�ln�ky.
};


instance DIA_ADDON_HENRY_WHATTEACH(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 21;
	condition = dia_addon_henry_whatteach_condition;
	information = dia_addon_henry_whatteach_info;
	permanent = TRUE;
	description = "M��e� mi pomoct vylep�it se v boji?";
};


func int dia_addon_henry_whatteach_condition()
{
	if((KNOWS_HENRYSENTERTRUPP == TRUE) && (HENRY_ADDON_TEACHPLAYER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_whatteach_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_WhatTeach_Add_15_00");	//M��e� mi pomoct vylep�it se v boji?
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_01");	//(sm�ch) Nejrpve si spl� povinnosti. A� potom ti pov�m n�co o vylep�en� boje!
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_02");	//(�ibalsky) Moje povol�n� zahrnuje v�e.
		HENRY_ZOLL_WHATFOR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_03");	//Jist�, pro� ne?
		HENRY_ADDON_TEACHPLAYER = TRUE;
		Log_CreateTopic(TOPIC_ADDON_PIR_TEACHER,LOG_NOTE);
		b_logentry(TOPIC_ADDON_PIR_TEACHER,LOG_TEXT_ADDON_HENRYTEACH);
	};
};


var int henry_merke2h;
var int henry_labercount;

func void b_henry_commentfightskill()
{
	if(HENRY_LABERCOUNT == 0)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_01");	//U�� se rychle, jako spr�vnej pir�t.
		HENRY_LABERCOUNT = 1;
	}
	else if(HENRY_LABERCOUNT == 1)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_02");	//Jak bude� takhle pokra�ovat, m��e� nastoupit na galeje celkem s�m.
		HENRY_LABERCOUNT = 2;
	}
	else if(HENRY_LABERCOUNT == 2)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_03");	//A pamatuj, kdo se kryje, �ije d�le.
		HENRY_LABERCOUNT = 0;
	};
};


instance DIA_ADDON_HENRY_TEACH(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 6;
	condition = dia_addon_henry_teach_condition;
	information = dia_addon_henry_teach_info;
	permanent = TRUE;
	description = "U� m�!";
};


func int dia_addon_henry_teach_condition()
{
	if(HENRY_ADDON_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_henry_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Teach_15_00");	//U� m�!
	HENRY_MERKE2H = other.hitchance[NPC_TALENT_2H];
	Info_ClearChoices(dia_addon_henry_teach);
	Info_AddChoice(dia_addon_henry_teach,DIALOG_BACK,dia_addon_henry_teach_back);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_addon_henry_teach_2h_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,1) * 5),dia_addon_henry_teach_2h_5);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_addon_henry_teach_cb_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_addon_henry_teach_cb_5);
};

func void dia_addon_henry_teach_back()
{
	if(other.hitchance[NPC_TALENT_2H] > HENRY_MERKE2H)
	{
		b_henry_commentfightskill();
	}
	else if(other.hitchance[NPC_TALENT_2H] >= 90)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Teach_Back_04_00");	//Pekeln� ses zlep�il.
	};
	Info_ClearChoices(dia_addon_henry_teach);
};

func void dia_addon_henry_teach_cb_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,1,75);
	Info_ClearChoices(dia_addon_henry_teach);
	Info_AddChoice(dia_addon_henry_teach,DIALOG_BACK,dia_addon_henry_teach_back);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_addon_henry_teach_2h_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,1) * 5),dia_addon_henry_teach_2h_5);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_addon_henry_teach_cb_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_addon_henry_teach_cb_5);
};

func void dia_addon_henry_teach_cb_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,5,75);
	Info_ClearChoices(dia_addon_henry_teach);
	Info_AddChoice(dia_addon_henry_teach,DIALOG_BACK,dia_addon_henry_teach_back);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_addon_henry_teach_2h_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,1) * 5),dia_addon_henry_teach_2h_5);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_addon_henry_teach_cb_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_addon_henry_teach_cb_5);
};

func void dia_addon_henry_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,90);
	Info_ClearChoices(dia_addon_henry_teach);
	Info_AddChoice(dia_addon_henry_teach,DIALOG_BACK,dia_addon_henry_teach_back);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_addon_henry_teach_2h_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,1) * 5),dia_addon_henry_teach_2h_5);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_addon_henry_teach_cb_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_addon_henry_teach_cb_5);
};

func void dia_addon_henry_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,90);
	Info_ClearChoices(dia_addon_henry_teach);
	Info_AddChoice(dia_addon_henry_teach,DIALOG_BACK,dia_addon_henry_teach_back);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_addon_henry_teach_2h_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,1) * 5),dia_addon_henry_teach_2h_5);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_addon_henry_teach_cb_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_addon_henry_teach_cb_5);
};


instance DIA_ADDON_HENRY_PALISADE_TRAIN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 11;
	condition = dia_addon_henry_palisade_train_condition;
	information = dia_addon_henry_palisade_train_info;
	permanent = FALSE;
	description = "Greg je tvuj ��f?";
};


func int dia_addon_henry_palisade_train_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_henry_palisade) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_palisade_train_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_Train_15_00");	//Greg je tvuj ��f?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_01");	//P�esn� tak. A pro tebe je to KAPIT�N Greg. M�m ti to vysv�tlit?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_02");	//Je to skv�l� mu�. Kdy� ho potk�, tak na n�j nezkou�ej �adnej podraz. Nemusela by se ti l�bit jeho reakce.
	if(pir_1300_addon_greg_nw.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Palisade_Train_15_03");	//Ve skute�nosti jsem se s n�m u� potkal.
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_04");	//Ach tak. Tak�e v� o �em mluv�m.
	};
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_05");	//Nane���st� te� nen� v t�bo�e.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_06");	//Jeho z�stupce se jmenuje Francis.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_07");	//Po cel� den sed� p�ed Gregovou chatr��, a z�r� na n�s, jak pracujeme.
};


instance DIA_ADDON_HENRY_YOUROWNTRUPP(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 1;
	condition = dia_addon_henry_yourowntrupp_condition;
	information = dia_addon_henry_yourowntrupp_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_henry_yourowntrupp_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_henry_yourowntrupp_info()
{
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_04");	//Kapit�n z v�s ud�lal ��dnou partu, co?
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_05");	//Ano, d��v ne� se ujist�me, �e chlapi za�ali pracovat!
	AI_StopProcessInfos(self);
};

