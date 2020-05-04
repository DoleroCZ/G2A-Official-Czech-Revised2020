
instance DIA_SYLVIODJG_EXIT(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 999;
	condition = dia_sylviodjg_exit_condition;
	information = dia_sylviodjg_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_sylviodjg_exit_condition()
{
	return 1;
};

func void dia_sylviodjg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIODJG_HELLOAGAIN(C_INFO)
{
	npc = djg_700_sylvio;
	condition = dia_sylviodjg_helloagain_condition;
	information = dia_sylviodjg_helloagain_info;
	important = TRUE;
};


func int dia_sylviodjg_helloagain_condition()
{
	if((Npc_IsDead(icedragon) == FALSE) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sylviodjg_helloagain_info()
{
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_00");	//Dobr·, aù se propadnu! Kouk·ö, jak si vydÏlat, co? VÏdÏl jsem to! M·ö ûold·ckou duöi.
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_01");	//Hele, jestli si myslÌö, ûe si tu m˘ûeö nahrabat, tak to se fakt pleteö. Byl jsem tu prvnÌ.
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_02");	//Hej, ty! M·govÈ mÏ znervÛzÚujÌ! BÏû nÏkam jinam! Tady pro tebe nic nenÌ.
	}
	else
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_03");	//Hej, ty, paladine! Vraù se zp·tky do tÏch svejch dol˘. Tady pro tebe nic nenÌ.
	};
	AI_Output(other,self,"DIA_SylvioDJG_HelloAgain_15_04");	//Jasn˝. Nikdo se nechce dÏlit o svou ko¯ist.
	AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_05");	//P¯esnÏ tak. Zmizni.
};


instance DIA_SYLVIO_VERSAGER(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 6;
	condition = dia_sylvio_versager_condition;
	information = dia_sylvio_versager_info;
	description = "A co kdyû se mi nechce?";
};


func int dia_sylvio_versager_condition()
{
	if(Npc_KnowsInfo(other,dia_sylviodjg_helloagain) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sylvio_versager_info()
{
	AI_Output(other,self,"DIA_Sylvio_VERSAGER_15_00");	//A co kdyû se mi nechce?
	AI_Output(self,other,"DIA_Sylvio_VERSAGER_09_01");	//Nehraj si na tvrÔ·ka, pÌskle, jinak skonËÌö jako ty mizern˝ svinÏ, co se v·lej t·mhle na snÏhu.
};


instance DIA_SYLVIO_DEINELEUTE(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 7;
	condition = dia_sylvio_deineleute_condition;
	information = dia_sylvio_deineleute_info;
	description = "To byli tvÌ lidÈ?";
};


func int dia_sylvio_deineleute_condition()
{
	if(Npc_KnowsInfo(other,dia_sylvio_versager) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (MIS_DJG_SYLVIO_KILLICEGOLEM == 0))
	{
		return TRUE;
	};
};

func void dia_sylvio_deineleute_info()
{
	AI_Output(other,self,"DIA_Sylvio_DEINELEUTE_15_00");	//To byli tvÌ lidÈ?
	AI_Output(self,other,"DIA_Sylvio_DEINELEUTE_09_01");	//Ne tak docela. é·dn˝ velk˝ ztr·ty. Ti idioti stejnÏ nest·li za nic.
};


instance DIA_SYLVIO_WASISTPASSIERT(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 8;
	condition = dia_sylvio_wasistpassiert_condition;
	information = dia_sylvio_wasistpassiert_info;
	description = "Co se jim stalo?";
};


func int dia_sylvio_wasistpassiert_condition()
{
	if(Npc_KnowsInfo(other,dia_sylvio_versager) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sylvio_wasistpassiert_info()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_15_00");	//Co se jim stalo?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_09_01");	//Nebyli schopn˝ se dostat tam p¯es ty ledov˝ obry. Z˘stali tam.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_09_02");	//Kdyû seö tak tvrdej, tak proË to nezkusÌö?
	Info_AddChoice(dia_sylvio_wasistpassiert,"Tak dobr·. ProË ne?",dia_sylvio_wasistpassiert_ok);
	Info_AddChoice(dia_sylvio_wasistpassiert,"K Ëemu ti bude dobr˝, kdyû to udÏl·m?",dia_sylvio_wasistpassiert_washastdudavon);
	Info_AddChoice(dia_sylvio_wasistpassiert,"Co z toho budu mÌt?",dia_sylvio_wasistpassiert_warum);
	Info_AddChoice(dia_sylvio_wasistpassiert,"ProË to nevy¯ÌdÌö s·m?",dia_sylvio_wasistpassiert_selbst);
	Log_CreateTopic(TOPIC_SYLVIOKILLICEGOLEM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SYLVIOKILLICEGOLEM,LOG_RUNNING);
	b_logentry(TOPIC_SYLVIOKILLICEGOLEM,"Sylvio se bojÌ dvou ledov˝ch golem˘ p¯ed vchodem do zamrzlÈ Ë·sti HornickÈho ˙dolÌ.");
	MIS_DJG_SYLVIO_KILLICEGOLEM = LOG_RUNNING;
};

func void dia_sylvio_wasistpassiert_selbst()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_selbst_15_00");	//ProË to nevy¯ÌdÌö s·m?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_selbst_09_01");	//Hele, nech si ty nafoukan˝ ¯eËi.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_selbst_09_02");	//Jak to j· vidÌm, seö podÏlanej strachy.
	Info_AddChoice(dia_sylvio_wasistpassiert,"Nem·m v ˙myslu p¯istoupit na tvoji hru.",dia_sylvio_wasistpassiert_keininteresse);
};


var int djg_sylvio_promisedmoney;

func void dia_sylvio_wasistpassiert_warum()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_warum_15_00");	//Co z toho budu mÌt?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_warum_09_01");	//HodnÏ. ÿeknÏme... 1000 zlat˝ch. To znÌ dob¯e, ne?
	DJG_SYLVIO_PROMISEDMONEY = TRUE;
};

