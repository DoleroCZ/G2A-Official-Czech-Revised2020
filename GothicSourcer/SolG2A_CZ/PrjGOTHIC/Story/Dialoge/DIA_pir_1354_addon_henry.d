
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
	AI_Output(self,other,"DIA_Addon_Henry_Hello_04_00");	//ST¡T!
	AI_Output(self,other,"DIA_Addon_Henry_Hello_04_01");	//P¯Ìtel nebo nep¯Ìtel?
	Info_ClearChoices(dia_addon_henry_hello);
	Info_AddChoice(dia_addon_henry_hello,"Nep¯Ìtel!",dia_addon_henry_hello_feind);
	Info_AddChoice(dia_addon_henry_hello,"P¯Ìtel!",dia_addon_henry_hello_freund);
};


var int henry_sc_frech;

func void dia_addon_henry_hello_feind()
{
	AI_Output(other,self,"DIA_Addon_Henry_Hello_Feind_15_00");	//Nep¯Ìtel!
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Feind_04_01");	//Hlup·ku. Jsi p¯ipraven˝ na v˝prask?
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Feind_04_02");	//PovÏz co chceö, nebo vypadni.
	HENRY_SC_FRECH = TRUE;
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PIR_1354_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
	Info_ClearChoices(dia_addon_henry_hello);
};

func void dia_addon_henry_hello_freund()
{
	AI_Output(other,self,"DIA_Addon_Henry_Hello_Freund_15_00");	//P¯Ìtel!
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Freund_04_01");	//To m˘ûe ¯Ìct kaûd˝! Ani tÏ nezn·m. Co tu vlastnÏ dÏl·ö?
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
	AI_Output(self,other,"DIA_Addon_Henry_SecondWarn_04_00");	//P¯iblÌû se jeötÏ o krok blÌû k t·boru a nakrmÌm s tebou ûraloky.
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
	description = "Chci jÌt do t·bora!";
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
	AI_Output(other,self,"DIA_Addon_Henry_WantEnter_15_00");	//Chci jÌt do t·bora!
	AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_01");	//Fakt? Tak to tÏ v˝jde pÏknÏ draze.
	b_henry_gold(500);
	if(HENRY_ZOLL_WHATFOR == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_WantEnter_15_02");	//Coûe? A proË?
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_03");	//Ty seö nÏjak neodbytnej.
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_04");	//Tady v t·bo¯e je mnoho vÏcÌ, o kterÈ by ses mohl zajÌmat ...
		HENRY_ZOLL_WHATFOR = TRUE;
	};
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,itar_kdf_l) == TRUE) || (Hlp_IsItem(itm,itar_kdf_h) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon) == TRUE) || (Hlp_IsItem(itm,itar_mil_l) == TRUE) || (Hlp_IsItem(itm,itar_mil_m) == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_07");	//Vypad·ö, ûe maö dostatek zlata.
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_08");	//MenöÌ poplatek tÏ urËitÏ nezabije.
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_09");	//Nebo jsi ty fajnovÈ hadry nÏkomu ukradl?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_10");	//UrËitÏ m·ö nÏjakÈ zlato, ûe?
	};
};

func void b_henry_nojoin()
{
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_00");	//Jestli se k n·m chceö p¯idat, tak tÏ asi musÌm zklamat, ml·denËe!
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_01");	//Kapit·n s polovinou chlap˘ z t·bora odplul na mo¯e. A on je jedin˝, kdo p¯Ìjm· novÈ Ëleny.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_02");	//Ale m˘ûeö poËkat, dokud se nevr·tÌ.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_03");	//Nesnaû se tu ovöem zpusobit nÏjak˝ problÈm!
};


instance DIA_ADDON_HENRY_EINIGEN2(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 2;
	condition = dia_addon_henry_einigen2_condition;
	information = dia_addon_henry_einigen2_info;
	description = "Tu m·ö 500 zlat˝ch.";
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
	AI_Output(other,self,"DIA_Addon_Henry_Einigen2_15_00");	//Tu maö 500 zlat˝ch.
	b_giveinvitems(other,self,itmi_gold,500);
	AI_Output(self,other,"DIA_Addon_Henry_Einigen2_04_01");	//V˝bornÏ. VÌt·m tÏ v t·bo¯e.
	b_henry_nojoin();
	self.aivar[AIV_PASSGATE] = TRUE;
};


