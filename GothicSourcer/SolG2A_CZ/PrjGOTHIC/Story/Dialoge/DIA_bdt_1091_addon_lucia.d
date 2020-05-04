
instance DIA_ADDON_LUCIA_EXIT(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 999;
	condition = dia_addon_lucia_exit_condition;
	information = dia_addon_lucia_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_lucia_exit_condition()
{
	return TRUE;
};

func void dia_addon_lucia_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_LUCIA_PICKPOCKET(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 900;
	condition = dia_addon_lucia_pickpocket_condition;
	information = dia_addon_lucia_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80_FEMALE;
};


func int dia_addon_lucia_pickpocket_condition()
{
	return c_beklauen(80,100);
};

func void dia_addon_lucia_pickpocket_info()
{
	Info_ClearChoices(dia_addon_lucia_pickpocket);
	Info_AddChoice(dia_addon_lucia_pickpocket,DIALOG_BACK,dia_addon_lucia_pickpocket_back);
	Info_AddChoice(dia_addon_lucia_pickpocket,DIALOG_PICKPOCKET,dia_addon_lucia_pickpocket_doit);
};

func void dia_addon_lucia_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_lucia_pickpocket);
};

func void dia_addon_lucia_pickpocket_back()
{
	Info_ClearChoices(dia_addon_lucia_pickpocket);
};


instance DIA_ADDON_LUCIA_HI(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 2;
	condition = dia_addon_lucia_hi_condition;
	information = dia_addon_lucia_hi_info;
	permanent = FALSE;
	description = "A? Jak to jde?";
};


func int dia_addon_lucia_hi_condition()
{
	return TRUE;
};

func void dia_addon_lucia_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Hi_15_00");	//A? Jak to jde?
	AI_Output(self,other,"DIA_Addon_Lucia_Hi_16_01");	//Poslouchej, jestli bys r·d nÏco k jÌdlu, obraù se tam na Snafa. Jestli chceö nÏco k pitÌ, pak mluvÌö se spr·vnou osobou.
};


instance DIA_ADDON_LUCIA_WAS(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 2;
	condition = dia_addon_lucia_was_condition;
	information = dia_addon_lucia_was_info;
	permanent = FALSE;
	description = "Tak co mi m˘ûeö nabÌdnout?";
};


func int dia_addon_lucia_was_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lucia_hi))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_was_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_was_15_00");	//Tak co mi m˘ûeö nabÌdnout?
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_01");	//Bohuûel nem·me dost piva. DostupnÈ je jenom na ostrovech, kam ho p¯ivezli paladinovÈ.
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_02");	//Tak dobr·, alespoÚ na nÏco byli dob¯Ì ...
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_03");	//A mimo to my obvykle pijeme ko¯alku. M·m ko¯alku vlastnÌ v˝roby, grog a bÌl˝ rum.
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_04");	//(chutnÏ) hmmm ... Opravdu bys mÏl zkusit TOTO. M·m recept od Samuela. Ten star˝ chl·pek fakt vÌ, jak mÌchat pitÌ.
	Log_CreateTopic(TOPIC_ADDON_BDT_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TRADER,"Lucia obchoduje s tvrd˝m chlastem - ko¯alkou.");
};


instance DIA_ADDON_LUCIA_KHORINIS(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 2;
	condition = dia_addon_lucia_khorinis_condition;
	information = dia_addon_lucia_khorinis_info;
	permanent = FALSE;
	description = "Hej, nejsi z Khorinisu?";
};


func int dia_addon_lucia_khorinis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bromor_lucia) || (NADJA_GAVELUCIAINFO == TRUE) || Npc_KnowsInfo(other,dia_addon_elvrich_whatexactly))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_khorinis_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Khorinis_15_00");	//Hej, nejsi z Khorinisu?
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_01");	//Nep¯ipomÌnej mi to mÌsto! M˘j ûivot tam byl straön˝.
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_02");	//PodÌvej, byla to velk· akce, kdyû dorazila loÔ s nov˝mi odsouzenci.
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_03");	//Ale tito ostatnÌ chlapi ... (smÏje se) Ne, dÌky. Moûn· proto, ûe jsme na ostrovÏ. No dobr·, ty Ëasy jsou pryË.
	if((MIS_LUCIASLETTER != 0) || (SC_KNOWSLUCIACAUGHTBYBANDITS != 0) || (NADJA_GAVELUCIAINFO != 0))
	{
		AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_06");	//Mluvila jsem s Elvrichem!
		AI_Output(other,self,"DIA_Addon_Lucia_Khorinis_15_04");	//ProË?
		AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_05");	//Jak· zbabÏlost. NeudÏlal nic, kdyû banditi p¯iöli a zajali mÏ.
		TOPIC_END_LUCIA = TRUE;
		b_giveplayerxp(XP_AMBIENT);
	};
	TOPIC_END_LUCIA = TRUE;
};


