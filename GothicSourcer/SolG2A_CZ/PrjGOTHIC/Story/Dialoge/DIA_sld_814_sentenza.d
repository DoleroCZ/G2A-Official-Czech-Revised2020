
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
	AI_Output(self,other,"DIA_Sentenza_Hello_09_00");	//Kam si mysl�, �e jde�?
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
	SENTENZA_SEARCHDAY = b_getdayplus();
	Info_ClearChoices(dia_sentenza_hello);
	Info_AddChoice(dia_sentenza_hello,"A co je ti vlastn� do toho?",dia_sentenza_hello_notyourbusiness);
	Info_AddChoice(dia_sentenza_hello,"Cht�l jsem se tu jen trochu porozhl�dnout, nic v�c.",dia_sentenza_hello_justlooking);
};

func void dia_sentenza_hello_justlooking()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_JustLooking_15_00");	//Cht�l jsem se tu jen trochu porozhl�dnout, nic v�c.
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_01");	//(sm�je se) Na takov� jako ty tu ��h� spousta nebezpe��! A ty mi ��k�, �e se tu chce� jen tak porozhl�dnout?
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_02");	//Ha! Ty chce� ur�it� na statek! Pro� by ses jinak plaho�il takov� l�n cesty, co?
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_03");	//Tak p�esta� pl�cat kraviny a nech m�, a� t� prohled�m. Pak si m��e� j�t zase po sv�m.
	Info_ClearChoices(dia_sentenza_hello);
	Info_AddChoice(dia_sentenza_hello,"Dej ty pracky pry�.",dia_sentenza_hello_handsoff);
	Info_AddChoice(dia_sentenza_hello,"Jen si poslu�, kl��o p��o si m� prohledej!",dia_sentenza_hello_searchme);
};

func void dia_sentenza_hello_notyourbusiness()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_NotYourBusiness_15_00");	//A co je ti vlastn� do toho?
	AI_Output(self,other,"DIA_Sentenza_Hello_NotYourBusiness_09_01");	//(povzdech) Pak ti to d�kladn� vysv�tl�m.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void b_sentenza_searchme()
{
	var int playergold;
	playergold = Npc_HasItems(other,itmi_gold);
	AI_Output(other,self,"DIA_Sentenza_Hello_SearchMe_15_00");	//Jen si poslu�, kl��o p��o si m� prohledej!
	AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_01");	//Tak se pod�vejme, copak to tu m�.
	if(playergold >= 50)
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_02");	//�, zlato! Vl��et s sebou tolik pen�z, to m��e b�t po��dn� nebezpe�n�.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_03");	//Spousta �old�k� jsou prachsprost� hrdlo�ezov�, ne tak poctiv� jako j�.
		b_giveinvitems(other,self,itmi_gold,50);
		SENTENZA_GOLDTAKEN = TRUE;
	}
	else if(playergold > 0)
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_04");	//No, to toho teda moc nem�.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_05");	//Vr�t�m se k tob� pozd�ji.
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_06");	//Tos u�el takovou �treku a nem� ani m���k?
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_07");	//Nezd� se mi ale, �e bys n�jak trp�l hladem. Ur�it� si n�kde ��kou tu �kv�ru schov�v�, co?
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_08");	//Je vid�t, �e nejsi �pln� blb�. Ur�it� se je�t� setk�me - tak na sebe zat�m d�vej pozor!
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_09");	//A nejsp� jenom ty s�m v�, kde sv� zlato m�.
	};
	SENTENZA_WANTS50 = TRUE;
	AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_10");	//J� po tob� chci jenom 50 zla��k� jako m�tn�. A sta��, kdy� to zaplat� jednou - to je p�ece f�r, ne?
};

func void dia_sentenza_hello_searchme()
{
	b_sentenza_searchme();
	AI_StopProcessInfos(self);
};

func void dia_sentenza_hello_handsoff()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_HandsOff_15_00");	//Dej ty pracky pry�.
	AI_Output(self,other,"DIA_Sentenza_Hello_HandsOff_09_01");	//(v�hru�n�) Nebo co?
	Info_ClearChoices(dia_sentenza_hello);
	Info_AddChoice(dia_sentenza_hello,"Nebo nic. Tak m� teda prohledej!",dia_sentenza_hello_searchme);
	Info_AddChoice(dia_sentenza_hello,"Nebo si na n�jak� �as bude� muset nechat zaj�t chu� na prohled�v�n�.",dia_sentenza_hello_orelse);
};

func void dia_sentenza_hello_orelse()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_OrElse_15_00");	//Nebo si na n�jak� �as bude� muset nechat zaj�t chu� na prohled�v�n�.
	AI_Output(self,other,"DIA_Sentenza_Hello_OrElse_09_01");	//Tak to se uvid�.
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
	AI_Output(self,other,"DIA_Sentenza_Vzwei_09_00");	//Tak t� tu m�me zas. Mrkn�me se, copak m� u sebe tentokr�t!
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
	SENTENZA_SEARCHDAY = b_getdayplus();
	Info_ClearChoices(dia_sentenza_vzwei);
	Info_AddChoice(dia_sentenza_vzwei,"Dej ty �pinav� pracky pry�!",dia_sentenza_vzwei_handsoff);
	Info_AddChoice(dia_sentenza_vzwei,"Jen si poslu�, kl��o p��o si m� prohledej!",dia_sentenza_vzwei_searchme);
};