instance DIA_ADDON_HENRY_EINIGEN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 3;
	condition = dia_addon_henry_einigen_condition;
	information = dia_addon_henry_einigen_info;
	description = "Nemohli bychom se dohodnut nÏjak lÌp?";
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
	AI_Output(other,self,"DIA_Addon_Henry_Einigen_15_00");	//Nemohli bychom se dohodnut nÏjak lÌp?
	AI_Output(self,other,"DIA_Addon_Henry_Einigen_04_01");	//Moûn·. Dej mi nÏjak˝ dobr˝ d˘vod a moûn· tÏ to vyjde levnÏji.
};


instance DIA_ADDON_HENRY_MEATFORMORGAN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 4;
	condition = dia_addon_henry_meatformorgan_condition;
	information = dia_addon_henry_meatformorgan_info;
	permanent = FALSE;
	description = "M·m p¯inÈst Morganovi tohle maso.";
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
	AI_Output(other,self,"DIA_Addon_Henry_MeatForMorgan_15_00");	//M·m p¯inÈst Morganovi tohle maso.
	AI_Output(self,other,"DIA_Addon_Henry_MeatForMorgan_04_01");	//(ost¯e) A kdo tÏ poslal?
	AI_Output(other,self,"DIA_Addon_Henry_MeatForMorgan_15_02");	//Alligator Jack. ÿekl mi, ûe Morgan na nÏj uû Ëek·.
	AI_Output(self,other,"DIA_Addon_Henry_MeatForMorgan_04_03");	//RozumÌm, rozumÌm. P¯ece se nebude obtÏûovat s·m, ûe?
};


instance DIA_ADDON_HENRY_MALCOM(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 5;
	condition = dia_addon_henry_malcom_condition;
	information = dia_addon_henry_malcom_info;
	description = "PosÌla mÏ Malcom...";
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
	AI_Output(other,self,"DIA_Addon_Henry_Malcom_15_00");	//PosÌla mÏ Malcom. M·m ti vzk·zat, ûe na ty tr·my pot¯ebuje jeötÏ nÏjak˝ Ëas.
	AI_Output(self,other,"DIA_Addon_Henry_Malcom_04_01");	//(lamentov·nÌ) Och ano, ano. To jsem si mohl myslet. UrËitÏ mu to bude trvat celou vÏËnost.
	b_malcomexident();
};


instance DIA_ADDON_HENRY_BALTRAMPACK(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 6;
	condition = dia_addon_henry_baltrampack_condition;
	information = dia_addon_henry_baltrampack_info;
	description = "M·m z·silku pro Skipa. Je v t·bo¯e?";
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
	AI_Output(other,self,"DIA_Addon_Henry_BaltramPack_15_00");	//M·m z·silku pro Skipa. Je v t·bo¯e?
	AI_Output(self,other,"DIA_Addon_Henry_BaltramPack_04_01");	//Ano. Skip tu je. A co jeötÏ chceö?
};


var int henry_amount;

