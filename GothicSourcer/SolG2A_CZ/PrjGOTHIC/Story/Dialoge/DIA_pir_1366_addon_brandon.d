
instance DIA_ADDON_BRANDON_EXIT(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 999;
	condition = dia_addon_brandon_exit_condition;
	information = dia_addon_brandon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_brandon_exit_condition()
{
	return TRUE;
};

func void dia_addon_brandon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BRANDON_HELLO(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 1;
	condition = dia_addon_brandon_hello_condition;
	information = dia_addon_brandon_hello_info;
	important = TRUE;
};


func int dia_addon_brandon_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_brandon_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_00");	//Podívejme, novic!
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_01");	//A k tomu suchozemská krysa!
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_02");	//Nejsi trochu suchý na piráta.
};


instance DIA_ADDON_BRANDON_ANYNEWS(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 99;
	condition = dia_addon_brandon_anynews_condition;
	information = dia_addon_brandon_anynews_info;
	permanent = TRUE;
	description = "Nìco nového?";
};


func int dia_addon_brandon_anynews_condition()
{
	return TRUE;
};

func void dia_addon_brandon_anynews_info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_AnyNews_15_00");	//Nìco nového?
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_01");	//Vskutku. Jsem ranìn. Mohl bys mi dát léèivý lektvar?
		}
		else if(c_allcanyonrazordead() == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_02");	//Co pak? Pùjdeme dále nebo co?
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_03");	//Mùžeš se na nìco zeptat! Myslím že tu nejsou jednotlivé bøitvy!
		};
	}
	else if((GREGISBACK == TRUE) && !Npc_IsDead(greg) && (MIS_ADDON_GREG_CLEARCANYON != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_04");	//Ne, ale doufám že když je Greg zpátky, že se to rychle zmìní.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_06");	//Poèkej chvíli ...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_07");	//Nic se nezmìnilo, vše je jako pøedtím.
	};
};


instance DIA_ADDON_BRANDON_WANNALEARN(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 11;
	condition = dia_addon_brandon_wannalearn_condition;
	information = dia_addon_brandon_wannalearn_info;
	description = "Mùžeš mì nìco nauèit?";
};


func int dia_addon_brandon_wannalearn_condition()
{
	return TRUE;
};

func void dia_addon_brandon_wannalearn_info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_WannaLearn_15_00");	//Mùžeš mì nìco nauèit?
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_01");	//Tebe? Mùžu tì nauèit jak být silnìjší a obratnìjší.
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_02");	//Nicménì proè bych to mìl dìlat?
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_OfferDrink_15_00");	//Protože ti koupím drink?
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_03");	//To nezní špatné, tak nìco dones.
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_04");	//Ale nenos mi nìjaký levný dryák!
	MIS_BRANDON_BRINGHERING = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_PIR_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_PIR_TEACHER,LOG_TEXT_ADDON_BRANDONTEACH);
	Log_CreateTopic(TOPIC_ADDON_BRANDONBOOZE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BRANDONBOOZE,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_BRANDONBOOZE,"Musím koupit Bradonovi drink. Pouze pak mì bude uèit.");
};


instance DIA_ADDON_BRANDON_HOLEGROG(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 12;
	condition = dia_addon_brandon_holegrog_condition;
	information = dia_addon_brandon_holegrog_info;
	description = "Mám pro tebe grog.";
};


func int dia_addon_brandon_holegrog_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_brandon_wannalearn))
	{
		return TRUE;
	};
};

