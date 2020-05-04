
instance DIA_ADDON_SAMUEL_EXIT(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 999;
	condition = dia_addon_samuel_exit_condition;
	information = dia_addon_samuel_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_samuel_exit_condition()
{
	return TRUE;
};

func void dia_addon_samuel_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SAMUEL_HELLO(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 1;
	condition = dia_addon_samuel_hello_condition;
	information = dia_addon_samuel_hello_info;
	important = TRUE;
};


func int dia_addon_samuel_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_samuel_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Samuel_Hello_14_00");	//Ah, nov· tv·¯!
	AI_Output(self,other,"DIA_Addon_Samuel_Hello_14_01");	//Chceö rum - anebo nÏco silnÏjöÌho?
	Log_CreateTopic(TOPIC_ADDON_PIR_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_PIR_TRADER,LOG_TEXT_ADDON_SAMUELTRADE);
};


instance DIA_ADDON_SAMUEL_FRANCIS(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 2;
	condition = dia_addon_samuel_francis_condition;
	information = dia_addon_samuel_francis_info;
	description = "Chci si s tebou promluvit o Francisovi.";
};


func int dia_addon_samuel_francis_condition()
{
	if(FRANCIS_AUSGESCHISSEN == FALSE)
	{
		if(Npc_KnowsInfo(other,dia_addon_skip_gregshut) || (francis.aivar[AIV_TALKEDTOPLAYER] == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_addon_samuel_francis_info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_00");	//Chci si s tebou promluvit o Francisovi.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_01");	//NezaËÌnej o tom r·doby-kapit·novi!
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_02");	//Cel˝ den vysed·v· na laviËce a cÌtÌ se d˘leûitÏ!
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_03");	//Vöechny zajÌma, kterÈmu Ëertu jsem dluûni, ûe kapit·n vybral zrovna jeho!
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_04");	//Co chceö od toho malÈho nafoukance?
};


instance DIA_ADDON_SAMUEL_VERSTECK(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 3;
	condition = dia_addon_samuel_versteck_condition;
	information = dia_addon_samuel_versteck_info;
	description = "Pot¯ebuji se dostat do Gregovy chatrËe.";
};


func int dia_addon_samuel_versteck_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_samuel_francis) && (FRANCIS_AUSGESCHISSEN == FALSE) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_samuel_versteck_info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_02");	//Pot¯ebuji se dostat do Gregovy chatrËe.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_05");	//(öibalsky) Jo? ProË?
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_01");	//Pot¯ebuji zbroj bandit˘.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_06");	//(smÌch) Francis tÏ nikdy dobrovolnÏ do chatrËe nepustÌ, aby sis mohl ölohnout Gregovy vÏci.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_07");	//JedinÏ, ûe by ...
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_03");	//Ano?
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_08");	//... jsi mÏl nÏco, co skuteËnÏ shanÌ.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_09");	//VÌm, ûe Francis nÏco ukr˝v· v opuötÏnÈm dole v kaÚonu.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_10");	//MÏli jsme jednou spolu str·û. Usnul a mluvil o tom ze spanÌ.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_11");	//Nem·m ponÏtÌ, co tam zahrabal, ale pokud je to dostateËnÏ d˘leûitÈ, pak tÏ dovnit¯ pustÌ ...
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_12");	//Aû se kapit·n vr·tÌ a zjistÌ, ûe jeho vÏci chybÌ, d· Francisovi vÌc neû po¯·dnej v˝prask.
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Samuel mi ¯ekl o tajnÈ FrancisovÏ skr˝öi v jednom dolu v kaÚonu. Moûn· najdu nÏco, co mi pom˘ûe dostat se do chatrËe.");
};


var int samuel_knows_loushammer;
var int samuel_knows_schlafhammer;

instance DIA_ADDON_SAMUEL_RECIPE(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 4;
	condition = dia_addon_samuel_recipe_condition;
	information = dia_addon_samuel_recipe_info;
	permanent = TRUE;
	description = "M·m pro tebe recept!";
};


func int dia_addon_samuel_recipe_condition()
{
	if(((SAMUEL_KNOWS_LOUSHAMMER == FALSE) && (Npc_HasItems(other,itwr_addon_lou_rezept) > 0)) || ((SAMUEL_KNOWS_SCHLAFHAMMER == FALSE) && (Npc_HasItems(other,itwr_addon_lou_rezept2) > 0)))
	{
		return TRUE;
	};
};

