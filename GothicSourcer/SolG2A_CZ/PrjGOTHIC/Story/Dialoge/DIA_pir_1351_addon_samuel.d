
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
	AI_Output(self,other,"DIA_Addon_Samuel_Hello_14_00");	//Ah, nov� tv��!
	AI_Output(self,other,"DIA_Addon_Samuel_Hello_14_01");	//Chce� rum - anebo n�co siln�j��ho?
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
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_01");	//Neza��nej o tom r�doby-kapit�novi!
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_02");	//Cel� den vysed�v� na lavi�ce a c�t� se d�le�it�!
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_03");	//V�echny zaj�ma, kter�mu �ertu jsem dlu�ni, �e kapit�n vybral zrovna jeho!
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_04");	//Co chce� od toho mal�ho nafoukance?
};


instance DIA_ADDON_SAMUEL_VERSTECK(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 3;
	condition = dia_addon_samuel_versteck_condition;
	information = dia_addon_samuel_versteck_info;
	description = "Pot�ebuji se dostat do Gregovy chatr�e.";
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
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_02");	//Pot�ebuji se dostat do Gregovy chatr�e.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_05");	//(�ibalsky) Jo? Pro�?
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_01");	//Pot�ebuji zbroj bandit�.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_06");	//(sm�ch) Francis t� nikdy dobrovoln� do chatr�e nepust�, aby sis mohl �lohnout Gregovy v�ci.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_07");	//Jedin�, �e by ...
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_03");	//Ano?
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_08");	//... jsi m�l n�co, co skute�n� shan�.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_09");	//V�m, �e Francis n�co ukr�v� v opu�t�n�m dole v ka�onu.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_10");	//M�li jsme jednou spolu str�. Usnul a mluvil o tom ze span�.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_11");	//Nem�m pon�t�, co tam zahrabal, ale pokud je to dostate�n� d�le�it�, pak t� dovnit� pust� ...
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_12");	//A� se kapit�n vr�t� a zjist�, �e jeho v�ci chyb�, d� Francisovi v�c ne� po��dnej v�prask.
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Samuel mi �ekl o tajn� Francisov� skr��i v jednom dolu v ka�onu. Mo�n� najdu n�co, co mi pom��e dostat se do chatr�e.");
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
	description = "M�m pro tebe recept!";
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
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_15_00");	//M�m pro tebe recept!
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_14_01");	//Oh, nech m� pod�vat, co za recept to je?
	Info_ClearChoices(dia_addon_samuel_recipe);
	if((SAMUEL_KNOWS_LOUSHAMMER == FALSE) && (Npc_HasItems(other,itwr_addon_lou_rezept) > 0))
	{
		Info_AddChoice(dia_addon_samuel_recipe,"Louovo Kladivo",dia_addon_samuel_recipe_loushammer);
	};
	if((SAMUEL_KNOWS_SCHLAFHAMMER == FALSE) && (Npc_HasItems(other,itwr_addon_lou_rezept2) > 0))
	{
		Info_AddChoice(dia_addon_samuel_recipe,"Louovo dvojit� kladivo",dia_addon_samuel_recipe_lousdoublehammer);
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
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_LousHammer_14_04");	//Zn� to �pln� hrozn�. Hned to jdu zkusit.
	b_giveplayerxp(XP_AMBIENT);
	SAMUEL_KNOWS_LOUSHAMMER = TRUE;
};

func void dia_addon_samuel_recipe_lousdoublehammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_15_00");	//Je to skute�nej zabij�k, dej si pozor!
	b_giveinvitems(other,self,itwr_addon_lou_rezept2,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_14_04");	//Za��n�m se b�t. Mysl�m, �e to i tak vyzkou��m.
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
	description = "Chci si vz�t sv�j pod�l grogu. (10 zlata)";
};


func int dia_addon_samuel_grog_condition()
{
	return TRUE;
};

