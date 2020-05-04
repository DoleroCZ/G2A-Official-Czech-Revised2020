
instance DIA_ALRIK_EXIT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 999;
	condition = dia_alrik_exit_condition;
	information = dia_alrik_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_alrik_exit_condition()
{
	return TRUE;
};

func void dia_alrik_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ALRIK_PICKPOCKET(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 900;
	condition = dia_alrik_pickpocket_condition;
	information = dia_alrik_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_alrik_pickpocket_condition()
{
	return c_beklauen(55,50);
};

func void dia_alrik_pickpocket_info()
{
	Info_ClearChoices(dia_alrik_pickpocket);
	Info_AddChoice(dia_alrik_pickpocket,DIALOG_BACK,dia_alrik_pickpocket_back);
	Info_AddChoice(dia_alrik_pickpocket,DIALOG_PICKPOCKET,dia_alrik_pickpocket_doit);
};

func void dia_alrik_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_alrik_pickpocket);
};

func void dia_alrik_pickpocket_back()
{
	Info_ClearChoices(dia_alrik_pickpocket);
};


instance DIA_ALRIK_HALLO(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_hallo_condition;
	information = dia_alrik_hallo_info;
	permanent = FALSE;
	description = "Co tady dÏl·ö?";
};


func int dia_alrik_hallo_condition()
{
	return TRUE;
};

func void dia_alrik_hallo_info()
{
	AI_Output(other,self,"DIA_Alrik_Hallo_15_00");	//Co tady dÏl·ö?
	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_01");	//(smÏje se) J· tady bydlÌm!
	}
	else if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_02");	//Co bych tu asi tak mÏl dÏlat? Piju!
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_03");	//Vyjdu si na menöÌ proch·zku.
	};
	AI_Output(self,other,"DIA_Alrik_Hallo_09_04");	//Ale jestli tÌm myslÌö, co dÏl·m cel˝ cen, tak po¯·d·m souboje.
};


instance DIA_ALRIK_YOUFIGHT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_youfight_condition;
	information = dia_alrik_youfight_info;
	permanent = FALSE;
	description = "Ty po¯·d·ö souboje?";
};


func int dia_alrik_youfight_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_hallo))
	{
		return TRUE;
	};
};

func void dia_alrik_youfight_info()
{
	AI_Output(other,self,"DIA_Alrik_YouFight_15_00");	//Ty po¯·d·ö souboje?
	AI_Output(self,other,"DIA_Alrik_YouFight_09_01");	//Kaûd˝ den od poledne do veËera.
	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_YouFight_09_02");	//A p¯Ìmo tady!
	};
	AI_Output(self,other,"DIA_Alrik_YouFight_09_03");	//Za skladiötÏm v p¯ÌstavnÌ Ëtvrti - vöude dob¯e, doma nejlÌp!
};


instance DIA_ALRIK_REGELN(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_regeln_condition;
	information = dia_alrik_regeln_info;
	permanent = FALSE;
	description = "Jsou nÏjak˝ pravidla?";
};


func int dia_alrik_regeln_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_youfight))
	{
		return TRUE;
	};
};

func void dia_alrik_regeln_info()
{
	AI_Output(other,self,"DIA_Alrik_Regeln_15_00");	//Jsou nÏjak˝ pravidla?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_01");	//Je to jednoduch˝: jsou povolen˝ vöechny norm·lnÌ zbranÏ. é·dn˝ luky ani kuöe a é¡DN¡ magie!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_02");	//Bojujeme, dokud jeden z n·s nepadne. Jakmile bude jeden leûet s drûkou v hlÌnÏ, je konec, jasn˝?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_03");	//Kaûd˝, kdo opustÌ mÌsto z·pasu, taky prohr·l. Takûe kdyû uteËeö, vyhr·l jsem j·!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_04");	//Z·pisnÈ je 50 zlaù·k˘ a kdyû vyhrajeö, dostaneö zp·tky stovku. Kdyû ne, tak o ty prachy p¯ijdeö (uöklÌbne se).
	AI_Output(self,other,"DIA_Alrik_Regeln_09_05");	//Ch·peö?
	AI_Output(other,self,"DIA_Alrik_Regeln_15_06");	//Jo!
};