func void dia_addon_samuel_recipe_info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_15_00");	//M·m pro tebe recept!
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_14_01");	//Oh, nech mÏ podÌvat, co za recept to je?
	Info_ClearChoices(dia_addon_samuel_recipe);
	if((SAMUEL_KNOWS_LOUSHAMMER == FALSE) && (Npc_HasItems(other,itwr_addon_lou_rezept) > 0))
	{
		Info_AddChoice(dia_addon_samuel_recipe,"Louovo Kladivo",dia_addon_samuel_recipe_loushammer);
	};
	if((SAMUEL_KNOWS_SCHLAFHAMMER == FALSE) && (Npc_HasItems(other,itwr_addon_lou_rezept2) > 0))
	{
		Info_AddChoice(dia_addon_samuel_recipe,"Louovo dvojitÈ kladivo",dia_addon_samuel_recipe_lousdoublehammer);
	};
};

func void dia_addon_samuel_recipe_back()
{
	Info_ClearChoices(dia_addon_samuel_recipe);
};

func void dia_addon_samuel_recipe_loushammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_LousHammer_15_00");	//Je to od Snafa.
	b_giveinvitems(other,self,itwr_addon_lou_rezept,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_LousHammer_14_04");	//ZnÌ to ˙plnÏ hroznÏ. Hned to jdu zkusit.
	b_giveplayerxp(XP_AMBIENT);
	SAMUEL_KNOWS_LOUSHAMMER = TRUE;
};

func void dia_addon_samuel_recipe_lousdoublehammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_15_00");	//Je to skuteËnej zabij·k, dej si pozor!
	b_giveinvitems(other,self,itwr_addon_lou_rezept2,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_14_04");	//ZaËÌn·m se b·t. MyslÌm, ûe to i tak vyzkouöÌm.
	b_giveplayerxp(XP_AMBIENT);
	SAMUEL_KNOWS_SCHLAFHAMMER = TRUE;
};


var int samuel_grog_varianz;

instance DIA_ADDON_SAMUEL_GROG(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 5;
	condition = dia_addon_samuel_grog_condition;
	information = dia_addon_samuel_grog_info;
	permanent = TRUE;
	description = "Chci si vzÌt sv˘j podÌl grogu. (10 zlata)";
};


func int dia_addon_samuel_grog_condition()
{
	return TRUE;
};

func void dia_addon_samuel_grog_info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Grog_15_00");	//Chci si vzÌt sv˘j podÌl grogu.
	if(b_giveinvitems(other,self,itmi_gold,10))
	{
		if(SAMUEL_GROG_VARIANZ == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_01");	//Vy mladÌci nepohnete ani prstem bez grogu co? A to je spr·vnÏ.
			SAMUEL_GROG_VARIANZ = 1;
		}
		else if(SAMUEL_GROG_VARIANZ == 1)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_02");	//Douf·m, ûe to je p¯ijatelnÈ. Nem·m dostatek ËistÈ vody. Ale trochu slanÈ tomu neublÌûÌ, ne?
			SAMUEL_GROG_VARIANZ = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_03");	//M˘ûeö mÌt tolik grogu, kolik chceö.
		};
		b_giveinvitems(self,other,itfo_addon_grog,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_04");	//Prod·v·m to levnÏ, ale ne zadarmo! SeûeÚ si nejd¯Ìv zlato, mladÌku!
	};
};


var int samuel_rum_varianz;

instance DIA_ADDON_SAMUEL_RUM(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 6;
	condition = dia_addon_samuel_rum_condition;
	information = dia_addon_samuel_rum_info;
	permanent = TRUE;
	description = "Dej mi rum (30 zlata)";
};


func int dia_addon_samuel_rum_condition()
{
	return TRUE;
};

func void dia_addon_samuel_rum_info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Rum_15_00");	//Dej mi rum!
	if(b_giveinvitems(other,self,itmi_gold,30))
	{
		if(SAMUEL_RUM_VARIANZ == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_01");	//Ah! Mate¯skÈ mlÈko n·mo¯nÌka. Tady m·ö!
			SAMUEL_RUM_VARIANZ = 1;
		}
		else if(SAMUEL_RUM_VARIANZ == 1)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_02");	//Rum m˘ûe troöku smrdÏt rybinou. M·me jen starÈ sudy od sleÔ˘. Ale rum z˘stane rumem. Nechù ti chutn·.
			SAMUEL_RUM_VARIANZ = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_03");	//Tady m·ö!
		};
		b_giveinvitems(self,other,itfo_addon_rum,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_04");	//Nem·ö dost zlata, mladÌku! Coû takhle d·t si grog?
	};
};