func void dia_addon_samuel_grog_info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Grog_15_00");	//Chci si vz�t sv�j pod�l grogu.
	if(b_giveinvitems(other,self,itmi_gold,10))
	{
		if(SAMUEL_GROG_VARIANZ == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_01");	//Vy mlad�ci nepohnete ani prstem bez grogu co? A to je spr�vn�.
			SAMUEL_GROG_VARIANZ = 1;
		}
		else if(SAMUEL_GROG_VARIANZ == 1)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_02");	//Douf�m, �e to je p�ijateln�. Nem�m dostatek �ist� vody. Ale trochu slan� tomu neubl��, ne?
			SAMUEL_GROG_VARIANZ = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_03");	//M��e� m�t tolik grogu, kolik chce�.
		};
		b_giveinvitems(self,other,itfo_addon_grog,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_04");	//Prod�v�m to levn�, ale ne zadarmo! Se�e� si nejd��v zlato, mlad�ku!
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
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_01");	//Ah! Mate�sk� ml�ko n�mo�n�ka. Tady m�!
			SAMUEL_RUM_VARIANZ = 1;
		}
		else if(SAMUEL_RUM_VARIANZ == 1)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_02");	//Rum m��e tro�ku smrd�t rybinou. M�me jen star� sudy od sle��. Ale rum z�stane rumem. Nech� ti chutn�.
			SAMUEL_RUM_VARIANZ = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_03");	//Tady m�!
		};
		b_giveinvitems(self,other,itfo_addon_rum,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_04");	//Nem� dost zlata, mlad�ku! Co� takhle d�t si grog?
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
	description = "Pot�ebuji n�co siln�j��ho!";
};


func int dia_addon_samuel_stronger_condition()
{
	return TRUE;
};

func void dia_addon_samuel_stronger_info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_15_00");	//Pot�ebuji n�co siln�j��ho!
	if(SAMUEL_STRONGER_VARIANZ == 0)
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_01");	//��, dobrodru�n� du�e! Ja v�dy hled�m nov� recepty!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_02");	//Po��dn� ko�alka m� b�t �ist� a siln�. Mus� proj�t hrdlem jako tekut� ohe�.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_03");	//Je to dost t�k�. Ale u� moc �e�n�m. Ty chce� p�t!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_04");	//Tady! M�j vlastn� recept! Chutn� ti to? Jmenuje se to 'Rychl� sle�'
		b_giveinvitems(self,other,itfo_addon_schnellerhering,1);
		b_useitem(other,itfo_addon_schnellerhering);
		AI_Output(other,self,"DIA_Addon_Samuel_Stronger_15_05");	//P�sobiv�!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_06");	//(sm�ch) �ekl bych, �e jo.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_07");	//Nezn� n�hodou n�jakej dobrej recept na ko�alku? Pokud jo, tak mi �ekni.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_08");	//Chce� dal��?
		SAMUEL_STRONGER_VARIANZ = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_09");	//Co m��u dostat?
	};
	Info_ClearChoices(dia_addon_samuel_stronger);
	Info_AddChoice(dia_addon_samuel_stronger,DIALOG_BACK,dia_addon_samuel_stronger_back);
	if(SAMUEL_KNOWS_SCHLAFHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Louovo dvojit� kladivo (60 zlata)",dia_addon_samuel_stronger_lousdoublehammer);
	};
	if(SAMUEL_KNOWS_LOUSHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Louovo kladivo (30 zlata)",dia_addon_samuel_stronger_loushammer);
	};
	Info_AddChoice(dia_addon_samuel_stronger,"Rychl� sle� (30 zlata)",dia_addon_samuel_stronger_schnellerhering);
};

func void b_addon_samuel_nogold()
{
	AI_Output(self,other,"DIA_Addon_Samuel_NoGold_14_00");	//Nen� zlato, nen� pit�!
};

func void dia_addon_samuel_stronger_back()
{
	Info_ClearChoices(dia_addon_samuel_stronger);
};

func void dia_addon_samuel_stronger_schnellerhering()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_SchnellerHering_15_00");	//Dej mi tro�ku z toho rychl�ho sled�.
	if(b_giveinvitems(other,self,itmi_gold,30))
	{
		AI_Output(self,other,"DIa_Addon_Samuel_Stronger_SchnellerHering_14_01");	//Siln� v�ci�ka, ale ud�l� svoje!
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
		Info_AddChoice(dia_addon_samuel_stronger,"Louovo Dvojit� kladivo (60 zlata)",dia_addon_samuel_stronger_lousdoublehammer);
	};
	if(SAMUEL_KNOWS_LOUSHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Louovo Kladivo (30 zlata)",dia_addon_samuel_stronger_loushammer);
	};
	Info_AddChoice(dia_addon_samuel_stronger,"Rychl� sle� (30 zlata)",dia_addon_samuel_stronger_schnellerhering);
};