func void dia_addon_brandon_holegrog_info()
{
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_BringGrog_15_00");	//Mám pro tebe grog.
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_01");	//Chceš mì otrávit???
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_02");	//Zkoušíš mì otrávit? Víš vùbec, co je uvnitø?
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_03");	//Starý Samuel má dobrý chlast, dones mi nìco od nìj!
	if(PLAYER_KNOWSSCHNELLERHERING == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Brandon_Hello_15_05");	//Myslíš 'Rychlého sleïe'?
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_04");	//Jo, to si myslím!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_05");	//Už máš Samuelùv speciál?
		AI_Output(other,self,"DIA_Addon_Brandon_Hello_15_07");	//Ne, ještì ne.
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_06");	//Stùj, mìls to pouze zkusit!
	};
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_08");	//Miluji tento Ïábelský nápoj!
	b_logentry(TOPIC_ADDON_BRANDONBOOZE,"Grog není pro Brandona dost dobrý. Chce 'Rychlého sleïe'. Pouze Samuel má tento chlast.");
};


instance DIA_ADDON_BRANDON_SCHNELLERHERING(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 13;
	condition = dia_addon_brandon_schnellerhering_condition;
	information = dia_addon_brandon_schnellerhering_info;
	description = "Zkus to!";
};


func int dia_addon_brandon_schnellerhering_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_brandon_wannalearn) && (Npc_HasItems(other,itfo_addon_schnellerhering) > 0))
	{
		return TRUE;
	};
};

func void dia_addon_brandon_schnellerhering_info()
{
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_GiveGrog_15_00");	//Zkus to.
	b_giveinvitems(other,self,itfo_addon_schnellerhering,1);
	b_useitem(self,itfo_addon_schnellerhering);
	AI_Output(self,other,"DIA_Addon_Brandon_GiveGrog_04_01");	//Ahh! Jde to dolù jak tekutý oheò!
	b_logentry(TOPIC_ADDON_BRANDONBOOZE,"Dal jsem Bradonovi drink. Nyní mì bude rád uèit.");
	MIS_BRANDON_BRINGHERING = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


var int brandon_merke_str;
var int brandon_merke_dex;

instance DIA_ADDON_BRANDON_TEACHPLAYER(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 777;
	condition = dia_addon_brandon_teachplayer_condition;
	information = dia_addon_brandon_teachplayer_info;
	permanent = TRUE;
	description = "Nauè mì nìco!";
};


func int dia_addon_brandon_teachplayer_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_brandon_wannalearn))
	{
		return TRUE;
	};
};

func void dia_addon_brandon_teachplayer_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_TeachPlayer_15_00");	//Nauè mì nìco!
	BRANDON_MERKE_STR = other.attribute[ATR_STRENGTH];
	BRANDON_MERKE_DEX = other.attribute[ATR_DEXTERITY];
	if(MIS_BRANDON_BRINGHERING == LOG_SUCCESS)
	{
		Info_ClearChoices(dia_addon_brandon_teachplayer);
		Info_AddChoice(dia_addon_brandon_teachplayer,DIALOG_BACK,dia_addon_brandon_teachplayer_back);
		Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_addon_brandon_teachplayer_dex_1);
		Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_addon_brandon_teachplayer_dex_5);
		Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_brandon_teachplayer_str_1);
		Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_brandon_teachplayer_str_5);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_04_01");	//Pøedpokládal jsem, že mi pøineseš nìco slušného, chlapèe.
	};
};

func void dia_addon_brandon_teachplayer_back()
{
	if(other.attribute[ATR_STRENGTH] > BRANDON_MERKE_STR)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_Back_04_00");	//Dobrá práce chlape, zase jsi o trochu silnìjší.
	};
	if(other.attribute[ATR_DEXTERITY] > BRANDON_MERKE_DEX)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_Back_04_01");	//Èím jsi obratnìjší, tím lépe zasáhneš cíl.
	};
	Info_ClearChoices(dia_addon_brandon_teachplayer);
};

func void dia_addon_brandon_teachplayer_dex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(dia_addon_brandon_teachplayer);
	Info_AddChoice(dia_addon_brandon_teachplayer,DIALOG_BACK,dia_addon_brandon_teachplayer_back);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_addon_brandon_teachplayer_dex_1);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_addon_brandon_teachplayer_dex_5);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_brandon_teachplayer_str_1);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_brandon_teachplayer_str_5);
};