func void dia_sylvio_wasistpassiert_washastdudavon()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_15_00");	//K Ëemu ti bude dobr˝, kdyû to udÏl·m?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_01");	//K tomu sam˝mu, co tobÏ. Ale abych ti odpovÏdÏl na ot·zku, chci se dostat do tÈ zamrzlÈ oblasti.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_02");	//Bohuûel, v cestÏ mi stojej ty zatracen˝ vÏci.
	Info_AddChoice(dia_sylvio_wasistpassiert,"Co chceö v tÈ zamrzlÈ oblasti dÏlat?",dia_sylvio_wasistpassiert_eisregion);
};

func void dia_sylvio_wasistpassiert_keininteresse()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_15_00");	//Nem·m v ˙myslu p¯istoupit na tvoji hru.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_09_01");	//Aha. Tak odsud koukej sypat, ty babo.
	AI_StopProcessInfos(self);
};

func void dia_sylvio_wasistpassiert_eisregion()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_15_00");	//Co chceö v tÈ zamrzlÈ oblasti dÏlat?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_01");	//Ty s tÏma ot·zkama nep¯estaneö, co? Dobr·, povÌm ti to.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_02");	//Tady, za tÌm sr·zem, je takov· ledov· pustina, jakou jsi nikdy p¯edtÌm nevidÏl.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_03");	//Spolu s tuËn˝mi z·sobami tam je ukryt˝ poklad ledovÈho draka.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_04");	//Chci ho dostat. Tak jak? Ano, nebo ne?
};

func void dia_sylvio_wasistpassiert_ok()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_ok_15_00");	//Tak dobr·. ProË ne?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_ok_09_01");	//Tak honem. Nem·m na to cel˝ den.
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIO_ICEGOLEMSKILLED(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 9;
	condition = dia_sylvio_icegolemskilled_condition;
	information = dia_sylvio_icegolemskilled_info;
	description = "Cesta je voln·! Ti ledovÌ ob¯i uû tam zacl·nÏt nebudou.";
};


