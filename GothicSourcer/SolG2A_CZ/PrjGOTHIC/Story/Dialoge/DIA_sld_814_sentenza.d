
instance DIA_SENTENZA_EXIT(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 999;
	condition = dia_sentenza_exit_condition;
	information = dia_sentenza_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sentenza_exit_condition()
{
	return TRUE;
};

func void dia_sentenza_exit_info()
{
	AI_StopProcessInfos(self);
};


var int sentenza_wants50;
var int sentenza_searchday;

instance DIA_SENTENZA_HELLO(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 1;
	condition = dia_sentenza_hello_condition;
	information = dia_sentenza_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sentenza_hello_condition()
{
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_sentenza_hello_info()
{
	AI_Output(self,other,"DIA_Sentenza_Hello_09_00");	//Kam si myslíš, e jdeš?
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
	SENTENZA_SEARCHDAY = b_getdayplus();
	Info_ClearChoices(dia_sentenza_hello);
	Info_AddChoice(dia_sentenza_hello,"A co je ti vlastnì do toho?",dia_sentenza_hello_notyourbusiness);
	Info_AddChoice(dia_sentenza_hello,"Chtìl jsem se tu jen trochu porozhlédnout, nic víc.",dia_sentenza_hello_justlooking);
};

func void dia_sentenza_hello_justlooking()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_JustLooking_15_00");	//Chtìl jsem se tu jen trochu porozhlédnout, nic víc.
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_01");	//(smìje se) Na takové jako ty tu èíhá spousta nebezpeèí! A ty mi øíkáš, e se tu chceš jen tak porozhlédnout?
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_02");	//Ha! Ty chceš urèitì na statek! Proè by ses jinak plahoèil takovı lán cesty, co?
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_03");	//Tak pøestaò plácat kraviny a nech mì, a tì prohledám. Pak si mùeš jít zase po svém.
	Info_ClearChoices(dia_sentenza_hello);
	Info_AddChoice(dia_sentenza_hello,"Dej ty pracky pryè.",dia_sentenza_hello_handsoff);
	Info_AddChoice(dia_sentenza_hello,"Jen si poslu, klíïo píïo si mì prohledej!",dia_sentenza_hello_searchme);
};

func void dia_sentenza_hello_notyourbusiness()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_NotYourBusiness_15_00");	//A co je ti vlastnì do toho?
	AI_Output(self,other,"DIA_Sentenza_Hello_NotYourBusiness_09_01");	//(povzdech) Pak ti to dùkladnì vysvìtlím.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void b_sentenza_searchme()
{
	var int playergold;
	playergold = Npc_HasItems(other,itmi_gold);
	AI_Output(other,self,"DIA_Sentenza_Hello_SearchMe_15_00");	//Jen si poslu, klíïo píïo si mì prohledej!
	AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_01");	//Tak se podívejme, copak to tu máš.
	if(playergold >= 50)
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_02");	//Á, zlato! Vláèet s sebou tolik penìz, to mùe bıt poøádnì nebezpeèné.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_03");	//Spousta oldákù jsou prachsprostí hrdloøezové, ne tak poctiví jako já.
		b_giveinvitems(other,self,itmi_gold,50);
		SENTENZA_GOLDTAKEN = TRUE;
	}
	else if(playergold > 0)
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_04");	//No, to toho teda moc nemáš.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_05");	//Vrátím se k tobì pozdìji.
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_06");	//Tos ušel takovou štreku a nemáš ani mìïák?
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_07");	//Nezdá se mi ale, e bys nìjak trpìl hladem. Urèitì si nìkde òákou tu škváru schováváš, co?
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_08");	//Je vidìt, e nejsi úplnì blbı. Urèitì se ještì setkáme - tak na sebe zatím dávej pozor!
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_09");	//A nejspíš jenom ty sám víš, kde své zlato máš.
	};
	SENTENZA_WANTS50 = TRUE;
	AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_10");	//Já po tobì chci jenom 50 zlaákù jako mıtné. A staèí, kdy to zaplatíš jednou - to je pøece fér, ne?
};

func void dia_sentenza_hello_searchme()
{
	b_sentenza_searchme();
	AI_StopProcessInfos(self);
};

func void dia_sentenza_hello_handsoff()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_HandsOff_15_00");	//Dej ty pracky pryè.
	AI_Output(self,other,"DIA_Sentenza_Hello_HandsOff_09_01");	//(vıhrunì) Nebo co?
	Info_ClearChoices(dia_sentenza_hello);
	Info_AddChoice(dia_sentenza_hello,"Nebo nic. Tak mì teda prohledej!",dia_sentenza_hello_searchme);
	Info_AddChoice(dia_sentenza_hello,"Nebo si na nìjakı èas budeš muset nechat zajít chu na prohledávání.",dia_sentenza_hello_orelse);
};