instance DIA_ADDON_HENRY_TRIBUT(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 7;
	condition = dia_addon_henry_tribut_condition;
	information = dia_addon_henry_tribut_info;
	permanent = TRUE;
	description = "Pusù mÏ dovnit¯.";
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
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_15_00");	//Pusù mÏ dovnit¯.
	AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_01");	//Hmm ...
	if(Npc_KnowsInfo(other,dia_addon_henry_malcom))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_02");	//P¯inesl jsi mi vzkaz od d¯evorubce.
		HENRY_AMOUNT = HENRY_AMOUNT - 100;
	};
	if(Npc_KnowsInfo(other,dia_addon_henry_meatformorgan))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_03");	//Chceö si hr·t na poslÌËka Aligatora Jacka a doruËit maso z moË·lov˝ch krys Morganovi.
		HENRY_AMOUNT = HENRY_AMOUNT - 100;
	};
	if(Npc_KnowsInfo(other,dia_addon_henry_baltrampack))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_04");	//M·ö z·silku pro Skipa.
		HENRY_AMOUNT = HENRY_AMOUNT - 100;
	};
	if(MIS_HENRY_FREEBDTTOWER == LOG_SUCCESS)
	{
		if(HENRY_AMOUNT < 500)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_00");	//A nejlepöÌ na tom je:
		};
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_01");	//Postaral JSI se o ty spr·skan˝ psy na vÏûi.
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_02");	//Nemyslel jsem si, ûe to vzl·dneö s·m.
		HENRY_AMOUNT = HENRY_AMOUNT - 200;
	};
	if(HENRY_AMOUNT <= 0)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_03");	//VÌö co, m˘ûeö jÌt dovnit¯ zadarmo.
		self.aivar[AIV_PASSGATE] = TRUE;
		Info_ClearChoices(dia_addon_henry_tribut);
	}
	else
	{
		b_henry_gold(HENRY_AMOUNT);
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_05");	//... anebo znovu zmizneö. Je to jednoduchÈ.
		Info_ClearChoices(dia_addon_henry_tribut);
		Info_AddChoice(dia_addon_henry_tribut,"To je dost.",dia_addon_henry_tribut_nein);
		if(Npc_HasItems(other,itmi_gold) >= HENRY_AMOUNT)
		{
			Info_AddChoice(dia_addon_henry_tribut,"Dobr·. Tu je tvÈ zlato.",dia_addon_henry_tribut_ja);
		};
	};
};

func void dia_addon_henry_tribut_ja()
{
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_ja_15_00");	//Dobr·. Tu je tvÈ zlato.
	b_giveinvitems(other,self,itmi_gold,HENRY_AMOUNT);
	AI_Output(self,other,"DIA_Addon_Henry_Tribut_ja_04_01");	//DÏkuji. VÌtam tÏ v naöem t·bo¯e.
	b_henry_nojoin();
	Info_ClearChoices(dia_addon_henry_tribut);
	self.aivar[AIV_PASSGATE] = TRUE;
};

func void dia_addon_henry_tribut_nein()
{
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_nein_15_00");	//To je dost.
	if(HENRY_AMOUNT < 500)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_nein_04_03");	//No tak, uû jsem ti to dost zlevnil.
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
	description = "Co tu delaö?";
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
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_15_00");	//Co tu delaö?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_01");	//Co si myslÌö? MusÌm dohlÌdnut na tyhle slabochy, aby dostavÏli palis·du.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_02");	//Jak to nepostavÌme, tak mÏ kapit·n Greg nakope do zadku.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_03");	//NavÌc musÌm dohlÌûet na to, aby sem nenapochodoval kaûd˝, komu se zachce!
};


instance DIA_ADDON_HENRY_PALISADE_WHATFOR(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 12;
	condition = dia_addon_henry_palisade_whatfor_condition;
	information = dia_addon_henry_palisade_whatfor_info;
	permanent = FALSE;
	description = "ProË tu stavÌte palisadu?";
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
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_WhatFor_15_00");	//ProË tu stavÌte palisadu?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_10");	//Aby to banditi nemÏli TAK jednoduchÈ!
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_02");	//Ti bastardi jsou ËÌmd·l drzejöÌ. Jiû nÏkolik dnÌ obkliËujÌ n·ö t·bor. P¯esnÏ jako ûraloci obkliËujÌ ztroskotance na mo¯i.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_11");	//NÏkolik tÏch bastard˘ se ukrylo do vÏûe na jih od t·bora.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_12");	//Ale jsem si jist, ûe je to jen v˝zvÏdn· hlÌdka.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_03");	//Jestli jsou tak blbÌ, ûe na n·s za˙toËÌ, tak je p¯ivÌt·me jak se pat¯Ì.
	Log_CreateTopic(TOPIC_ADDON_BANDITSTOWER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BANDITSTOWER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BANDITSTOWER,"NÏkolik bandit˘ se usadilo ve vÏûi na jih od pir·tskÈho t·bora a zabarik·dovali se tam.");
};