func void b_alrik_again()
{
	AI_Output(self,other,"DIA_Alrik_Add_09_03");	//Tak co? Chceö si to se mnou znova rozdat? MyslÌm, ûe jsem se mezitÌm zlepöil.
};


instance DIA_ALRIK_NEWFIGHTS3(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_newfights3_condition;
	information = dia_alrik_newfights3_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alrik_newfights3_condition()
{
	if((KAPITEL >= 3) && (KAPITEL <= 4) && (ALRIK_ARENAKAMPFVERLOREN <= 6))
	{
		return TRUE;
	};
};

func void dia_alrik_newfights3_info()
{
	b_addfightskill(self,NPC_TALENT_1H,20);
	b_setattributestochapter(self,4);
	b_alrik_again();
};


instance DIA_ALRIK_NEWFIGHTS5(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_newfights5_condition;
	information = dia_alrik_newfights5_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alrik_newfights5_condition()
{
	if((KAPITEL >= 5) && (ALRIK_ARENAKAMPFVERLOREN <= 9))
	{
		return TRUE;
	};
};

func void dia_alrik_newfights5_info()
{
	b_addfightskill(self,NPC_TALENT_1H,20);
	b_setattributestochapter(self,6);
	b_alrik_again();
};

func void b_alrik_enough()
{
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_05");	//ÿekl bych, ûe uû ses navyhr·val dost.
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_06");	//Nech·pej mÏ öpatnÏ, ale od minula mi jeötÏ nep¯estalo huËet v hlavÏ.
};

func void b_alrik_comebacklater()
{
	AI_Output(self,other,"DIA_Alrik_Add_09_02");	//Tak se vraù pozdÏji - j· mezitÌm budu cviËit.
};


instance DIA_ALRIK_WANNAFIGHT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_wannafight_condition;
	information = dia_alrik_wannafight_info;
	permanent = TRUE;
	description = "Chci s tebou bojovat!";
};


func int dia_alrik_wannafight_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_regeln) && (self.aivar[AIV_ARENAFIGHT] == AF_NONE))
	{
		return TRUE;
	};
};