var int samuel_stronger_varianz;
var int samuel_doppelhammer_varianz;

instance DIA_ADDON_SAMUEL_STRONGER(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 7;
	condition = dia_addon_samuel_stronger_condition;
	information = dia_addon_samuel_stronger_info;
	permanent = TRUE;
	description = "Pot¯ebuji nÏco silnÏjöÌho!";
};


func int dia_addon_samuel_stronger_condition()
{
	return TRUE;
};

func void dia_addon_samuel_stronger_info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_15_00");	//Pot¯ebuji nÏco silnÏjöÌho!
	if(SAMUEL_STRONGER_VARIANZ == 0)
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_01");	//¡·, dobrodruûn· duöe! Ja vûdy hled·m novÈ recepty!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_02");	//Po¯·dn· ko¯alka m· b˝t Ëist· a siln·. MusÌ projÌt hrdlem jako tekut˝ oheÚ.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_03");	//Je to dost tÏûkÈ. Ale uû moc ¯eËnÌm. Ty chceö pÌt!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_04");	//Tady! M˘j vlastnÌ recept! Chutn· ti to? Jmenuje se to 'Rychl˝ sleÔ'
		b_giveinvitems(self,other,itfo_addon_schnellerhering,1);
		b_useitem(other,itfo_addon_schnellerhering);
		AI_Output(other,self,"DIA_Addon_Samuel_Stronger_15_05");	//P˘sobivÈ!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_06");	//(smÌch) ÿekl bych, ûe jo.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_07");	//Nezn·ö n·hodou nÏjakej dobrej recept na ko¯alku? Pokud jo, tak mi ¯ekni.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_08");	//Chceö dalöÌ?
		SAMUEL_STRONGER_VARIANZ = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_09");	//Co m˘ûu dostat?
	};
	Info_ClearChoices(dia_addon_samuel_stronger);
	Info_AddChoice(dia_addon_samuel_stronger,DIALOG_BACK,dia_addon_samuel_stronger_back);
	if(SAMUEL_KNOWS_SCHLAFHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Louovo dvojitÈ kladivo (60 zlata)",dia_addon_samuel_stronger_lousdoublehammer);
	};
	if(SAMUEL_KNOWS_LOUSHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Louovo kladivo (30 zlata)",dia_addon_samuel_stronger_loushammer);
	};
	Info_AddChoice(dia_addon_samuel_stronger,"Rychl˝ sleÔ (30 zlata)",dia_addon_samuel_stronger_schnellerhering);
};

func void b_addon_samuel_nogold()
{
	AI_Output(self,other,"DIA_Addon_Samuel_NoGold_14_00");	//NenÌ zlato, nenÌ pitÌ!
};

func void dia_addon_samuel_stronger_back()
{
	Info_ClearChoices(dia_addon_samuel_stronger);
};

func void dia_addon_samuel_stronger_schnellerhering()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_SchnellerHering_15_00");	//Dej mi troöku z toho rychlÈho sledÏ.
	if(b_giveinvitems(other,self,itmi_gold,30))
	{
		AI_Output(self,other,"DIa_Addon_Samuel_Stronger_SchnellerHering_14_01");	//Siln· vÏciËka, ale udÏl· svoje!
		b_giveinvitems(self,other,itfo_addon_schnellerhering,1);
	}
	else
	{
		b_addon_samuel_nogold();
	};
	Info_ClearChoices(dia_addon_samuel_stronger);
	Info_AddChoice(dia_addon_samuel_stronger,DIALOG_BACK,dia_addon_samuel_stronger_back);
	if(SAMUEL_KNOWS_SCHLAFHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Louovo DvojitÈ kladivo (60 zlata)",dia_addon_samuel_stronger_lousdoublehammer);
	};
	if(SAMUEL_KNOWS_LOUSHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Louovo Kladivo (30 zlata)",dia_addon_samuel_stronger_loushammer);
	};
	Info_AddChoice(dia_addon_samuel_stronger,"Rychl˝ sleÔ (30 zlata)",dia_addon_samuel_stronger_schnellerhering);
};