func void b_henry_whereistower()
{
	AI_Output(other,self,"DIA_Addon_Francis_BanditsDead_15_08");	//Kde p¯esnÏ je ta vÏû?
	AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_07");	//Vyjdi odsud a drû se vpravo.
	AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_08");	//Tam, na malÈm ˙tesu, najdeö vÏû.
};


instance DIA_ADDON_HENRY_TURMBANDITEN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 13;
	condition = dia_addon_henry_turmbanditen_whatfor_condition;
	information = dia_addon_henry_turmbanditen_whatfor_info;
	permanent = TRUE;
	description = "OhlednÏ tÏch bandit˘ z vÏûe ...";
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
	AI_Output(other,self,"DIA_Addon_Henry_Turmbanditen_15_00");	//OhlednÏ tÏch bandit˘ z vÏûe ...
	if(c_towerbanditsdead() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_01");	//Ano?
		AI_Output(other,self,"DIA_Addon_Francis_BanditsDead_15_01");	//Postaral jsem se o to.
		if(MIS_HENRY_FREEBDTTOWER == LOG_RUNNING)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_02");	//VybornÏ! O jeden problÈm mÌÚ.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_03");	//Fakt jsi je vyhnal s·m? Jseö dobrej!
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_04");	//Kdo vÌ, moûn· se z tebe jednou stane opravdov˝ pir·t!
		};
		sawpirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(sawpirate,"START");
		hammerpirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(hammerpirate,"START");
		MIS_HENRY_FREEBDTTOWER = LOG_SUCCESS;
		b_logentry(TOPIC_ADDON_BANDITSTOWER,"Banditi z vÏûe jsou mrtvÌ.");
		b_giveplayerxp(XP_ADDON_HENRY_FREEBDTTOWER);
	}
	else if(MIS_HENRY_FREEBDTTOWER == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_07");	//Co teÔ?
		b_henry_whereistower();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_05");	//Jestli se chyst·ö jÌt na nÏ S¡M, tak na to zapomeÚ!
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_06");	//P¯inejhoröÌm tam poölu dva svÈ chlapy. Oni se o ty bandity postarajÌ.
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
	description = "ProË na v·s banditi ˙toËÌ?";
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
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_Bandits_15_00");	//ProË na v·s banditi ˙toËÌ?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_04");	//Protoûe boj mezi n·mi a nimi pokraËuje! Co sis myslel?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_05");	//Na zaË·tku to bylo v po¯·dku. P¯ivezli jsme je sem a oni se usadili v baûin·ch, nechajÌc n·s na pokoji.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_06");	//Od tÈ doby zaËali napadat kaûdÈho, kdo k nim nepat¯Ì.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_07");	//Co jsem se doslechl, dÈmoni je vyhnali.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_08");	//Myslel jsem, ûe chtÏjÌ naöe lodÏ. Prece jen - nenÌ û·dnej jinej zp˘sob, jak se odsud dostat.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_09");	//Zeptej se na to Skipa. Byl tam - a vyv·zl ûivej.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_10");	//Je to zajÌmav˝ p¯ÌbÏh. Uû mi o tom hodnÏ ¯Ìkal.
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_11");	//(podez¯ÌvavÏ) äkoda ûe si to nem˘ûeö poslechnout, kdyû teÔ nem·ö na zaplacenÌ cla.
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
	description = "Chci se p¯idat do vaöÌ party.";
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
	AI_Output(other,self,"DIA_Addon_Henry_Entercrew_15_00");	//Chci se p¯idat do vaöÌ party.
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_00");	//(smÌch) To nenÌ tak jednoduch˝ dostat se k n·m, chlapËe!
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_01");	//Nejd¯Ìv si musÌme popovÌdat, zda tÏ v˘bec pustÌm do t·bora.
		HENRY_ZOLL_WHATFOR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_04_06");	//JÛ, vÌt·m tÏ v naöÌ partÏ!
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_04_07");	//O jednoho muûe vÌc, kter˝ n·m pom˘ûe ubr·nit se p¯ed bandity.
		if(MIS_HENRY_FREEBDTTOWER == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_02");	//Hmm, chtÏl jsem ¯Ìct, aby sis vzal jednoho chlapa a vymydlil ty lumpy z vÏûe.
			AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_03");	//Ale ty jsi to uû udÏlal.
		}
		else
		{
			if(Npc_IsDead(sawpirate) && Npc_IsDead(hammerpirate))
			{
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_04");	//Oba moji chlapi jsou mrtvÌ. Vypad· to tak, ûe si budeö muset poradit s·m.
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_05");	//Zbav sa tÏch bandit˘ ve vÏûi.
				b_logentry(TOPIC_ADDON_BANDITSTOWER,"Henry chce abych vyhnal bandity z vÏûe. Nedal mi ovöem nic na obranu.");
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_06");	//Seber si jednoho chlapa a vyûeÚte ty bandity z vÏûe.
				HENRY_GETPARTYMEMBER = TRUE;
				b_logentry(TOPIC_ADDON_BANDITSTOWER,"Henry chce abych vyhnal bandity z vÏûe. M˘ûu sebou vzÌt jednoho muûe.");
			};
			b_henry_whereistower();
			AI_Output(other,self,"DIA_Addon_Henry_Entercrew_15_09");	//Vûdy s v·ma, pane.
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
	description = "Je jeötÏ nÏco, s ËÌm bych mohl pomoct?";
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
	AI_Output(other,self,"DIA_Addon_Henry_Owen_15_01");	//Je jeötÏ nÏco, s ËÌm bych mohl pomoct?
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_01");	//Uû nÏkolik dnÌ Ëek·me na z·silku tr·m˘ na palis·du.
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_05");	//Malcom a Owen to mÏli donÈst uû d·vno.
	if(!Npc_KnowsInfo(other,dia_addon_henry_malcom))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Owen_04_06");	//D¯evorubeck˝ t·bor je nedaleko odsud, u jezera na jihov˝chodÏ.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Owen_04_07");	//Malcom sÌce ¯ekl ûe to m˘ûe trvat trochu dÈle, ale ne¯ekl ûe to bude trvat celou vÏËnost.
	};
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_08");	//ÿekni jim, ûe Ëek·me na ty tr·my.
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_09");	//Nezdrûuj se. PovÏz to radöi OWENOVI. Malcom nenÌ spolehliv˝.
	b_malcomexident();
	MIS_HENRY_HOLOWEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_HOLOWEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_HOLOWEN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_HOLOWEN,"Henry Ëek· na tr·my na hradby. Ozn·mil jsem to Owenovi. StojÌ u jezera spolu s Malcomem.");
};