func void dia_alrik_wannafight_info()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_15_00");	//Chci s tebou bojovat!
	Info_ClearChoices(dia_alrik_wannafight);
	if(((ALRIK_ARENAKAMPFVERLOREN > 0) && (Npc_HasItems(self,itmw_alrikssword_mis) == 0)) || (Npc_HasEquippedMeleeWeapon(self) == FALSE))
	{
		if(MIS_ALRIK_SWORD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_01");	//Nejd¯Ìv mi vraù meË a pak uvidÌme.
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_02");	//Ne-e, neû se ti znova postavÌm, pot¯ebuju lepöÌ zbraÚ!
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_03");	//P¯ed p·r dny jsem musel prodat sv˘j meË.
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_04");	//S nÌm mÏ totiû nikdo neporazÌ, hochu! Kdyû mi ho p¯ineseö, klidnÏ si s tebou zase zabojuju!
			ALRIK_VOMSCHWERTERZAEHLT = TRUE;
			Log_CreateTopic(TOPIC_ALRIKSCHWERT,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_ALRIKSCHWERT,LOG_RUNNING);
			b_logentry(TOPIC_ALRIKSCHWERT,"Alrik prodal sv˘j meË obchodnÌku Jorovi. Bude se se mnou bÌt pouze tehdy, pokud mu jej p¯inesu zp·tky.");
		};
	}
	else if((KAPITEL <= 2) && (ALRIK_ARENAKAMPFVERLOREN > 3))
	{
		AI_Output(self,other,"DIA_Alrik_Add_09_00");	//MyslÌm, ûe to by prozatÌm mohlo staËit.
		AI_Output(self,other,"DIA_Alrik_Add_09_01");	//Nech mÏ trochu vydechnout.
		b_alrik_comebacklater();
	}
	else if((KAPITEL >= 3) && (KAPITEL <= 4) && (ALRIK_ARENAKAMPFVERLOREN > 6))
	{
		b_alrik_enough();
		b_alrik_comebacklater();
	}
	else if((KAPITEL >= 5) && (ALRIK_ARENAKAMPFVERLOREN > 9))
	{
		b_alrik_enough();
		AI_Output(self,other,"DIA_Alrik_Add_09_04");	//Krom toho jsem uû dal dohromady dost penÏz.
		AI_Output(self,other,"DIA_Alrik_Add_09_05");	//KonËÌm a jdu si ve mÏstÏ najÌt nÏjakÈ mÌsto, kde bych mohl z˘stat.
		AI_Output(self,other,"DIA_Alrik_Add_09_06");	//Kdo vÌ, moûn· si otev¯u obchod se zbranÏmi.
	}
	else if(Wld_IsTime(11,0,19,0))
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_07");	//M·ö 50 zlaù·k˘?
		Info_ClearChoices(dia_alrik_wannafight);
		Info_AddChoice(dia_alrik_wannafight,"Ani n·hodou...",dia_alrik_wannafight_nogold);
		if(Npc_HasItems(other,itmi_gold) >= 50)
		{
			Info_AddChoice(dia_alrik_wannafight,"Jak si p¯ejeö...",dia_alrik_wannafight_gold);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_08");	//Bojuju pouze od obÏda do veËera.
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_09");	//Boj stojÌ za to pouze tehdy, pokud je kolem dost div·k˘, kte¯Ì uzavÌrajÌ s·zky!
		if(Wld_IsTime(19,0,3,30))
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_10");	//TeÔ uû je moc pozdÏ, vraù se zÌtra v poledne!
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_11");	//TeÔ je jeötÏ brzo, vraù se pozdÏji!
		};
	};
};

func void dia_alrik_wannafight_gold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Gold_15_00");	//Jak si p¯ejeö.
	b_giveinvitems(other,self,itmi_gold,50);
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_01");	//(hlasitÏ) M·me tu novÈho vyzyvatele!
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_02");	//S·zky jsou uzav¯eny.
	Npc_RemoveInvItems(self,itmi_gold,Npc_HasItems(self,itmi_gold));
	CreateInvItems(self,itmi_gold,100);
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_03");	//Jsi p¯ipraven?
	self.aivar[AIV_ARENAFIGHT] = AF_RUNNING;
	ALRIK_KAEMPFE = ALRIK_KAEMPFE + 1;
	Info_ClearChoices(dia_alrik_wannafight);
	Info_AddChoice(dia_alrik_wannafight,"JeötÏ chvilku.",dia_alrik_wannafight_moment);
	Info_AddChoice(dia_alrik_wannafight,"PojÔ sem!",dia_alrik_wannafight_now);
};

func void dia_alrik_wannafight_nogold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NoGold_15_00");	//Ani n·hodou.
	AI_Output(self,other,"DIA_Alrik_WannaFight_NoGold_09_01");	//Tak je seûeÚ! Bez s·zek nenÌ û·dn˝ boj!
	Info_ClearChoices(dia_alrik_wannafight);
};

func void dia_alrik_wannafight_now()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NOW_15_00");	//PojÔ sem!
	AI_Output(self,other,"DIA_Alrik_WannaFight_NOW_09_01");	//Tak uvidÌme, jak to zvl·dneö!
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,itpo_health_03,1);
		b_useitem(self,itpo_health_03);
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_alrik_wannafight_moment()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Moment_15_00");	//JeötÏ chvilku.
	AI_Output(self,other,"DIA_Alrik_WannaFight_Moment_09_01");	//KlidnÏ si dej na Ëas - j· zaËÌn·m teÔ!
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,itpo_health_03,1);
		b_useitem(self,itpo_health_03);
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ALRIK_AFTERFIGHT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_afterfight_condition;
	information = dia_alrik_afterfight_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_alrik_afterfight_condition()
{
	if((self.aivar[AIV_LASTFIGHTCOMMENT] == FALSE) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE))
	{
		if(self.aivar[AIV_ARENAFIGHT] != AF_NONE)
		{
			return TRUE;
		}
		else if(Npc_IsInState(self,zs_talk))
		{
			return TRUE;
		};
	};
};

