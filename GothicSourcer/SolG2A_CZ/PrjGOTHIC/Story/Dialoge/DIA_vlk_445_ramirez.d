
instance DIA_RAMIREZ_EXIT(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 999;
	condition = dia_ramirez_exit_condition;
	information = dia_ramirez_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ramirez_exit_condition()
{
	return TRUE;
};

func void dia_ramirez_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAMIREZ_PICKPOCKET(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 900;
	condition = dia_ramirez_pickpocket_condition;
	information = dia_ramirez_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_ramirez_pickpocket_condition()
{
	return c_beklauen(90,300);
};

func void dia_ramirez_pickpocket_info()
{
	Info_ClearChoices(dia_ramirez_pickpocket);
	Info_AddChoice(dia_ramirez_pickpocket,DIALOG_BACK,dia_ramirez_pickpocket_back);
	Info_AddChoice(dia_ramirez_pickpocket,DIALOG_PICKPOCKET,dia_ramirez_pickpocket_doit);
};

func void dia_ramirez_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ramirez_pickpocket);
};

func void dia_ramirez_pickpocket_back()
{
	Info_ClearChoices(dia_ramirez_pickpocket);
};


instance DIA_RAMIREZ_ZEICHEN(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 2;
	condition = dia_ramirez_zeichen_condition;
	information = dia_ramirez_zeichen_info;
	permanent = FALSE;
	description = "(P¯edvÈst zlodÏjsk˝ sign·l.)";
};


func int dia_ramirez_zeichen_condition()
{
	if(KNOWS_SECRETSIGN == TRUE)
	{
		return TRUE;
	};
};

func void dia_ramirez_zeichen_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ramirez_Zeichen_14_00");	//Fajn, fajn, zn·ö sign·l. (zÌv·) Docela mÏ to p¯ekvapuje.
};


instance DIA_RAMIREZ_HALLO(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 2;
	condition = dia_ramirez_hallo_condition;
	information = dia_ramirez_hallo_info;
	permanent = TRUE;
	important = TRUE;
};


var int dia_ramirez_hallo_permanent;

func int dia_ramirez_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_RAMIREZ_HALLO_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_ramirez_hallo_info()
{
	if((self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (JOIN_THIEFS == FALSE))
	{
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_00");	//Ztratil ses? Nemyslim si, ûe tohle je to pravÈ mÌsto pro tebe.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_01");	//Jestli se ti tady nÏco stane, nikdo z n·s ti pomoct nep˘jde. Takûe si d·vej bacha. (öirok˝ ˙smÏv)
	};
	if(JOIN_THIEFS == TRUE)
	{
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_02");	//Tak jsi tady. Dobr·, tak ti p¯eju hodnÏ ötÏstÌ - ale buÔ opatrn˝, aù uû dÏl·ö cokoli.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_03");	//A jeötÏ jedna vÏc - je mi jedno, kdo jsi tam naho¯e a s k˝m pracujeö.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_04");	//Tady dole jsi jen jednÌm z n·s. ZlodÏj. Nic vÌc, nic mÌÚ.
		DIA_RAMIREZ_HALLO_PERMANENT = TRUE;
	};
	DG_GEFUNDEN = TRUE;
};