func void b_addon_henry_malcomsdead()
{
	AI_Output(self,other,"DIA_Addon_Henry_Owen2_Add_04_00");	//Stalo se nÏco Malcomovi?
	AI_Output(other,self,"DIA_Addon_Henry_Owen2_Add_15_01");	//Je mrtv˝.
	AI_Output(self,other,"DIA_Addon_Henry_Owen2_Add_04_02");	//Vypad· to, ûe jeho ötestÌ pominulo, co?
};


instance DIA_ADDON_HENRY_OWEN2(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 33;
	condition = dia_addon_henry_owen2_condition;
	information = dia_addon_henry_owen2_info;
	permanent = TRUE;
	description = "O d¯evorubci Owenovi ...";
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
	AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_00");	//O d¯evorubci Owenovi ...
	if(Npc_IsDead(pir_1367_addon_owen) == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_01");	//Je mrtv˝.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_02");	//Sakra! To znamen·, ûe se o to musÌ postarat nÏkdo jin˝.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_03");	//(podr·ûdÏnÏ) Je naËase, aby Morgan zaËal dÏlat svoji pr·ci po¯·dnÏ a vyËistil oblast od vöech p¯Ìöer.
		b_addon_henry_malcomsdead();
		MIS_HENRY_HOLOWEN = LOG_OBSOLETE;
		b_logentry(TOPIC_ADDON_HOLOWEN,"Owen a Malcom jsou mrtvÌ.");
		Log_SetTopicStatus(TOPIC_ADDON_HOLOWEN,LOG_OBSOLETE);
	}
	else if(OWEN_COMESTOHENRY == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_03");	//Owen brzo poöle tr·my.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_04");	//V˝bornÏ, uû bylo naËase.
		b_addon_henry_malcomsdead();
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_05");	//Tady je tv· odmÏna.
		b_giveinvitems(self,other,itmi_gold,200);
		b_startotherroutine(pir_1367_addon_owen,"PostStart");
		b_logentry(TOPIC_ADDON_HOLOWEN,"Owen poöle tr·my Henrymu.");
		MIS_HENRY_HOLOWEN = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_OWEN_COMESTOHENRY);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_06");	//Kde se zase ut·bo¯il?
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_07");	//NenÌ to daleko odsud, smÏrem na jihov˝chod, blÌzko jezera.
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
	description = "Pot¯ebujeö pomoc?";
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
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_CanHelp_15_00");	//Pot¯ebujeö pomoc?
	if(HENRY_PERM_ONCE == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_01");	//M·ö zkuöenosti se stavÏnÌm palis·d?
		AI_Output(other,self,"DIA_Addon_Henry_Palisade_CanHelp_15_02");	//Ne, v˘bec.
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_03");	//V tom p¯ÌpadÏ pro tebe nem·m vyuûitÌ. Jdi pomoct nÏkam jinam.
		HENRY_PERM_ONCE = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_04");	//UH! A teÔ bÏû pro mÏ za mÏ kam chceö, ale hlavnÏ nevyruöuj mÈ dÏlnÌky.
};