func void dia_sentenza_vzwei_searchme()
{
	b_sentenza_searchme();
	AI_StopProcessInfos(self);
};

func void dia_sentenza_vzwei_handsoff()
{
	AI_Output(other,self,"DIA_Sentenza_Vzwei_HandsOff_15_00");	//Dej ty �pinav� pracky pry�!
	AI_Output(self,other,"DIA_Sentenza_Vzwei_HandsOff_09_01");	//(hroziv�) Nebo co? Tentokr�t m� nejsp� u sebe daleko v�c!
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
	description = "P�i�el jsem se k v�m p�idat.";
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
	AI_Output(other,self,"DIA_Sentenza_WannaJoin_15_00");	//P�i�el jsem se k v�m p�idat.
	AI_Output(self,other,"DIA_Sentenza_WannaJoin_09_01");	//To je od tebe hezk�.
	AI_Output(self,other,"DIA_Sentenza_WannaJoin_09_02");	//(lhostejn�) Je ti jasn�, �e �old�ci budou hlasovat, jestli t� p�ijmout nebo ne?
};


instance DIA_SENTENZA_VOTE(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 4;
	condition = dia_sentenza_vote_condition;
	information = dia_sentenza_vote_info;
	permanent = TRUE;
	description = "A ty mi sv�j hlas d�?";
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
	AI_Output(other,self,"DIA_Sentenza_Vote_15_00");	//A ty mi sv�j hlas d�?
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_01");	//Jenom proto, �es mi dal p�r na frak? (zasm�je se) Ne.
	}
	else if((Npc_HasItems(self,itmi_gold) >= 50) && ((SENTENZA_GOLDTAKEN == TRUE) || (SENTENZA_GOLDGIVEN == TRUE)))
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_02");	//A pro� vlastn� ne? 50 zla��k� je docela dobr� cena za jeden hlas, nemysl�?
		SENTENZA_STIMME = TRUE;
		b_logentry(TOPIC_SLDRESPEKT,"Sentenza nem� nic proti tomu, abych se p�idal k �old�k�m.");
	}
	else if((SENTENZA_STIMME == TRUE) && (Npc_HasItems(self,itmi_gold) < 50))
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_03");	//Potom, cos mi zase ukradl zlato? Ne�ekl bych, hochu.
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_04");	//Takhle to nefunguje, chlape�ku! Jestli pro tebe m�m hlasovat, pak mus� ke mn� nasm�rovat taky ��k� zlato.
		AI_Output(other,self,"DIA_Sentenza_Vote_15_05");	//Kolik?
		AI_Output(self,other,"DIA_Sentenza_Vote_09_06");	//50 zla��k�. To bys musel stejn� zaplatit.
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
	description = "Tady m� tedy t�ch 50 zla��k�.";
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
	AI_Output(other,self,"DIA_Sentenza_Pay50_15_00");	//Tady m� tedy t�ch 50 zla��k�.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Sentenza_Pay50_09_01");	//Tak d�ky, to sta��!
		SENTENZA_GOLDGIVEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Pay50_09_02");	//Nezahr�vej si se mnou. Dostanu 50 zla��k� a ani o m���k m��, jasn�?
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
	description = "Vra� mi m� zlato!";
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
	AI_Output(other,self,"DIA_Sentenza_GoldBack_15_00");	//Vra� mi m� zlato!
	if((other.guild == GIL_SLD) && (TORLOF_SENTENZACOUNTED == TRUE) && (SENTENZA_EINMAL == FALSE))
	{
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_01");	//Te�, kdy� jsem ti dal sv�j hlas?
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_02");	//Ty mizern� �ebra�isko!
		SENTENZA_EINMAL = TRUE;
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_03");	//Kl�dek! Jenom to na chvilku pohl�d�m.
	};
};


instance DIA_SENTENZA_AUFSMAUL(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 7;
	condition = dia_sentenza_aufsmaul_condition;
	information = dia_sentenza_aufsmaul_info;
	permanent = FALSE;
	description = "Pov�z mi, to, co m� vep�edu, je tv�j ksicht, nebo to na m� vystrkuje� prdel?";
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
	AI_Output(other,self,"DIA_Sentenza_AufsMaul_15_00");	//Pov�z mi, to, co m� vep�edu, je tv�j ksicht, nebo to na m� vystrkuje� prdel?
	AI_Output(self,other,"DIA_Sentenza_AufsMaul_09_01");	//(vztekle se sm�je) Dob�e, kdy� to tak chce�...
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
	description = "Je �as na dal�� n��ez!";
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
	AI_Output(other,self,"DIA_Sentenza_AufsMaulAgain_15_00");	//Je �as na dal�� n��ez!
	AI_Output(self,other,"DIA_Sentenza_AufsMaulAgain_09_01");	//Kdy� to ��k�...
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
	AI_Output(self,other,"DIA_Sentenza_PERM_09_01");	//Moc lid� tudy nechod�, ale dote�ka mi ka�d� zaplatil.
	if(Npc_HasItems(self,itmi_gold) < 50)
	{
		AI_Output(self,other,"DIA_Sentenza_PERM_09_02");	//Krom� tebe. (za�kleb� se)
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