instance DIA_RAMIREZ_BEUTE(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 3;
	condition = dia_ramirez_beute_condition;
	information = dia_ramirez_beute_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ramirez_beute_condition()
{
	if((Mob_HasItems("THIEF_CHEST_01",itmi_gold) < 50) || (Mob_HasItems("THIEF_CHEST_02",itmi_gold) < 100) || (Mob_HasItems("THIEF_CHEST_02",itmi_silvercup) == FALSE) || (Mob_HasItems("THIEF_CHEST_03",itmi_gold) < 75))
	{
		return TRUE;
	};
};

func void dia_ramirez_beute_info()
{
	AI_Output(self,other,"DIA_Ramirez_Beute_14_00");	//Poslouchej, to nem˘ûeö myslet v·ûnÏ, ûe ne? Hrabeö se v naöem zlatu - to se n·s pokouöÌö okr·st?
	AI_Output(other,self,"DIA_Ramirez_Beute_15_01");	//Ne¯Ìkej, ûe za tu d¯inu je jen tÏchhle p·r mincÌ.
	AI_Output(other,self,"DIA_Ramirez_Beute_15_02");	//MyslÌm, tahle hrom·dka tady - to je CEL¡ ko¯ist? To je vöechno, co m· zlodÏjsk˝ cech Khorinisu k dispozici?
	AI_Output(self,other,"DIA_Ramirez_Beute_14_03");	//Kdo ¯Ìkal, ûe tady dole m·me naöi ko¯ist?
	AI_Output(other,self,"DIA_Ramirez_Beute_15_04");	//StejnÏ tomu nem˘ûu uvÏ¯it. Tak kde jste schovali ty poklady?
	AI_Output(self,other,"DIA_Ramirez_Beute_14_05");	//Na velmi bezpeËnÈ mÌsto.
	AI_Output(other,self,"DIA_Ramirez_Beute_15_06");	//Aha.
	AI_Output(self,other,"DIA_Ramirez_Beute_14_07");	//Dobr·, m˘ûeö si to zlato nechat. Ale budu na tebe d·vat pozor. Tak to nep¯epÌskni.
};


instance DIA_RAMIREZ_BEZAHLEN(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 9;
	condition = dia_ramirez_bezahlen_condition;
	information = dia_ramirez_bezahlen_info;
	permanent = TRUE;
	description = "M˘ûeö mÏ nÏËemu nauËit?";
};


var int dia_ramirez_bezahlen_permanent;

func int dia_ramirez_bezahlen_condition()
{
	if((JOIN_THIEFS == TRUE) && (DIA_RAMIREZ_BEZAHLEN_PERMANENT == FALSE) && Npc_KnowsInfo(other,dia_cassia_lernen))
	{
		return TRUE;
	};
};

func void dia_ramirez_bezahlen_info()
{
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		RAMIREZ_COST = 150;
	}
	else
	{
		RAMIREZ_COST = 300;
	};
	AI_Output(other,self,"DIA_Ramirez_Bezahlen_15_00");	//M˘ûeö mÏ nÏËemu nauËit?
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == TRUE)
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_14_01");	//Nem˘ûu tÏ nauËit nic. O p·ËenÌ z·mk˘ uû vÌö vöechno.
		if(other.attribute[ATR_DEXTERITY] < T_MAX)
		{
			AI_Output(self,other,"DIA_Ramirez_Add_14_00");	//TeÔ uû jen pot¯ebujeö zdokonalit svou obratnost.
		};
		DIA_RAMIREZ_BEZAHLEN_PERMANENT = TRUE;
		Info_ClearChoices(dia_ramirez_bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_14_02");	//M˘ûu ti uk·zat, jak p·Ëit z·mky. Bude tÏ to st·t jen...
		b_say_gold(self,other,RAMIREZ_COST);
		Info_ClearChoices(dia_ramirez_bezahlen);
		Info_AddChoice(dia_ramirez_bezahlen,"Moûn· pozdÏji ... (ZPÃT)",dia_ramirez_bezahlen_spaeter);
		Info_AddChoice(dia_ramirez_bezahlen,"OK, zaplatÌm ...",dia_ramirez_bezahlen_okay);
	};
};

func void dia_ramirez_bezahlen_spaeter()
{
	Info_ClearChoices(dia_ramirez_bezahlen);
};

func void dia_ramirez_bezahlen_okay()
{
	AI_Output(other,self,"DIA_Ramirez_Bezahlen_Okay_15_00");	//Dobr·, zaplatÌm.
	if(b_giveinvitems(other,self,itmi_gold,RAMIREZ_COST))
	{
		AI_Output(other,self,"DIA_Ramirez_Bezahlen_Okay_15_01");	//... Tady je zlato.
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_Okay_14_02");	//V˝bornÏ. Jsem ti k sluûb·m.
		RAMIREZ_TEACHPLAYER = TRUE;
		DIA_RAMIREZ_BEZAHLEN_PERMANENT = TRUE;
		Info_ClearChoices(dia_ramirez_bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_Okay_14_03");	//Nejd¯Ìv si seûeÚ zlato a pak se vraù.
		Info_ClearChoices(dia_ramirez_bezahlen);
	};
};


instance DIA_RAMIREZ_TEACH(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 99;
	condition = dia_ramirez_teach_condition;
	information = dia_ramirez_teach_info;
	permanent = TRUE;
	description = "Ukaû mi, jak se p·ËÌ z·mky!";
};


func int dia_ramirez_teach_condition()
{
	if((RAMIREZ_TEACHPLAYER == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == FALSE))
	{
		return TRUE;
	};
};

func void dia_ramirez_teach_info()
{
	AI_Output(other,self,"DIA_Ramirez_Teach_15_00");	//Ukaû mi, jak se p·ËÌ z·mky!
	if(RAMIREZ_ZWEIMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_14_06");	//P·ËenÌ z·mku je zlodÏjskÈ umÏnÌ.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_01");	//Pot¯ebujeö spoustu citu a intuice. A hromadu öperh·k˘.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_02");	//NicmÈnÏ, nÏkterÈ truhly majÌ speci·lnÌ z·mky, kterÈ lze odemknout jen za pomoci odpovÌdajÌcÌho klÌËe.
		RAMIREZ_ZWEIMAL = TRUE;
	};
	if(b_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_14_03");	//Takûe si klekneö p¯ed z·mek a öperh·kem ot·ËÌö napravo a nalevo.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_04");	//Kdyû jÌm otoËÌö moc rychle nebo moc silnÏ, zlomÌ se.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_05");	//Ale ËÌm zkuöenÏjöÌ budeö, tÌm pro tebe bude snazöÌ s nimi zach·zet.
	};
};


