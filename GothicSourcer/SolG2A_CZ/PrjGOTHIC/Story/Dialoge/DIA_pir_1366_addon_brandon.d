
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
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_00");	//Pod�vejme, novic!
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_01");	//A k tomu suchozemsk� krysa!
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_02");	//Nejsi trochu such� na pir�ta.
};


instance DIA_ADDON_BRANDON_ANYNEWS(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 99;
	condition = dia_addon_brandon_anynews_condition;
	information = dia_addon_brandon_anynews_info;
	permanent = TRUE;
	description = "N�co nov�ho?";
};


func int dia_addon_brandon_anynews_condition()
{
	return TRUE;
};

func void dia_addon_brandon_anynews_info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_AnyNews_15_00");	//N�co nov�ho?
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_01");	//Vskutku. Jsem ran�n. Mohl bys mi d�t l��iv� lektvar?
		}
		else if(c_allcanyonrazordead() == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_02");	//Co pak? P�jdeme d�le nebo co?
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_03");	//M��e� se na n�co zeptat! Mysl�m �e tu nejsou jednotliv� b�itvy!
		};
	}
	else if((GREGISBACK == TRUE) && !Npc_IsDead(greg) && (MIS_ADDON_GREG_CLEARCANYON != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_04");	//Ne, ale douf�m �e kdy� je Greg zp�tky, �e se to rychle zm�n�.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_06");	//Po�kej chv�li ...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_07");	//Nic se nezm�nilo, v�e je jako p�edt�m.
	};
};


instance DIA_ADDON_BRANDON_WANNALEARN(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 11;
	condition = dia_addon_brandon_wannalearn_condition;
	information = dia_addon_brandon_wannalearn_info;
	description = "M��e� m� n�co nau�it?";
};


func int dia_addon_brandon_wannalearn_condition()
{
	return TRUE;
};

func void dia_addon_brandon_wannalearn_info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_WannaLearn_15_00");	//M��e� m� n�co nau�it?
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_01");	//Tebe? M��u t� nau�it jak b�t siln�j�� a obratn�j��.
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_02");	//Nicm�n� pro� bych to m�l d�lat?
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_OfferDrink_15_00");	//Proto�e ti koup�m drink?
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_03");	//To nezn� �patn�, tak n�co dones.
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_04");	//Ale nenos mi n�jak� levn� dry�k!
	MIS_BRANDON_BRINGHERING = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_PIR_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_PIR_TEACHER,LOG_TEXT_ADDON_BRANDONTEACH);
	Log_CreateTopic(TOPIC_ADDON_BRANDONBOOZE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BRANDONBOOZE,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_BRANDONBOOZE,"Mus�m koupit Bradonovi drink. Pouze pak m� bude u�it.");
};


instance DIA_ADDON_BRANDON_HOLEGROG(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 12;
	condition = dia_addon_brandon_holegrog_condition;
	information = dia_addon_brandon_holegrog_info;
	description = "M�m pro tebe grog.";
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
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_BringGrog_15_00");	//M�m pro tebe grog.
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_01");	//Chce� m� otr�vit???
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_02");	//Zkou�� m� otr�vit? V� v�bec, co je uvnit�?
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_03");	//Star� Samuel m� dobr� chlast, dones mi n�co od n�j!
	if(PLAYER_KNOWSSCHNELLERHERING == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Brandon_Hello_15_05");	//Mysl� 'Rychl�ho sle�e'?
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_04");	//Jo, to si mysl�m!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_05");	//U� m� Samuel�v speci�l?
		AI_Output(other,self,"DIA_Addon_Brandon_Hello_15_07");	//Ne, je�t� ne.
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_06");	//St�j, m�ls to pouze zkusit!
	};
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_08");	//Miluji tento ��belsk� n�poj!
	b_logentry(TOPIC_ADDON_BRANDONBOOZE,"Grog nen� pro Brandona dost dobr�. Chce 'Rychl�ho sle�e'. Pouze Samuel m� tento chlast.");
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
	AI_Output(self,other,"DIA_Addon_Brandon_GiveGrog_04_01");	//Ahh! Jde to dol� jak tekut� ohe�!
	b_logentry(TOPIC_ADDON_BRANDONBOOZE,"Dal jsem Bradonovi drink. Nyn� m� bude r�d u�it.");
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
	description = "Nau� m� n�co!";
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
	AI_Output(other,self,"DIA_Addon_Francis_TeachPlayer_15_00");	//Nau� m� n�co!
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
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_04_01");	//P�edpokl�dal jsem, �e mi p�inese� n�co slu�n�ho, chlap�e.
	};
};

func void dia_addon_brandon_teachplayer_back()
{
	if(other.attribute[ATR_STRENGTH] > BRANDON_MERKE_STR)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_Back_04_00");	//Dobr� pr�ce chlape, zase jsi o trochu siln�j��.
	};
	if(other.attribute[ATR_DEXTERITY] > BRANDON_MERKE_DEX)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_Back_04_01");	//��m jsi obratn�j��, t�m l�pe zas�hne� c�l.
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
	description = "M�l bys mi pomoct.";
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
	AI_Output(other,self,"DIA_Addon_Brandon_FollowMe_15_00");	//M�l bys mi pomoct.
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_01");	//To jsou opravdu velk� novinky. Kdo to ��kal?
	AI_Output(other,self,"DIA_Addon_Brandon_FollowMe_15_02");	//Greg, m�li bychom zab�t b�itvy v ka�onu.
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_03");	//Tak m�me tady kone�n� boj!
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_04");	//Pro m� za m�, ��m d��v zabijeme ty bestie, t�m d��v se vr�t�me.
};


instance DIA_ADDON_BRANDON_COMEON(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 12;
	condition = dia_addon_brandon_comeon_condition;
	information = dia_addon_brandon_comeon_info;
	permanent = TRUE;
	description = "Poj� se mnou.";
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
	AI_Output(other,self,"DIA_Addon_Brandon_Weiter_15_00");	//Poj� se mnou.
	if(c_gregspiratestoofar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_ComeOn_04_02");	//Poj�me trochu zp�t.
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
	description = "U� t� v�ce nepot�ebuji.";
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
	AI_Output(other,self,"DIA_Addon_Brandon_DontNeedYou_15_00");	//U� t� v�ce nepot�ebuji.
	AI_Output(self,other,"DIA_Addon_Brandon_GoHome_04_01");	//V po��dku, bez probl�mu.
	AI_Output(self,other,"DIA_Addon_Brandon_GoHome_04_02");	//Mo�n� se je�t� jednou spolu napijem.
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
	AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_00");	//Chce� cel� ostrov lidupr�zdn�???
	if(c_howmanypiratesinparty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_01");	//Jdeme zp�tky do t�bora.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_02");	//Jdu zp�t do t�bora.
	};
	b_addon_piratesgohome();
	AI_StopProcessInfos(self);
};