func int dia_sylvio_icegolemskilled_condition()
{
	if(Npc_IsDead(icegolem_sylvio1) && Npc_IsDead(icegolem_sylvio2) && (MIS_DJG_SYLVIO_KILLICEGOLEM == LOG_RUNNING) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sylvio_icegolemskilled_info()
{
	AI_Output(other,self,"DIA_Sylvio_ICEGOLEMSKILLED_15_00");	//Cesta je voln·! Ti ledovÌ ob¯i uû tam zacl·nÏt nebudou.
	AI_Output(self,other,"DIA_Sylvio_ICEGOLEMSKILLED_09_01");	//Dobr· pr·ce. PodÌv·me se na to.
	if(DJG_SYLVIO_PROMISEDMONEY == TRUE)
	{
		AI_Output(other,self,"DIA_Sylvio_ICEGOLEMSKILLED_15_02");	//Tak moment. A co prachy?
		AI_Output(self,other,"DIA_Sylvio_ICEGOLEMSKILLED_09_03");	//Vöechno m· sv˘j Ëas.
	};
	AI_StopProcessInfos(self);
	MIS_DJG_SYLVIO_KILLICEGOLEM = LOG_SUCCESS;
	b_giveplayerxp(XP_SYLVIODJGICEGOLEMDEAD);
	Npc_ExchangeRoutine(self,"IceWait1");
	b_startotherroutine(djg_bullco,"IceWait1");
};


instance DIA_SYLVIO_WASJETZT(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 10;
	condition = dia_sylvio_wasjetzt_condition;
	information = dia_sylvio_wasjetzt_info;
	description = "Co d·l?";
};


func int dia_sylvio_wasjetzt_condition()
{
	if((MIS_DJG_SYLVIO_KILLICEGOLEM == LOG_SUCCESS) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sylvio_wasjetzt_info()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_15_00");	//Co d·l?
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_09_01");	//Fajn. ÿekl bych, ûe to vypad· pÏknÏ na levaËku.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_09_02");	//NejlÌp bude, kdyû p˘jdeö prvnÌ a j· za tebou.
	Info_AddChoice(dia_sylvio_wasjetzt,"Tak dobr·.",dia_sylvio_wasjetzt_ok);
	Info_AddChoice(dia_sylvio_wasjetzt,"BojÌö se?",dia_sylvio_wasjetzt_trennen);
	Info_AddChoice(dia_sylvio_wasjetzt,"Nebudu za tebe dÏlat öpinavou pr·ci.",dia_sylvio_wasjetzt_nein);
	if(DJG_SYLVIO_PROMISEDMONEY == TRUE)
	{
		Info_AddChoice(dia_sylvio_wasjetzt,"Nejd¯Ìv bych r·d vidÏl ty prachy.",dia_sylvio_wasjetzt_geld);
	};
};

func void dia_sylvio_wasjetzt_trennen()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_trennen_15_00");	//BojÌö se?
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_trennen_09_01");	//Nesmysl, p¯estaÚ ûvanit. Jdeme.
};

func void dia_sylvio_wasjetzt_ok()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_ok_15_00");	//Tak dobr·.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_ok_09_01");	//Fajn, pokraËuj, do toho.
	AI_StopProcessInfos(self);
};

func void dia_sylvio_wasjetzt_nein()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_nein_15_00");	//Nebudu za tebe dÏlat öpinavou pr·ci.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_nein_09_01");	//Babo!
	AI_StopProcessInfos(self);
};

func void dia_sylvio_wasjetzt_geld()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_Geld_15_00");	//Nejd¯Ìv bych r·d vidÏl ty prachy.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_Geld_09_01");	//Aû dostaneme toho draka, budeö mÌt penÏz, kolik uneseö.
	Info_AddChoice(dia_sylvio_wasjetzt,"Chci ty penÌze hned.",dia_sylvio_wasjetzt_jetztgeld);
};

func void dia_sylvio_wasjetzt_jetztgeld()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_jetztGeld_15_00");	//Chci ty penÌze hned.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_jetztGeld_09_01");	//BuÔ p˘jdeö vp¯edu, nebo si to s tebou vy¯Ìdim.
};


instance DIA_SYLVIO_KOMMSTDU(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 11;
	condition = dia_sylvio_kommstdu_condition;
	information = dia_sylvio_kommstdu_info;
	permanent = TRUE;
	description = "Myslel jsem, ûe m·me namÌ¯eno do tÈ zamrzlÈ oblasti.";
};