func void dia_sentenza_hello_orelse()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_OrElse_15_00");	//Nebo si na nìjakı èas budeš muset nechat zajít chu na prohledávání.
	AI_Output(self,other,"DIA_Sentenza_Hello_OrElse_09_01");	//Tak to se uvidí.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SENTENZA_VZWEI(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 2;
	condition = dia_sentenza_vzwei_condition;
	information = dia_sentenza_vzwei_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sentenza_vzwei_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (SENTENZA_GOLDTAKEN == FALSE) && (SENTENZA_SEARCHDAY < Wld_GetDay()))
	{
		return TRUE;
	};
};

func void dia_sentenza_vzwei_info()
{
	AI_Output(self,other,"DIA_Sentenza_Vzwei_09_00");	//Tak tì tu máme zas. Mrknìme se, copak máš u sebe tentokrát!
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
	SENTENZA_SEARCHDAY = b_getdayplus();
	Info_ClearChoices(dia_sentenza_vzwei);
	Info_AddChoice(dia_sentenza_vzwei,"Dej ty špinavé pracky pryè!",dia_sentenza_vzwei_handsoff);
	Info_AddChoice(dia_sentenza_vzwei,"Jen si poslu, klíïo píïo si mì prohledej!",dia_sentenza_vzwei_searchme);
};

func void dia_sentenza_vzwei_searchme()
{
	b_sentenza_searchme();
	AI_StopProcessInfos(self);
};

func void dia_sentenza_vzwei_handsoff()
{
	AI_Output(other,self,"DIA_Sentenza_Vzwei_HandsOff_15_00");	//Dej ty špinavé pracky pryè!
	AI_Output(self,other,"DIA_Sentenza_Vzwei_HandsOff_09_01");	//(hrozivì) Nebo co? Tentokrát máš nejspíš u sebe daleko víc!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SENTENZA_WANNAJOIN(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 3;
	condition = dia_sentenza_wannajoin_condition;
	information = dia_sentenza_wannajoin_info;
	permanent = FALSE;
	description = "Pøišel jsem se k vám pøidat.";
};


func int dia_sentenza_wannajoin_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_sentenza_wannajoin_info()
{
	AI_Output(other,self,"DIA_Sentenza_WannaJoin_15_00");	//Pøišel jsem se k vám pøidat.
	AI_Output(self,other,"DIA_Sentenza_WannaJoin_09_01");	//To je od tebe hezké.
	AI_Output(self,other,"DIA_Sentenza_WannaJoin_09_02");	//(lhostejnì) Je ti jasné, e oldáci budou hlasovat, jestli tì pøijmout nebo ne?
};


instance DIA_SENTENZA_VOTE(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 4;
	condition = dia_sentenza_vote_condition;
	information = dia_sentenza_vote_info;
	permanent = TRUE;
	description = "A ty mi svùj hlas dáš?";
};


func int dia_sentenza_vote_condition()
{
	if(Npc_KnowsInfo(other,dia_sentenza_wannajoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_sentenza_vote_info()
{
	AI_Output(other,self,"DIA_Sentenza_Vote_15_00");	//A ty mi svùj hlas dáš?
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_01");	//Jenom proto, es mi dal pár na frak? (zasmìje se) Ne.
	}
	else if((Npc_HasItems(self,itmi_gold) >= 50) && ((SENTENZA_GOLDTAKEN == TRUE) || (SENTENZA_GOLDGIVEN == TRUE)))
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_02");	//A proè vlastnì ne? 50 zlaákù je docela dobrá cena za jeden hlas, nemyslíš?
		SENTENZA_STIMME = TRUE;
		b_logentry(TOPIC_SLDRESPEKT,"Sentenza nemá nic proti tomu, abych se pøidal k oldákùm.");
	}
	else if((SENTENZA_STIMME == TRUE) && (Npc_HasItems(self,itmi_gold) < 50))
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_03");	//Potom, cos mi zase ukradl zlato? Neøekl bych, hochu.
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_04");	//Takhle to nefunguje, chlapeèku! Jestli pro tebe mám hlasovat, pak musíš ke mnì nasmìrovat taky òákı zlato.
		AI_Output(other,self,"DIA_Sentenza_Vote_15_05");	//Kolik?
		AI_Output(self,other,"DIA_Sentenza_Vote_09_06");	//50 zlaákù. To bys musel stejnì zaplatit.
		SENTENZA_WANTS50 = TRUE;
	};
};


var int sentenza_goldgiven;

instance DIA_SENTENZA_PAY50(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 5;
	condition = dia_sentenza_pay50_condition;
	information = dia_sentenza_pay50_info;
	permanent = TRUE;
	description = "Tady máš tedy tìch 50 zlaákù.";
};