instance DIA_RAMIREZ_VIERTEL(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 8;
	condition = dia_ramirez_viertel_condition;
	information = dia_ramirez_viertel_info;
	permanent = FALSE;
	description = "Kde to p·ËenÌ z·mk˘ stojÌ za n·mahu?";
};


func int dia_ramirez_viertel_condition()
{
	if(KNOWS_SECRETSIGN == TRUE)
	{
		return TRUE;
	};
};

func void dia_ramirez_viertel_info()
{
	AI_Output(other,self,"DIA_Ramirez_Viertel_15_00");	//Kde to p·ËenÌ z·mk˘ stojÌ za n·mahu?
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_01");	//V hornÌ Ëtvrti, samoz¯ejmÏ.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_02");	//Ale jestli se tam budeö chtÌt k nÏkomu vloupat, poËkej si na noc, aû vöichni usnou - teda kromÏ str·ûÌ.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_03");	//HlÌdkujÌ tam celou noc. Jednoho z nich zn·m - jmenuje se Wambo. On je jedinej, koho zajÌm· zlato.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_04");	//Je drahej, ale kdyû mu jednou zaplatÌö, uû se o to nemusÌö d·l starat.
};


instance DIA_RAMIREZ_SEXTANT(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 2;
	condition = dia_ramirez_sextant_condition;
	information = dia_ramirez_sextant_info;
	permanent = FALSE;
	description = "M·ö pro mÏ pr·ci?";
};


func int dia_ramirez_sextant_condition()
{
	if((KNOWS_SECRETSIGN == TRUE) && (MIS_CASSIARING == LOG_SUCCESS) && (KAPITEL >= 2))
	{
		return TRUE;
	};
};

func void dia_ramirez_sextant_info()
{
	AI_Output(other,self,"DIA_Ramirez_Sextant_15_00");	//M·ö pro mÏ pr·ci?
	AI_Output(self,other,"DIA_Ramirez_Sextant_14_01");	//Hmm... je tu jedna vÏciËka, kterou bych r·d mÏl. Ale zatÌm jsem ji nenaöel.
	AI_Output(other,self,"DIA_Ramirez_Sextant_15_02");	//Co to je?
	AI_Output(self,other,"DIA_Ramirez_Sextant_14_03");	//⁄hlomÏr. P¯ines mi ˙hlomÏr - d·m ti za nÏj dobrou cenu.
	Log_CreateTopic(TOPIC_RAMIREZSEXTANT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RAMIREZSEXTANT,LOG_RUNNING);
	b_logentry(TOPIC_RAMIREZSEXTANT,"Ramirez mÏ poû·dal, abych mu p¯inesl ˙hlomÏr.");
	MIS_RAMIREZSEXTANT = LOG_RUNNING;
};


instance DIA_RAMIREZ_SUCCESS(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 2;
	condition = dia_ramirez_success_condition;
	information = dia_ramirez_success_info;
	permanent = FALSE;
	description = "M·m pro tebe ten ˙hlomÏr.";
};


func int dia_ramirez_success_condition()
{
	if(Npc_KnowsInfo(other,dia_ramirez_sextant) && (Npc_HasItems(other,itmi_sextant) > 0))
	{
		return TRUE;
	};
};

func void dia_ramirez_success_info()
{
	AI_Output(other,self,"DIA_Ramirez_Success_15_00");	//M·m pro tebe ten ˙hlomÏr.
	b_giveinvitems(other,self,itmi_sextant,1);
	AI_Output(self,other,"DIA_Ramirez_Success_14_01");	//To nenÌ moûn˝. V·ûnÏ se ti povedlo nÏjak˝ najÌt.
	AI_Output(self,other,"DIA_Ramirez_Success_14_02");	//Tady, ty penÌze si v·ûnÏ zaslouûÌö.
	b_giveinvitems(self,other,itmi_gold,VALUE_SEXTANT / 2);
	RAMIREZ_SEXTANT = TRUE;
	MIS_RAMIREZSEXTANT = LOG_SUCCESS;
	b_giveplayerxp(XP_RAMIREZSEXTANT);
};