func int dia_sylvio_kommstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_sylvio_wasjetzt) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sylvio_kommstdu_info()
{
	AI_Output(other,self,"DIA_Sylvio_KOMMSTDU_15_00");	//Myslel jsem, ûe m·me namÌ¯eno do tÈ zamrzlÈ oblasti.
	AI_Output(self,other,"DIA_Sylvio_KOMMSTDU_09_01");	//PokraËuj d·l. Budu hned za tebou.
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIO_DUHIER(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 11;
	condition = dia_sylvio_duhier_condition;
	information = dia_sylvio_duhier_info;
	permanent = TRUE;
	description = "Pot¯ebovat bych nÏjakou pomoc.";
};


func int dia_sylvio_duhier_condition()
{
	if((Npc_IsDead(icedragon) == FALSE) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_sylvio_duhier_info()
{
	AI_Output(other,self,"DIA_Sylvio_DUHIER_15_00");	//Pot¯ebovat bych nÏjakou pomoc.
	AI_Output(self,other,"DIA_Sylvio_DUHIER_09_01");	//Nesmysl. Vedeö si dob¯e.
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIODJG_WHATNEXT(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 12;
	condition = dia_sylviodjg_whatnext_condition;
	information = dia_sylviodjg_whatnext_info;
	important = TRUE;
};


func int dia_sylviodjg_whatnext_condition()
{
	if(Npc_IsDead(icedragon))
	{
		return TRUE;
	};
};

func void dia_sylviodjg_whatnext_info()
{
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_00");	//Ledov˝ drak je mrtv˝! A teÔ mi dej vöechno, co u sebe m·ö!
	AI_Output(other,self,"DIA_SylvioDJG_WHATNEXT_15_01");	//Ani n·hodou!
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_02");	//Budu to j·, koho nemine sl·va za zabitÌ ledovÈho draka.
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_03");	//Tvoje nepodstatn· role je pr·vÏ u konce!
	TOPIC_END_SYLVIOKILLICEGOLEM = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_sylviodjg_whatnext);
	Info_AddChoice(dia_sylviodjg_whatnext,DIALOG_ENDE,dia_sylviodjg_whatnext_attack);
};

func void dia_sylviodjg_whatnext_attack()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	Npc_ExchangeRoutine(self,"Start");
	b_startotherroutine(djg_bullco,"Start");
	b_logentry(TOPIC_DRAGONHUNTER,"Ten hajzl Sylvio si dÏlal n·roky na moje vÌtÏzstvÌ nad ledov˝m drakem. Trochu jsme se kv˘li tomu poökorpili.");
	b_attack(self,other,AR_NONE,1);
	b_attack(djg_bullco,other,AR_NONE,1);
};


instance DIA_SYLVIODJG_BUTNOW(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 13;
	condition = dia_sylviodjg_butnow_condition;
	information = dia_sylviodjg_butnow_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_sylviodjg_butnow_condition()
{
	if(Npc_IsDead(icedragon) && (Npc_RefuseTalk(self) == FALSE) && Npc_KnowsInfo(other,dia_sylviodjg_whatnext))
	{
		return TRUE;
	};
};

func void dia_sylviodjg_butnow_info()
{
	AI_Output(self,other,"DIA_SylvioDJG_BUTNOW_09_00");	//Je naËase vyrovnat skÛre.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	b_attack(self,other,AR_NONE,1);
	b_attack(djg_bullco,other,AR_NONE,1);
};


instance DIA_SYLVIO_PICKPOCKET(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 900;
	condition = dia_sylvio_pickpocket_condition;
	information = dia_sylvio_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_sylvio_pickpocket_condition()
{
	return c_beklauen(78,560);
};

func void dia_sylvio_pickpocket_info()
{
	Info_ClearChoices(dia_sylvio_pickpocket);
	Info_AddChoice(dia_sylvio_pickpocket,DIALOG_BACK,dia_sylvio_pickpocket_back);
	Info_AddChoice(dia_sylvio_pickpocket,DIALOG_PICKPOCKET,dia_sylvio_pickpocket_doit);
};

func void dia_sylvio_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sylvio_pickpocket);
};

func void dia_sylvio_pickpocket_back()
{
	Info_ClearChoices(dia_sylvio_pickpocket);
};