func int dia_sentenza_pay50_condition()
{
	if((SENTENZA_WANTS50 == TRUE) && (Npc_HasItems(self,itmi_gold) < 50) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_sentenza_pay50_info()
{
	AI_Output(other,self,"DIA_Sentenza_Pay50_15_00");	//Tady máš tedy tìch 50 zlaákù.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Sentenza_Pay50_09_01");	//Tak díky, to staèí!
		SENTENZA_GOLDGIVEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Pay50_09_02");	//Nezahrávej si se mnou. Dostanu 50 zlaákù a ani o mìïák míò, jasné?
	};
};


var int sentenza_einmal;

instance DIA_SENTENZA_GOLDBACK(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 6;
	condition = dia_sentenza_goldback_condition;
	information = dia_sentenza_goldback_info;
	permanent = TRUE;
	description = "Vra mi mé zlato!";
};


func int dia_sentenza_goldback_condition()
{
	if(Npc_HasItems(self,itmi_gold) >= 50)
	{
		if((SENTENZA_GOLDGIVEN == FALSE) || (other.guild == GIL_SLD))
		{
			return TRUE;
		};
	};
};

func void dia_sentenza_goldback_info()
{
	AI_Output(other,self,"DIA_Sentenza_GoldBack_15_00");	//Vra mi mé zlato!
	if((other.guild == GIL_SLD) && (TORLOF_SENTENZACOUNTED == TRUE) && (SENTENZA_EINMAL == FALSE))
	{
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_01");	//Teï, kdy jsem ti dal svùj hlas?
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_02");	//Ty mizernı ebraèisko!
		SENTENZA_EINMAL = TRUE;
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_03");	//Klídek! Jenom to na chvilku pohlídám.
	};
};


instance DIA_SENTENZA_AUFSMAUL(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 7;
	condition = dia_sentenza_aufsmaul_condition;
	information = dia_sentenza_aufsmaul_info;
	permanent = FALSE;
	description = "Povìz mi, to, co máš vepøedu, je tvùj ksicht, nebo to na mì vystrkuješ prdel?";
};


func int dia_sentenza_aufsmaul_condition()
{
	if((Npc_HasItems(self,itmi_gold) >= 50) || Npc_KnowsInfo(other,dia_jarvis_missionko))
	{
		return TRUE;
	};
};

func void dia_sentenza_aufsmaul_info()
{
	AI_Output(other,self,"DIA_Sentenza_AufsMaul_15_00");	//Povìz mi, to, co máš vepøedu, je tvùj ksicht, nebo to na mì vystrkuješ prdel?
	AI_Output(self,other,"DIA_Sentenza_AufsMaul_09_01");	//(vztekle se smìje) Dobøe, kdy to tak chceš...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SENTENZA_AUFSMAULAGAIN(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 8;
	condition = dia_sentenza_aufsmaulagain_condition;
	information = dia_sentenza_aufsmaulagain_info;
	permanent = TRUE;
	description = "Je èas na další náøez!";
};


func int dia_sentenza_aufsmaulagain_condition()
{
	if(Npc_KnowsInfo(other,dia_sentenza_aufsmaul))
	{
		if((Npc_HasItems(self,itmi_gold) >= 50) || Npc_KnowsInfo(other,dia_jarvis_missionko))
		{
			return TRUE;
		};
	};
};

func void dia_sentenza_aufsmaulagain_info()
{
	AI_Output(other,self,"DIA_Sentenza_AufsMaulAgain_15_00");	//Je èas na další náøez!
	AI_Output(self,other,"DIA_Sentenza_AufsMaulAgain_09_01");	//Kdy to øíkáš...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SENTENZA_PERM(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 1;
	condition = dia_sentenza_perm_condition;
	information = dia_sentenza_perm_info;
	permanent = TRUE;
	description = "Tak co, jak to jde?";
};


func int dia_sentenza_perm_condition()
{
	return TRUE;
};

func void dia_sentenza_perm_info()
{
	AI_Output(other,self,"DIA_Sentenza_PERM_15_00");	//Tak co, jak to jde?
	AI_Output(self,other,"DIA_Sentenza_PERM_09_01");	//Moc lidí tudy nechodí, ale doteïka mi kadı zaplatil.
	if(Npc_HasItems(self,itmi_gold) < 50)
	{
		AI_Output(self,other,"DIA_Sentenza_PERM_09_02");	//Kromì tebe. (zašklebí se)
	};
};


instance DIA_SENTENZA_PICKPOCKET(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 900;
	condition = dia_sentenza_pickpocket_condition;
	information = dia_sentenza_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_sentenza_pickpocket_condition()
{
	return c_beklauen(56,65);
};

func void dia_sentenza_pickpocket_info()
{
	Info_ClearChoices(dia_sentenza_pickpocket);
	Info_AddChoice(dia_sentenza_pickpocket,DIALOG_BACK,dia_sentenza_pickpocket_back);
	Info_AddChoice(dia_sentenza_pickpocket,DIALOG_PICKPOCKET,dia_sentenza_pickpocket_doit);
};

func void dia_sentenza_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sentenza_pickpocket);
};

func void dia_sentenza_pickpocket_back()
{
	Info_ClearChoices(dia_sentenza_pickpocket);
};