instance DIA_ADDON_LUCIA_JETZT(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 2;
	condition = dia_addon_lucia_jetzt_condition;
	information = dia_addon_lucia_jetzt_info;
	permanent = FALSE;
	description = "A co pl·nujeö udÏlat nynÌ?";
};


func int dia_addon_lucia_jetzt_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lucia_khorinis))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_jetzt_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Jetzt_15_00");	//A co pl·nujeö udÏlat nynÌ?
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_01");	//UvidÌme. Pr·vÏ nynÌ mi vyhovuje b˝t zde se Snafem, Fiskem a ostatnÌmi.
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_02");	//Jiû jsi hovo¯il s Thorusem? (omdlÌ) ” boûe, to je fakt chlap!
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_03");	//(se smÌchem) Sorry ... zpÏt k tvojÌ ot·zce ... Nem·m û·dn˝ cÌl, nech·v·m vöe n·hodÏ.
};


instance DIA_ADDON_LUCIA_PALADINE(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 2;
	condition = dia_addon_lucia_paladine_condition;
	information = dia_addon_lucia_paladine_info;
	permanent = FALSE;
	description = "Nem·ö moc v l·sce paladiny, ûe?";
};


func int dia_addon_lucia_paladine_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lucia_was))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_paladine_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_15_00");	//Nem·ö moc v l·sce paladiny, ûe?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_01");	//FanatickÈ vrahy ovl·danÈ M·gy ohnÏ? Ne.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_02");	//Tento Lord Hagen a jeho nohsledi majÌ kontrolu nad mÏstem a kaûd˝m obËanem.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_03");	//A to je to, co mÏ v˘bec nezajÌm·. Nechci Ëekat U ËervenÈ lucerny aû mÏ zav¯ou.
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_DJG))
	{
		Info_ClearChoices(dia_addon_lucia_paladine);
		Info_AddChoice(dia_addon_lucia_paladine,"KONEC",dia_addon_lucia_paladine_back);
		Info_AddChoice(dia_addon_lucia_paladine,"PaladinovÈ nebojujÌ ve jmÈnu Innose. On si vybÌr· svÈ bojovnÌky s·m.",dia_addon_lucia_paladine_wahl);
		Info_AddChoice(dia_addon_lucia_paladine,"PaladinovÈ jsou bojovnÌci Innose, ne vrazi.",dia_addon_lucia_paladine_murder);
	};
};

func void dia_addon_lucia_paladine_back()
{
	Info_ClearChoices(dia_addon_lucia_paladine);
};

func void dia_addon_lucia_paladine_wahl()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_WAHL_15_00");	//PaladinovÈ nebojujÌ ve jmÈnu Innose. On si vybÌr· svÈ bojovnÌky s·m.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WAHL_16_01");	//Opravdu? MyslÌm, ûe lidÈ si vybÌrajÌ sv˘j osud.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WAHL_16_02");	//NicmÈnÏ, tv· slova mÏ p¯ekvapujÌ. MluvÌö, jako bys byl jednÌm z nich.
	Info_AddChoice(dia_addon_lucia_paladine,"Uû jsi nÏkdy nÏkoho zabila?",dia_addon_lucia_paladine_kill);
};

func void dia_addon_lucia_paladine_kill()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_KILL_15_00");	//Uû jsi nÏkdy nÏkoho zabila?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_01");	//Ne, a jsem docela r·da, ûe je to tak.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_02");	//ProsÌm, nemluvme uû o takov˝ch vÏcech.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_03");	//Vychutnejme si pitÌ a uûime kaûdou chvilku, kterou n·m bohovÈ dali.
	Info_ClearChoices(dia_addon_lucia_paladine);
};