func void dia_alrik_afterfight_info()
{
	if((self.aivar[AIV_LASTPLAYERAR] == AR_NONE) && (self.aivar[AIV_ARENAFIGHT] != AF_NONE) && (self.aivar[AIV_ARENAFIGHT] != AF_AFTER_PLUS_DAMAGE))
	{
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_00");	//P·ni, chlape, ty m·ö ale sÌlu!
			if(Npc_HasItems(self,itmi_gold) >= 100)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_01");	//Tady m·ö tÏch 100 zlaù·k˘, zaslouûil sis je!
				b_giveinvitems(self,other,itmi_gold,100);
			}
			else if(Npc_HasItems(self,itmi_gold) == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_02");	//VidÌm, ûe svÈ zlato sis uû vzal.
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_03");	//MÏls ale poËkat, aû ti je d·m - j· svÈ slovo drûÌm!
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_04");	//Tys mÏ ale proöacoval, kdyû jsem byl v bezvÏdomÌ!
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_05");	//To nenÌ dobr˝, chlape! No, nevadÌ, ty prachy ti stejnÏ pat¯ily - a tady je zbytek!
				b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold));
			};
			ALRIK_ARENAKAMPFVERLOREN = ALRIK_ARENAKAMPFVERLOREN + 1;
		}
		else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_06");	//To byl dobr˝ boj. S·zku jsi ale prohr·l - nic si z toho ale nedÏlej, p¯ispÏls na dobrou vÏc! (uöklÌbne se)
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_07");	//Hej, jak jsem ¯ekl, kaûd˝, kdo se vzd·lÌ ze z·pasiötÏ, prohr·l! Jestli to chceö ale zkusit znova, jsem ti k dispozici!
		};
		if(ALRIK_KAEMPFE == 1)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_08");	//A jeötÏ jedna vÏc: o tom, co se dÏje za skladiötÏm, se nemluvÌ.
			if((other.guild != GIL_MIL) && (other.guild != GIL_PAL))
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_09");	//Domobrana tÏ m˘ûe öoupnout za m¯Ìûe za sebemenöÌ proh¯eöek - a s·zenÌ na souboje se jim rozhodnÏ moc nelÌbÌ.
			};
		};
		self.aivar[AIV_ARENAFIGHT] = AF_NONE;
		self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
	}
	else
	{
		if(self.aivar[AIV_ARENAFIGHT] == AF_AFTER_PLUS_DAMAGE)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_10");	//Boj skonËil, b¯Ìdile!
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_11");	//NelÌbÌ se mi, kdyû nÏkdo poruöuje pravidla.
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_12");	//Vypadni odsud!
		}
		else
		{
			if(ALRIK_KAEMPFE == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_13");	//Kdyû jsi se mnou chtÏl bojovat, staËilo, abys mÏ prostÏ vyzval.
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_14");	//Jestli chceö dalöÌ boj, tak mÏ k nÏmu prostÏ vyzvi!
			};
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_15");	//S takov˝mi pobudy, jako jsi ty, nechci nic mÌt! Odpal!
		};
		self.aivar[AIV_ARENAFIGHT] = AF_NONE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_ALRIK_DUWOHNST(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_duwohnst_condition;
	information = dia_alrik_duwohnst_info;
	permanent = FALSE;
	description = "Ty bydlÌö za skladiötÏm?";
};


func int dia_alrik_duwohnst_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_youfight))
	{
		return TRUE;
	};
};