func void dia_addon_brandon_teachplayer_dex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(dia_addon_brandon_teachplayer);
	Info_AddChoice(dia_addon_brandon_teachplayer,DIALOG_BACK,dia_addon_brandon_teachplayer_back);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_addon_brandon_teachplayer_dex_1);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_addon_brandon_teachplayer_dex_5);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_brandon_teachplayer_str_1);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_brandon_teachplayer_str_5);
};

func void dia_addon_brandon_teachplayer_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(dia_addon_brandon_teachplayer);
	Info_AddChoice(dia_addon_brandon_teachplayer,DIALOG_BACK,dia_addon_brandon_teachplayer_back);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_addon_brandon_teachplayer_dex_1);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_addon_brandon_teachplayer_dex_5);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_brandon_teachplayer_str_1);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_brandon_teachplayer_str_5);
};

func void dia_addon_brandon_teachplayer_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(dia_addon_brandon_teachplayer);
	Info_AddChoice(dia_addon_brandon_teachplayer,DIALOG_BACK,dia_addon_brandon_teachplayer_back);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_addon_brandon_teachplayer_dex_1);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_addon_brandon_teachplayer_dex_5);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_brandon_teachplayer_str_1);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_brandon_teachplayer_str_5);
};


instance DIA_ADDON_BRANDON_ANHEUERN(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 11;
	condition = dia_addon_brandon_anheuern_condition;
	information = dia_addon_brandon_anheuern_info;
	permanent = FALSE;
	description = "Mìl bys mi pomoct.";
};


func int dia_addon_brandon_anheuern_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_brandon_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_FollowMe_15_00");	//Mìl bys mi pomoct.
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_01");	//To jsou opravdu velké novinky. Kdo to øíkal?
	AI_Output(other,self,"DIA_Addon_Brandon_FollowMe_15_02");	//Greg, mìli bychom zabít bøitvy v kaòonu.
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_03");	//Tak máme tady koneènì boj!
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_04");	//Pro mì za mì, èím døív zabijeme ty bestie, tím døív se vrátíme.
};


instance DIA_ADDON_BRANDON_COMEON(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 12;
	condition = dia_addon_brandon_comeon_condition;
	information = dia_addon_brandon_comeon_info;
	permanent = TRUE;
	description = "Pojï se mnou.";
};


func int dia_addon_brandon_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_brandon_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_brandon_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_Weiter_15_00");	//Pojï se mnou.
	if(c_gregspiratestoofar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_ComeOn_04_02");	//Pojïme trochu zpìt.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_ComeOn_04_01");	//Jako obvykle!
		AI_StopProcessInfos(self);
		b_addon_piratesfollowagain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_BRANDON_GOHOME(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 13;
	condition = dia_addon_brandon_gohome_condition;
	information = dia_addon_brandon_gohome_info;
	permanent = TRUE;
	description = "Už tì více nepotøebuji.";
};


func int dia_addon_brandon_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_brandon_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_DontNeedYou_15_00");	//Už tì více nepotøebuji.
	AI_Output(self,other,"DIA_Addon_Brandon_GoHome_04_01");	//V poøádku, bez problému.
	AI_Output(self,other,"DIA_Addon_Brandon_GoHome_04_02");	//Možná se ještì jednou spolu napijem.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_BRANDON_TOOFAR(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 14;
	condition = dia_addon_brandon_toofar_condition;
	information = dia_addon_brandon_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_brandon_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (c_gregspiratestoofar() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_brandon_toofar_info()
{
	AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_00");	//Chceš celý ostrov liduprázdný???
	if(c_howmanypiratesinparty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_01");	//Jdeme zpátky do tábora.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_02");	//Jdu zpìt do tábora.
	};
	b_addon_piratesgohome();
	AI_StopProcessInfos(self);
};