func void dia_addon_samuel_stronger_loushammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_LousHammer_15_00");	//Chci Louovo kladivo!
	if(b_giveinvitems(other,self,itmi_gold,30))
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_LousHammer_14_01");	//Dobr· vÏc! Na ochranu!
		b_giveinvitems(self,other,itfo_addon_loushammer,1);
	}
	else
	{
		b_addon_samuel_nogold();
	};
	Info_ClearChoices(dia_addon_samuel_stronger);
	Info_AddChoice(dia_addon_samuel_stronger,DIALOG_BACK,dia_addon_samuel_stronger_back);
	if(SAMUEL_KNOWS_SCHLAFHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Louovo DvojitÈ kladivo (60 zlata)",dia_addon_samuel_stronger_lousdoublehammer);
	};
	if(SAMUEL_KNOWS_LOUSHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Louovo Kladivo (30 zlata)",dia_addon_samuel_stronger_loushammer);
	};
	Info_AddChoice(dia_addon_samuel_stronger,"Rychl˝ sleÔ (30 zlata)",dia_addon_samuel_stronger_schnellerhering);
};

func void dia_addon_samuel_stronger_lousdoublehammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_15_00");	//(nenucenÏ) Dej mi dvojitÈ. DvojitÈ kladivo.
	if(b_giveinvitems(other,self,itmi_gold,VALUE_SCHLAFHAMMER))
	{
		if(SAMUEL_DOPPELHAMMER_VARIANZ == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_14_01");	//NeudÏlej ze sebe uboû·ka. Douf·m, ûe to nenÌ pro tebe.
		}
		else
		{
			AI_Output(self,other,"DIa_Addon_Samuel_Stronger_LousDoubleHammer_14_02");	//Ano! To bude duöevnÌ tanec!
		};
		b_giveinvitems(self,other,itfo_addon_schlafhammer,1);
	}
	else
	{
		b_addon_samuel_nogold();
	};
	Info_ClearChoices(dia_addon_samuel_stronger);
	Info_AddChoice(dia_addon_samuel_stronger,DIALOG_BACK,dia_addon_samuel_stronger_back);
	if(SAMUEL_KNOWS_SCHLAFHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Louovo DvojitÈ kladivo (60 zlata)",dia_addon_samuel_stronger_lousdoublehammer);
	};
	if(SAMUEL_KNOWS_LOUSHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Louovo Kladivo (30 zlata)",dia_addon_samuel_stronger_loushammer);
	};
	Info_AddChoice(dia_addon_samuel_stronger,"Rychl˝ sleÔ (30 zlata)",dia_addon_samuel_stronger_schnellerhering);
};


instance DIA_ADDON_SAMUEL_TRADE(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 8;
	condition = dia_addon_samuel_trade_condition;
	information = dia_addon_samuel_trade_info;
	permanent = TRUE;
	description = "Co jeötÏ m·ö?";
	trade = TRUE;
};


func int dia_addon_samuel_trade_condition()
{
	return TRUE;
};

func void dia_addon_samuel_trade_info()
{
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itfo_addon_grog,Npc_HasItems(self,itfo_addon_grog));
	CreateInvItems(self,itfo_addon_grog,15);
	AI_Output(other,self,"DIA_Addon_Samuel_Trade_15_00");	//Co jeötÏ m·ö?
	AI_Output(self,other,"DIA_Addon_Samuel_Trade_14_01");	//Dod·v·m vöechno, co pir·t pot¯ebuje pro p¯eûitÌ.
};


instance DIA_ADDON_SAMUEL_NEWS(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 99;
	condition = dia_addon_samuel_news_condition;
	information = dia_addon_samuel_news_info;
	permanent = TRUE;
	description = "NÏco novÈho v t·bo¯e?";
};


func int dia_addon_samuel_news_condition()
{
	return TRUE;
};

func void dia_addon_samuel_news_info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_News_15_00");	//NÏco novÈho v t·bo¯e?
	if(Npc_IsDead(francis) || (FRANCIS_AUSGESCHISSEN == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_01");	//Francis dostal ¯·dnej trest! Ani nevÌö, jak jsem r·d!
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_02");	//Ty jsi v pohodÏ. PojÔ, vypijeme nÏco!
		if(GREGISBACK == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_03");	//A Greg je koneËnÏ zp·tky. Sice ztratil loÔ, ale aspoÚ udÏlal po¯·dek v t·bo¯e.
		};
	}
	else
	{
		if(!Npc_IsDead(morgan))
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_04");	//Od Gregova odjezdu se nic moc nedÏje. Morgan a vÏtöina jeho chlapu jenom chlastajÌ.
		};
		if(!Npc_IsDead(henry))
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_05");	//Jedin˝, kdo nÏco dÏl· je Henry. On a jeho chlapci stavÏjÌ palis·du.
		};
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_06");	//Uû je naËase, aby se kapit·n Greg vr·til a nakopal Francisovi ¯iù.
	};
};