func void dia_alrik_duwohnst_info()
{
	AI_Output(other,self,"DIA_Alrik_DuWohnst_15_00");	//(p¯ekvapenÏ) Ty bydlÌö za skladiötÏm?
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_01");	//Je to jenom doËasnÈ. (uöklÌbne se) Kdybys mÏl tolik penÏz co j·, taky by sis dop¯·l trochu pohodlÌ!
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_02");	//B˝val jsem v˝cvikov˝m instruktorem v arm·dÏ, ale pak jsem toho nechal a vydal se za dobrodruûstvÌm.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_03");	//A teÔ jsem skonËil v t˝hle öpinav˝ dÌ¯e a poslednÌch 100 zlaù·k˘ vysolil str·ûÌm u br·ny.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_04");	//Takûe teÔ kouk·m zase p¯ijÌt k nÏjak˝m penÏz˘m. Dokonce jsem musel prodat i sv˘j meË.
	ALRIK_VOMSCHWERTERZAEHLT = TRUE;
};


instance DIA_ALRIK_WERSCHWERT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_werschwert_condition;
	information = dia_alrik_werschwert_info;
	permanent = FALSE;
	description = "Komu jsi sv˘j meË prodal?";
};


func int dia_alrik_werschwert_condition()
{
	if((ALRIK_VOMSCHWERTERZAEHLT == TRUE) && (MIS_ALRIK_SWORD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_alrik_werschwert_info()
{
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_00");	//Komu jsi sv˘j meË prodal?
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_01");	//U jednoho obchodnÌka na trûiöti jsem jej vymÏnil za nÏjakÈ z·soby.
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_02");	//Ten chl·pek se jmenuje Jora. Ty pochodnÏ a trochu jÌdla, co mi dal, jsem uû d·vno spot¯eboval.
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_03");	//Ten meË mi ale asi jen tak zadarmo ned·.
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_04");	//Ten meË je star˝ a nejspÌö za nÏj moc chtÌt nebude. Mysli p¯itom na prachy, kterÈ si vydÏl·ö na s·zk·ch p¯i z·pase. (uöklÌbne se)
	MIS_ALRIK_SWORD = LOG_RUNNING;
};


var int alrik_einmalschwertbonus;

instance DIA_ALRIK_HAVESWORD(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_havesword_condition;
	information = dia_alrik_havesword_info;
	permanent = TRUE;
	description = "M·m ten tv˘j meË.";
};


func int dia_alrik_havesword_condition()
{
	if(Npc_HasItems(other,itmw_alrikssword_mis) > 0)
	{
		return TRUE;
	};
};

func void dia_alrik_havesword_info()
{
	AI_Output(other,self,"DIA_Alrik_HaveSword_15_00");	//M·m ten tv˘j meË.
	b_giveinvitems(other,self,itmw_alrikssword_mis,1);
	if(MIS_ALRIK_SWORD != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Alrik_HaveSword_09_01");	//P·ni! To je mnohem lepöÌ neû bojovat s nÏjak˝m star˝m klackem!
		MIS_ALRIK_SWORD = LOG_SUCCESS;
		b_giveplayerxp(XP_ALRIKSSWORD);
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_HaveSword_09_02");	//SkvÏlÈ! Jsem zvÏdav, jestli se mÏ teÔ odv·ûÌö vyzvat jeötÏ jednou!
	};
	if(ALRIK_EINMALSCHWERTBONUS == FALSE)
	{
		b_addfightskill(self,NPC_TALENT_1H,20);
		ALRIK_EINMALSCHWERTBONUS = TRUE;
	};
	AI_EquipBestMeleeWeapon(self);
};


instance DIA_ALRIK_KRIEG(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_krieg_condition;
	information = dia_alrik_krieg_info;
	permanent = FALSE;
	description = "Co vÌö o tÈ v·lce se sk¯ety?";
};


func int dia_alrik_krieg_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_duwohnst) || (hero.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_alrik_krieg_info()
{
	AI_Output(other,self,"DIA_Alrik_Krieg_15_00");	//Co vÌö o tÈ v·lce se sk¯ety?
	AI_Output(self,other,"DIA_Alrik_Krieg_09_01");	//K tomu nenÌ moc co ¯Ìct. Ta v·lka prostÏ trv· uû moc dlouho.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_02");	//Cel· zemÏ hladovÌ. Vöude propukajÌ rolnickÈ nepokoje, kterÈ kr·l nemilosrdnÏ potÌr·.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_03");	//Ale moc mu to nepom˘ûe - tÏch vzpour je p¯Ìliö mnoho. Jestli v·lka brzo neskonËÌ, cel· ¯Ìöe se rozpadne.
};


var int alrik_vorauserzaehlt;

instance DIA_ALRIK_AUSBILDEN(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_ausbilden_condition;
	information = dia_alrik_ausbilden_info;
	permanent = TRUE;
	description = "M˘ûeö mÏ uËit?";
};


func int dia_alrik_ausbilden_condition()
{
	if((Npc_KnowsInfo(other,dia_alrik_duwohnst) || (hero.guild != GIL_NONE)) && (ALRIK_TEACH1H == FALSE))
	{
		return TRUE;
	};
};

func void dia_alrik_ausbilden_info()
{
	AI_Output(other,self,"DIA_Alrik_Ausbilden_15_00");	//M˘ûeö mÏ uËit?
	if((ALRIK_KAEMPFE == 0) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Alrik_Ausbilden_09_01");	//Jestli se opravdu chceö nauËit bojovat, tak si to pojÔ rozdat se mnou. (dom˝ölivÏ) A ani si za tu lekci nebudeö muset p¯iplatit.
		ALRIK_VORAUSERZAEHLT = TRUE;
	}
	else
	{
		if(ALRIK_VORAUSERZAEHLT == TRUE)
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_02");	//DodrûÌm slovo a nauËÌm tÏ vöechno, co zn·m - pokud m·ö tedy dostatek zkuöenostÌ.
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_03");	//Jestli m·ö dostatek zkuöenostÌ, tak jasnÏ!
		};
		ALRIK_TEACH1H = TRUE;
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Alrik mÏ nauËÌ bojovat jednoruËnÌmi zbranÏmi. Potuluje se za skladiötÏm v p¯ÌstavnÌ Ëtvrti.");
	};
};


var int alrik_merke_1h;

instance DIA_ALRIK_TEACH(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_teach_condition;
	information = dia_alrik_teach_info;
	permanent = TRUE;
	description = "VycviË mÏ v boji s meËem!";
};


func int dia_alrik_teach_condition()
{
	if(ALRIK_TEACH1H == TRUE)
	{
		return TRUE;
	};
};

func void dia_alrik_teach_info()
{
	AI_Output(other,self,"DIA_Alrik_Teach_15_00");	//VycviË mÏ v boji s meËem!
	ALRIK_MERKE_1H = other.hitchance[NPC_TALENT_1H];
	Info_ClearChoices(dia_alrik_teach);
	Info_AddChoice(dia_alrik_teach,DIALOG_BACK,dia_alrik_teach_back);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_alrik_teach_1h_1);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_alrik_teach_1h_5);
};

func void dia_alrik_teach_back()
{
	if(other.hitchance[NPC_TALENT_1H] >= (60 - 30))
	{
		AI_Output(self,other,"DIA_Alrik_Teach_Back_09_00");	//Uû nejsi û·dn˝ nov·Ëek!
	}
	else if(other.hitchance[NPC_TALENT_1H] > ALRIK_MERKE_1H)
	{
		AI_Output(self,other,"DIA_Alrik_Teach_Back_09_01");	//Uû ses po¯·dnÏ zlepöil - brzo z tebe bude po¯·dn˝ bojovnÌk!
	};
	Info_ClearChoices(dia_alrik_teach);
};

func void dia_alrik_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,60);
	Info_ClearChoices(dia_alrik_teach);
	Info_AddChoice(dia_alrik_teach,DIALOG_BACK,dia_alrik_teach_back);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_alrik_teach_1h_1);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_alrik_teach_1h_5);
};

func void dia_alrik_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,60);
	Info_ClearChoices(dia_alrik_teach);
	Info_AddChoice(dia_alrik_teach,DIALOG_BACK,dia_alrik_teach_back);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_alrik_teach_1h_1);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_alrik_teach_1h_5);
};