instance DIA_ADDON_HENRY_WHATTEACH(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 21;
	condition = dia_addon_henry_whatteach_condition;
	information = dia_addon_henry_whatteach_info;
	permanent = TRUE;
	description = "M˘ûeö mi pomoct vylepöit se v boji?";
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
	AI_Output(other,self,"DIA_Addon_Henry_WhatTeach_Add_15_00");	//M˘ûeö mi pomoct vylepöit se v boji?
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_01");	//(smÌch) Nejrpve si splÚ povinnosti. Aû potom ti povÌm nÏco o vylepöenÌ boje!
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_02");	//(öibalsky) Moje povol·nÌ zahrnuje vöe.
		HENRY_ZOLL_WHATFOR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_03");	//JistÏ, proË ne?
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
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_01");	//UËÌö se rychle, jako spr·vnej pir·t.
		HENRY_LABERCOUNT = 1;
	}
	else if(HENRY_LABERCOUNT == 1)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_02");	//Jak budeö takhle pokraËovat, m˘ûeö nastoupit na galeje celkem s·m.
		HENRY_LABERCOUNT = 2;
	}
	else if(HENRY_LABERCOUNT == 2)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_03");	//A pamatuj, kdo se kryje, ûije dÈle.
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
	description = "UË mÏ!";
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
	AI_Output(other,self,"DIA_Addon_Henry_Teach_15_00");	//UË mÏ!
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
		AI_Output(self,other,"DIA_Addon_Henry_Teach_Back_04_00");	//PekelnÏ ses zlepöil.
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
	description = "Greg je tvuj öÈf?";
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
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_Train_15_00");	//Greg je tvuj öÈf?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_01");	//P¯esnÏ tak. A pro tebe je to KAPIT¡N Greg. M·m ti to vysvÏtlit?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_02");	//Je to skvÏl˝ muû. Kdyû ho potk·ö, tak na nÏj nezkouöej ûadnej podraz. Nemusela by se ti lÌbit jeho reakce.
	if(pir_1300_addon_greg_nw.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Palisade_Train_15_03");	//Ve skuteËnosti jsem se s nÌm uû potkal.
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_04");	//Ach tak. Takûe vÌö o Ëem mluvÌm.
	};
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_05");	//NaneöùÏstÌ teÔ nenÌ v t·bo¯e.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_06");	//Jeho z·stupce se jmenuje Francis.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_07");	//Po cel˝ den sedÌ p¯ed Gregovou chatrËÌ, a zÌr· na n·s, jak pracujeme.
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
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_04");	//Kapit·n z v·s udÏlal ¯·dnou partu, co?
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_05");	//Ano, d¯Ìv neû se ujistÌme, ûe chlapi zaËali pracovat!
	AI_StopProcessInfos(self);
};