func void dia_addon_samuel_stronger_loushammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_LousHammer_15_00");	//Chci Louovo kladivo!
	if(b_giveinvitems(other,self,itmi_gold,30))
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_LousHammer_14_01");	//Dobr� v�c! Na ochranu!
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
		Info_AddChoice(dia_addon_samuel_stronger,"Louovo Dvojit� kladivo (60 zlata)",dia_addon_samuel_stronger_lousdoublehammer);
	};
	if(SAMUEL_KNOWS_LOUSHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Louovo Kladivo (30 zlata)",dia_addon_samuel_stronger_loushammer);
	};
	Info_AddChoice(dia_addon_samuel_stronger,"Rychl� sle� (30 zlata)",dia_addon_samuel_stronger_schnellerhering);
};

func void dia_addon_samuel_stronger_lousdoublehammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_15_00");	//(nenucen�) Dej mi dvojit�. Dvojit� kladivo.
	if(b_giveinvitems(other,self,itmi_gold,VALUE_SCHLAFHAMMER))
	{
		if(SAMUEL_DOPPELHAMMER_VARIANZ == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_14_01");	//Neud�lej ze sebe ubo��ka. Douf�m, �e to nen� pro tebe.
		}
		else
		{
			AI_Output(self,other,"DIa_Addon_Samuel_Stronger_LousDoubleHammer_14_02");	//Ano! To bude du�evn� tanec!
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
		Info_AddChoice(dia_addon_samuel_stronger,"Louovo Dvojit� kladivo (60 zlata)",dia_addon_samuel_stronger_lousdoublehammer);
	};
	if(SAMUEL_KNOWS_LOUSHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Louovo Kladivo (30 zlata)",dia_addon_samuel_stronger_loushammer);
	};
	Info_AddChoice(dia_addon_samuel_stronger,"Rychl� sle� (30 zlata)",dia_addon_samuel_stronger_schnellerhering);
};


instance DIA_ADDON_SAMUEL_TRADE(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 8;
	condition = dia_addon_samuel_trade_condition;
	information = dia_addon_samuel_trade_info;
	permanent = TRUE;
	description = "Co je�t� m�?";
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
	AI_Output(other,self,"DIA_Addon_Samuel_Trade_15_00");	//Co je�t� m�?
	AI_Output(self,other,"DIA_Addon_Samuel_Trade_14_01");	//Dod�v�m v�echno, co pir�t pot�ebuje pro p�e�it�.
};


instance DIA_ADDON_SAMUEL_NEWS(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 99;
	condition = dia_addon_samuel_news_condition;
	information = dia_addon_samuel_news_info;
	permanent = TRUE;
	description = "N�co nov�ho v t�bo�e?";
};


func int dia_addon_samuel_news_condition()
{
	return TRUE;
};

func void dia_addon_samuel_news_info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_News_15_00");	//N�co nov�ho v t�bo�e?
	if(Npc_IsDead(francis) || (FRANCIS_AUSGESCHISSEN == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_01");	//Francis dostal ��dnej trest! Ani nev�, jak jsem r�d!
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_02");	//Ty jsi v pohod�. Poj�, vypijeme n�co!
		if(GREGISBACK == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_03");	//A Greg je kone�n� zp�tky. Sice ztratil lo�, ale aspo� ud�lal po��dek v t�bo�e.
		};
	}
	else
	{
		if(!Npc_IsDead(morgan))
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_04");	//Od Gregova odjezdu se nic moc ned�je. Morgan a v�t�ina jeho chlapu jenom chlastaj�.
		};
		if(!Npc_IsDead(henry))
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_05");	//Jedin�, kdo n�co d�l� je Henry. On a jeho chlapci stav�j� palis�du.
		};
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_06");	//U� je na�ase, aby se kapit�n Greg vr�til a nakopal Francisovi �i�.
	};
};