func void dia_addon_lucia_paladine_weib()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_WEIB_15_00");	//Ty chceö poöpinit jmÈno Innosovo, ûeno?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WEIB_16_01");	//Jak to m˘ûu udÏlat? To jsou muûi, kte¯Ì dÏlajÌ zlo v jeho jmÈnÏ.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WEIB_16_02");	//J· nicmÈnÏ nepochybuji o InnosovÏ boûstvÌ.
};

func void dia_addon_lucia_paladine_murder()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_MURDER_15_00");	//PaladinovÈ jsou Innosovi v·leËnÌci. Nejsou vrazi.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_MURDER_16_01");	//Opravdu? Jejich zbranÏ jsou poskvrnÏny krvÌ stejnÏ jako zbranÏ bandit˘ a pir·t˘.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_MURDER_16_02");	//Jedin˝m rozdÌlem je to, ûe oni to dÏlajÌ ve jmÈnu Innose. Ne proto, aby p¯eûili.
	Info_AddChoice(dia_addon_lucia_paladine,"Ty chceö poöpinit jmÈno Innosovo, ûeno?",dia_addon_lucia_paladine_weib);
};


instance DIA_ADDON_LUCIA_ATTENTAT(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 9;
	condition = dia_addon_lucia_attentat_condition;
	information = dia_addon_lucia_attentat_info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int dia_addon_lucia_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_lucia_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Lucia_Attentat_16_00");	//Nic.
};


instance DIA_ADDON_LUCIA_TRADE(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 99;
	condition = dia_addon_lucia_trade_condition;
	information = dia_addon_lucia_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Chci nÏco k pitÌ.";
};


func int dia_addon_lucia_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lucia_was))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_trade_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Trade_15_00");	//Chci nÏco k pitÌ.
	b_givetradeinv(self);
};


instance DIA_ADDON_LUCIA_LERNEN(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 19;
	condition = dia_addon_lucia_lernen_condition;
	information = dia_addon_lucia_lernen_info;
	permanent = FALSE;
	description = "Je jeötÏ nÏco, co mÏ m˘ûeö nauËit?";
};


func int dia_addon_lucia_lernen_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lucia_hi))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_lernen_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_lernen_15_00");	//Je jeötÏ nÏco, co mÏ m˘ûeö nauËit?
	AI_Output(self,other,"DIA_Addon_Lucia_lernen_16_01");	//(smÏje se) UrËitÏ. M˘ûu ti pomoct zv˝öit OBRATNOST.
	Log_CreateTopic(TOPIC_ADDON_BDT_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TEACHER,"Lucia mi m˘ûe zv˝öit obratnost.");
};


instance DIA_ADDON_LUCIA_TEACH(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 101;
	condition = dia_addon_lucia_teach_condition;
	information = dia_addon_lucia_teach_info;
	permanent = TRUE;
	description = "Chci b˝t obratnÏjöÌ.";
};


func int dia_addon_lucia_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lucia_lernen))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_TEACH_15_00");	//Chci b˝t obratnÏjöÌ.
	Info_ClearChoices(dia_addon_lucia_teach);
	Info_AddChoice(dia_addon_lucia_teach,DIALOG_BACK,dia_addon_lucia_teach_back);
	Info_AddChoice(dia_addon_lucia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_addon_lucia_teach_1);
	Info_AddChoice(dia_addon_lucia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_addon_lucia_teach_5);
};

func void dia_addon_lucia_teach_back()
{
	Info_ClearChoices(dia_addon_lucia_teach);
};

func void dia_addon_lucia_teach_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(dia_addon_lucia_teach);
	Info_AddChoice(dia_addon_lucia_teach,DIALOG_BACK,dia_addon_lucia_teach_back);
	Info_AddChoice(dia_addon_lucia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_addon_lucia_teach_1);
	Info_AddChoice(dia_addon_lucia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_addon_lucia_teach_5);
};

func void dia_addon_lucia_teach_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(dia_addon_lucia_teach);
	Info_AddChoice(dia_addon_lucia_teach,DIALOG_BACK,dia_addon_lucia_teach_back);
	Info_AddChoice(dia_addon_lucia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_addon_lucia_teach_1);
	Info_AddChoice(dia_addon_lucia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_addon_lucia_teach_5);
};

