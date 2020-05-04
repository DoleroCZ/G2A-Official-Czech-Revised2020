
var int vatras_schickeleuteweg;
var int vatras_laresexit;
var int vatras_more;

instance DIA_ADDON_VATRAS_KILLERWARNING(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_killerwarning_condition;
	information = dia_addon_vatras_killerwarning_info;
	important = TRUE;
};


func int dia_addon_vatras_killerwarning_condition()
{
	if((KAPITEL >= 5) && (MADKILLERCOUNT >= 3) && (MADKILLERCOUNT < 7) && (VATRASPISSEDOFFFOREVER == FALSE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_killerwarning_info()
{
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_00");	//Hodn� zv�st� se o tob� v Khorinisu ����.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_01");	//��k� se, �e jsi zapleten do vra�d nevinn�ch lid�.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_02");	//Mohu t� jen varovat synu, doufaje �e spr�vn�.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_03");	//Nesestupuj z cesty rovnov�hy a z�chrany tohoto sv�ta. Jinak se bude� muset p�ipravit n�st n�sledky.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_04");	//Jak mohu b�t mimo slu�bu?
};


instance DIA_ADDON_VATRAS_LASTWARNING(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_lastwarning_condition;
	information = dia_addon_vatras_lastwarning_info;
	important = TRUE;
};


func int dia_addon_vatras_lastwarning_condition()
{
	if((KAPITEL >= 5) && (MADKILLERCOUNT >= 7) && (VATRASPISSEDOFFFOREVER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_lastwarning_info()
{
	b_lastwarningvatras();
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_06");	//Je n�co, co bys cht�l dodat?
	Info_ClearChoices(dia_addon_vatras_lastwarning);
	Info_AddChoice(dia_addon_vatras_lastwarning,"Vypadni",dia_addon_vatras_lastwarning_arsch);
	Info_AddChoice(dia_addon_vatras_lastwarning,"Je mi l�to. Nev�d�l jsem co d�l�m.",dia_addon_vatras_lastwarning_reue);
};

func void dia_addon_vatras_lastwarning_arsch()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_15_00");	//Vypadni
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_00");	//Ve tv�ch slovech nen� ��dn� n�znak l�tosti.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_01");	//Nedal jsi mi jinou mo�nost.
	Info_ClearChoices(dia_addon_vatras_lastwarning);
	b_vatraspissedoff();
};

func void dia_addon_vatras_lastwarning_reue()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LastWarning_Reue_ADD_15_00");	//Je mi l�to. Nev�d�l jsem co d�l�m.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Reue_ADD_05_00");	//Budu se za tebe modlit a doufat, �e jednoho dne op�t najde� rovnov�hu.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Reue_ADD_05_01");	//Bu� opatrn� a opova� se je�t� n�kdy zapl�st do vra�dy.
	Info_ClearChoices(dia_addon_vatras_lastwarning);
	VATRASMADKILLERCOUNT = MADKILLERCOUNT;
};


instance DIA_ADDON_VATRAS_PISSEDOFF(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_pissedoff_condition;
	information = dia_addon_vatras_pissedoff_info;
	important = TRUE;
};


func int dia_addon_vatras_pissedoff_condition()
{
	if((MADKILLERCOUNT > VATRASMADKILLERCOUNT) && Npc_KnowsInfo(other,dia_addon_vatras_lastwarning) && (KAPITEL >= 5))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_pissedoff_info()
{
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_00");	//Tv� slova jsou stejn� �patn� jako tv� �iny.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_01");	//Tv� neciteln� vra�d�n� zjevn� nikdy neskon��.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_02");	//Ned�v� mi jinou mo�nost.
	b_vatraspissedoff();
};


instance DIA_VATRAS_EXIT(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 999;
	condition = dia_vatras_exit_condition;
	information = dia_vatras_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vatras_exit_condition()
{
	return TRUE;
};

func void dia_vatras_exit_info()
{
	if(Npc_KnowsInfo(other,dia_addon_vatras_howtojoin) && (VATRAS_LARESEXIT == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_00");	//Po�kej!
		if(VATRAS_GEHZULARES == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_01");	//Pokud se setk� s Laresem....
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_02");	//Je tu jedna mal� v�c, o kterou bych t� cht�l po��dat.
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_03");	//B� do p��stavu. Najde� tam chlap�ka jm�nem Lares.
			VATRAS_GEHZULARES = TRUE;
		};
		AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_04");	//Doru� mu tento ornament a pov�z mu, aby ho odnesl zp�t. Bude v�d�t, co ud�lat d�l.
		CreateInvItems(self,itmi_ornament_addon_vatras,1);
		b_giveinvitems(self,other,itmi_ornament_addon_vatras,1);
		VATRAS_LARESEXIT = TRUE;
	};
	AI_StopProcessInfos(self);
	VATRAS_MORE = FALSE;
	if(VATRAS_SCHICKELEUTEWEG == TRUE)
	{
		b_startotherroutine(vlk_455_buerger,"VATRASAWAY");
		b_startotherroutine(vlk_454_buerger,"VATRASAWAY");
		b_startotherroutine(vlk_428_buergerin,"VATRASAWAY");
		b_startotherroutine(vlk_450_buerger,"VATRASAWAY");
		b_startotherroutine(vlk_426_buergerin,"VATRASAWAY");
		b_startotherroutine(vlk_421_valentino,"VATRASAWAY");
		VATRAS_SCHICKELEUTEWEG = FALSE;
	};
};


instance DIA_VATRAS_PICKPOCKET(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 900;
	condition = dia_vatras_pickpocket_condition;
	information = dia_vatras_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_vatras_pickpocket_condition()
{
	return c_beklauen(91,250);
};

func void dia_vatras_pickpocket_info()
{
	Info_ClearChoices(dia_vatras_pickpocket);
	Info_AddChoice(dia_vatras_pickpocket,DIALOG_BACK,dia_vatras_pickpocket_back);
	Info_AddChoice(dia_vatras_pickpocket,DIALOG_PICKPOCKET,dia_vatras_pickpocket_doit);
};

func void dia_vatras_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_vatras_pickpocket);
};

func void dia_vatras_pickpocket_back()
{
	Info_ClearChoices(dia_vatras_pickpocket);
};


instance DIA_VATRAS_GREET(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_vatras_greet_condition;
	information = dia_vatras_greet_info;
	important = TRUE;
};


func int dia_vatras_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_greet_info()
{
	AI_Output(self,other,"DIA_Vatras_GREET_05_00");	//Adanos t� prov�zej.
	AI_Output(other,self,"DIA_Vatras_GREET_15_01");	//Kdo jsi?
	AI_Output(self,other,"DIA_Vatras_GREET_05_02");	//Jsem Vatras, slu�ebn�k Adan�v, str�ce bo�sk� i pozemsk� rovnov�hy.
	AI_Output(self,other,"DIA_Vatras_GREET_05_03");	//Co pro tebe mohu ud�lat?
};


instance DIA_ADDON_VATRAS_CAVALORN(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_cavalorn_condition;
	information = dia_addon_vatras_cavalorn_info;
	description = "M�m pro tebe dopis.";
};


func int dia_addon_vatras_cavalorn_condition()
{
	if(((Npc_HasItems(other,itwr_saturasfirstmessage_addon_sealed) >= 1) && (MIS_ADDON_CAVALORN_LETTER2VATRAS == LOG_RUNNING)) || (Npc_HasItems(other,itwr_saturasfirstmessage_addon) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_cavalorn_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_15_00");	//M�m pro tebe dopis.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_01");	//Pro m�?
	if(SATURASFIRSTMESSAGEOPENED == FALSE)
	{
		b_giveplayerxp(XP_ADDON_CAVALORN_LETTER2VATRAS);
		b_giveinvitems(other,self,itwr_saturasfirstmessage_addon_sealed,1);
	}
	else
	{
		b_giveplayerxp(XP_ADDON_CAVALORN_LETTER2VATRAS_OPENED);
		b_giveinvitems(other,self,itwr_saturasfirstmessage_addon,1);
		AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_02");	//Jo, ale...byl otev�en. Douf�m �e ho ne�etl nikdo, kdo ho nem� vid�t.
	};
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_03");	//Vskutku. To je opravdu d�le�it� zpr�va.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_04");	//Div�m se, �e se ti ta zpr�va dostala v�bec do rukou.
	Info_ClearChoices(dia_addon_vatras_cavalorn);
	Info_AddChoice(dia_addon_vatras_cavalorn,"Sebral jsem to bandit�m",dia_addon_vatras_cavalorn_bandit);
	if(MIS_ADDON_CAVALORN_KILLBRAGO == LOG_SUCCESS)
	{
		Info_AddChoice(dia_addon_vatras_cavalorn,"Dal mi ji Cavalorn.",dia_addon_vatras_cavalorn_cavalorn);
	};
	MIS_ADDON_CAVALORN_LETTER2VATRAS = LOG_SUCCESS;
};

func void dia_addon_vatras_cavalorn_bandit()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Bandit_15_00");	//Sebral jsem to bandit�m
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_01");	//(znepokojen�) U Adanose! To nen� dobr�. To v�bec nen� dobr�.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_02");	//Pokud je tv� vypr�v�n� pravdiv�, pak m�me obrovsk� probl�m.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_03");	//Budu se t�m zab�vat hned, jak to bude mo�n�.
	Info_ClearChoices(dia_addon_vatras_cavalorn);
};

func void dia_addon_vatras_cavalorn_cavalorn()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Cavalorn_15_00");	//Dal mi ji Cavalorn.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Cavalorn_05_01");	//(p�ekvapen�) Cavalorn? Kde je?
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Cavalorn_15_02");	//�ekl mi, abych ti vy��dil, �e nemohl dopis doru�it. Nyn� je na cest� k m�stu obvykl�ho setk�n�. A� u� je to cokoliv.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Cavalorn_05_03");	//Vid�m, �e sis z�skal jeho d�v�ru. M�l bych ti tak� v��it synu.
	b_giveplayerxp(XP_ADDON_CAVALORNTRUST);
	Info_ClearChoices(dia_addon_vatras_cavalorn);
};


var int vatras_why;

instance DIA_ADDON_VATRAS_CAVALORNSENTME(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_addon_vatras_cavalornsentme_condition;
	information = dia_addon_vatras_cavalornsentme_info;
	permanent = FALSE;
	description = "Cavalorn m� za tebou poslal!";
};


func int dia_addon_vatras_cavalornsentme_condition()
{
	if((SC_KNOWSRANGER == TRUE) && (SC_ISRANGER == FALSE) && Npc_KnowsInfo(other,dia_addon_cavalorn_ring) && (VATRAS_WHY == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_cavalornsentme_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Add_15_00");	//Cavalorn m� za tebou poslal!
	AI_Output(self,other,"DIA_Addon_Vatras_Add_05_01");	//A co ��kal?
	AI_Output(other,self,"DIA_Addon_Vatras_Add_15_02");	//Zm�nil se, �e m� kolem sebe n�kolik schopn�ch lid�, co ti pom�haj�. Pr� bych se mohl taky p�idat.
	AI_Output(self,other,"DIA_Addon_Vatras_Add_05_03");	//(usm�v)Tak .... cht�l by ses k n�m p�idat synu?
};


instance DIA_ADDON_VATRAS_TELLME(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_addon_vatras_tellme_condition;
	information = dia_addon_vatras_tellme_info;
	permanent = TRUE;
	description = "Pov�z mi n�co o Kruhu Vody.";
};


func int dia_addon_vatras_tellme_condition()
{
	if((SC_KNOWSRANGER == TRUE) && (SC_ISRANGER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_tellme_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_15_00");	//Pov�z mi n�co o Kruhu Vody.
	if(!Npc_KnowsInfo(other,dia_addon_vatras_wannaberanger))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_01");	//(netrp�liv�) A pro� bych ti m�l n�co ��kat?
		VATRAS_WHY = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_02");	//Nemus� v�d�t V�ECHNO, dokud nejsi jedn�m z n�s.
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_03");	//�eknu ti v�e, co mohu.
		Info_ClearChoices(dia_addon_vatras_tellme);
		Info_AddChoice(dia_addon_vatras_tellme,DIALOG_BACK,dia_addon_vatras_tellme_back);
		Info_AddChoice(dia_addon_vatras_tellme,"Tak co m�te nyn� v pl�nu?",dia_addon_vatras_tellme_philo);
		Info_AddChoice(dia_addon_vatras_tellme,"Kde jsou ostatn� m�gov� Vody?",dia_addon_vatras_tellme_otherkdw);
		Info_AddChoice(dia_addon_vatras_tellme,"Kdo jsou �lenov� Kruhu Vody?",dia_addon_vatras_tellme_wernoch);
	};
};

func void dia_addon_vatras_tellme_back()
{
	Info_ClearChoices(dia_addon_vatras_tellme);
};

func void dia_addon_vatras_tellme_philo()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Philo_15_00");	//Tak co m�te nyn� v pl�nu?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_01");	//Stoj�me mezi ��dem Innose a chaosem Beliara.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_02");	//Pokud by jedna strana p�eva�ovala, m�lo by to za n�sledek bu� ztr�tu svobody nebo p��chod smrtnesouc�ho chaosu.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_03");	//A pokou��me se zajistit rovnov�hu. Je to jedin� cesta pro �ivot na tomto sv�t�.
	if(MIS_VATRAS_FINDTHEBANDITTRADER == 0)
	{
		Info_AddChoice(dia_addon_vatras_tellme,"Mohl bys b�t trochu v�c konkr�tn�?",dia_addon_vatras_tellme_konkret);
	};
};

func void dia_addon_vatras_tellme_konkret()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Konkret_15_00");	//(udiven�) Mohl bys b�t trochu v�c konkr�tn�?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_01");	//Po t�, co bariera padla to tu je velmi nebezpe�n�.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_02");	//Jedna z nejv�t��ch hrozeb jsou zjevn� banditi.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_03");	//Je skoro nemo�n� cestovat po ostrov� neozbrojen ...
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_04");	//... ve m�st� je dokonce n�kdo, kdo bandity podporuje!
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Add_05_00");	//Zjistili jsme, �e bandit� nakupuj� zbran� od jednoho z m�stn�ch obchodn�k�.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_05");	//Nap��klad takov� lidi se sna��me naj�t, abychom zabr�nili jak�mukoliv zlu ve m�st�.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_06");	//Pokud by si se o tom chce� dozv�d�t v�c, tak mi �ekni.
	VATRAS_TOMARTIN = TRUE;
	Log_CreateTopic(TOPIC_ADDON_BANDITTRADER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BANDITTRADER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BANDITTRADER,"V Khorinisu je dodavatel zbran� pro bandity. Vatras m� pov��il vy�et�ov�n�m.");
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Martin, proviantmistr paladin�, o dodavateli zbran� n�co v�. Najdu ho ve skladu paladin� v p��stavu.");
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Kruh Vody se zab�v� probl�mem s bandity v okol� m�sta Khorinis.");
};

func void dia_addon_vatras_tellme_otherkdw()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_OtherKdW_15_00");	//Kde jsou ostatn� m�gov� Vody?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_OtherKdW_05_01");	//Na severov�chod� zkoumaj� ruiny prastar�ho n�roda.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_OtherKdW_05_02");	//Domn�v�me se, �e v ruin�ch je vchod na doposud neobjevenou ��st ostrova.
	Log_CreateTopic(TOPIC_ADDON_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KDW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KDW,"Ostatn� m�gov� Vody prozkoum�vaj� ruiny star�ho n�roda na severov�chod� Khorinisu.  Je to asi vstup do doposud neobjeven�ch ��st� Khorinisu.");
	Info_AddChoice(dia_addon_vatras_tellme,"�ekni mi v�c o t� neprozkouman� ��sti.",dia_addon_vatras_tellme_unexplored);
};

func void dia_addon_vatras_tellme_unexplored()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Unexplored_15_00");	//�ekni mi v�c o t� neprozkouman� ��sti.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Unexplored_05_01");	//Mohu napsat dopis a poslat t� s n�m za Saturasem, m�-li zajem o p�ipojen� se k v�prav�.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Unexplored_05_02");	//Samoz�ejm�, �e se na tom m��e� pod�let jen jako jeden z n�s.
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Unexplored_15_03");	//Jist�.
	b_logentry(TOPIC_ADDON_KDW,"D��ve ne� se mohu p�ipojit k m�gsk� expedici, mus�m se podle Vatrase st�t �lenem Kruhu Vody.");
};

func void dia_addon_vatras_tellme_wernoch()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_WerNoch_15_00");	//Kdo jsou �lenov� Kruhu Vody?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_WerNoch_05_01");	//To se dozv�, a� bude� jedn�m z n�s.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_WerNoch_05_02");	//Jsem si jist, �e se s n�k�m z n�s setk�.
};


instance DIA_ADDON_VATRAS_WANNABERANGER(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_wannaberanger_condition;
	information = dia_addon_vatras_wannaberanger_info;
	description = "Chci se p�idat ke  Kruhu Vody!";
};


func int dia_addon_vatras_wannaberanger_condition()
{
	if(SC_KNOWSRANGER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_wannaberanger_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_15_00");	//Chci se p�idat ke  Kruhu Vody!
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_ring))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_01");	//Ano? Dob�e, ji� jsi splnil prvn� po�adavek.
		AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_15_02");	//O �em to mluv�?
		AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_03");	//N�kdo z n�s ti v���. Jinak bys o n�s v�bec nev�d�l.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_04");	//Ale 'j�' o tob� nic nev�m ...
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_04");	//Co bys r�d v�d�l?
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_05");	//No, mohl bys mi prozradit, odkud p�ich�z� a pro� jsi vkro�il do m�sta.
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_06");	//Nesu d�le�itou zpr�vu veliteli paladin�.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_07");	//Co je to za zpr�vu?
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Objevili se tu draci...",dia_vatras_influence_first_truth);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Brzy se stanou hrozn� v�ci.",dia_vatras_influence_first_lie);
};

func void dia_vatras_influence_first_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00");	//Zat�mco tu spolu hovo��me, sb�r� se proti n�m obrovsk� arm�da, kterou vedou draci a kter� si chce podmanit celou zemi.
	if(VATRAS_FIRST == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01");	//Pokud je to skute�n� pravda, pak by to mohlo naru�it rovnov�hu cel� zem�. Kdo ti to �ekl?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02");	//(p�em��liv�) Draci? Mysl� ty tvory, o kter�ch se vypr�v�j� legendy? Jak jsi na to p�i�el?
	};
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"No, n�kde jsem n�co zaslechl.",dia_vatras_influence_second_lie);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Pov�d�l mi to m�g Xardas...",dia_vatras_influence_second_truth);
	VATRAS_FIRST = TRUE;
};

func void dia_vatras_influence_first_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_LIE_15_00");	//Brzy se stanou hrozn� v�ci.
	if(VATRAS_FIRST == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_01");	//(rozl�cen�) Aha. A kdo ti to �ekl?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_02");	//Hrozn� v�ci, hmmm... a jak to v�?
	};
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"No, n�kde jsem n�co zaslechl.",dia_vatras_influence_second_lie);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Pov�d�l mi to m�g Xardas...",dia_vatras_influence_second_truth);
	VATRAS_FIRST = 2;
};

func void dia_vatras_influence_second_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00");	//Pov�d�l mi to m�g Xardas a tak� mi nak�zal, abych varoval paladiny.
	if(VATRAS_SECOND == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01");	//V�m, �e tento mu� je moudr� a mocn� mistr magick�ch v�d. A odkud p�ich�z� ty?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02");	//Nekromant... tak�e �ije... (p�em��liv�) a poslal t� sem? Kdo doopravdy jsi?
	};
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Jsem pouh�m dobrodruhem z jihu...",dia_vatras_influence_third_lie);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Jsem b�val� trestanec...",dia_vatras_influence_third_truth);
	VATRAS_SECOND = TRUE;
};

func void dia_vatras_influence_second_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_LIE_15_00");	//No, n�kde jsem n�co zaslechl.
	if(VATRAS_SECOND == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_01");	//(otr�ven�) Pamatuje� si alespo�, odkud p�ich�z�?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_02");	//Aha. A pr�v� proto jsi podnikl tuhle cestu. Kdo doopravdy jsi?
	};
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Jsem dobrodruhem z dalek�ho jihu.",dia_vatras_influence_third_lie);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Jsem b�val� trestanec...",dia_vatras_influence_third_truth);
	VATRAS_SECOND = 2;
};

func void b_vatras_influence_repeat()
{
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_01");	//Dob�e, tak si to shr�me:
	if(VATRAS_THIRD == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_02");	//Jsi b�val� trestanec,
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_03");	//Jsi dobrodruhem z dalek�ho jihu,
	};
	if(VATRAS_SECOND == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_04");	//kter�ho sem poslal nekromant Xardas,
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_05");	//kter� se n�kde doslechl,
	};
	if(VATRAS_FIRST == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_06");	//�e na�i zemi napadnou draci.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_07");	//�e se v brzk� dob� stanou hrozn� v�ci.
	};
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_08");	//A tak jsi to p�i�el ohl�sit paladin�m.
	if((VATRAS_FIRST == TRUE) && (VATRAS_SECOND == TRUE) && (VATRAS_THIRD == TRUE))
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_09");	//To zn� sice fantasticky, ale nezd� se mi, �e bys mi lhal.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_10");	//Proto mus�m uznat, �e tv� pohnutky jsou u�lechtil�.
		AI_Output(self,other,"DIA_ADDON_Vatras_INFLUENCE_REPEAT_05_11");	//M� �anci p�ipojit se ke 'Kruhu Vody'.
		Info_ClearChoices(dia_addon_vatras_wannaberanger);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_Add_05_00");	//Mysl�m, �e jsi mi ne�ekl �pln� v�echno.
		AI_Output(self,other,"DIA_Vatras_Add_05_01");	//Jestli se boj�, �e bych mohl tv� slova n�komu vyzradit, pak nem�j strach.
		AI_Output(self,other,"DIA_Vatras_Add_05_02");	//P��sahal jsem, �e v�echna tajemstv�, kter� mi n�kdo sv���, si ponech�m pro sebe.
		if(Wld_IsTime(5,5,20,10))
		{
			AI_Output(other,self,"DIA_Vatras_Add_15_03");	//A co zdej�� lid�?
			AI_Output(self,other,"DIA_Vatras_Add_05_04");	//Ti rozum� pouze polovin� toho, co jim K��U, tak�e nem�j obavy.
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_05");	//Za�n�me tedy znovu od za��tku. Co je to za zpr�vu?
		Info_ClearChoices(dia_addon_vatras_wannaberanger);
		Info_AddChoice(dia_addon_vatras_wannaberanger,"Objevili se tu draci...",dia_vatras_influence_first_truth);
		Info_AddChoice(dia_addon_vatras_wannaberanger,"Brzy se stanou hrozn� v�ci.",dia_vatras_influence_first_lie);
	};
};

func void dia_vatras_influence_third_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00");	//Jsem b�val� v�ze� z trestaneck� kolonie v Khorinisu.
	VATRAS_THIRD = TRUE;
	b_vatras_influence_repeat();
};

func void dia_vatras_influence_third_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_LIE_15_00");	//Jsem dobrodruhem z dalek�ho jihu.
	VATRAS_THIRD = FALSE;
	b_vatras_influence_repeat();
};


instance DIA_ADDON_VATRAS_HOWTOJOIN(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_howtojoin_condition;
	information = dia_addon_vatras_howtojoin_info;
	description = "Co mus�m ud�lat k p�ijet�?";
};


func int dia_addon_vatras_howtojoin_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_vatras_wannaberanger))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_howtojoin_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_15_00");	//Co mus�m ud�lat k p�ijet�?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_01");	//Mus� si uv�domit, �e vstupem mezi n�s na sebe bere� velkou zodpov�dnost.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_02");	//Nep�ijm�m kde koho, jen proto�e si o to �ekne.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_03");	//Pokud chce� b�t jedn�m z n�s, synu, chovej se tak, jako kdybys u� byl jedn�m z n�s.
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_15_04");	//T�m mysl� ... ?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_05");	//Ka�d� mlad� mu� mus� splnit hlavn� �kol, ne� se m��e p�idat.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_06");	//Pouze pak mohu uva�ovat o tv�m p�ipojen� k n�m v na�em �kolu udr�ov�n� rovnov�hy sil na tomto ostrov�.
	Info_ClearChoices(dia_addon_vatras_howtojoin);
	Info_AddChoice(dia_addon_vatras_howtojoin,"Dob�e, jak t� m��u p�esv�d�it?",dia_addon_vatras_howtojoin_whatsgreat);
	Info_AddChoice(dia_addon_vatras_howtojoin,"Osvobodil jsem mnoho lid�. Bari�ra byla zni�ena.",dia_addon_vatras_howtojoin_freedmen);
	Info_AddChoice(dia_addon_vatras_howtojoin,"Porazil jsem Sp��e. To by se dalo nazvat hlavn� zkou�ka.",dia_addon_vatras_howtojoin_sleeper);
};

func void dia_addon_vatras_howtojoin_sleeper()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_Sleeper_15_00");	//Porazil jsem Sp��e. To by se dalo nazvat hlavn� zkou�ka.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_01");	//Sly��m posledn� dobou mnoho pov�da�ek.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_02");	//V�etn� t� o monstru zvan�m Sp�� a jeho odstran�n�m z tohoto sv�ta.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_03");	//Nesly�el jsem o tom, �e jsi za to zodpov�dn� jen ty - ale p�esto tv� o�i ��kaj�, �e v��� v to, co ��k�.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_04");	//Pon�kud m� to popuzuje, ale nejsem si jist, jestli m� m� smysly nezrazuj�.
};

func void dia_addon_vatras_howtojoin_freedmen()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_15_00");	//Osvobodil jsem mnoho lid�. Bari�ra byla zni�ena.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_01");	//Pokud za t�m OPRAVDU stoj� ty...
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_02");	//Lid�m, kter�m jsi dal svobodu nejsou jen m�gov� Vody �i nevinn� ob�an�.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_03");	//Zlo�inci z cel� zem� jsou te� rozlezl� po cel�m ostrov� a ohro�uj� ob�any tohoto m�sta.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_04");	//Tak� u� kontroluj� n�kter� ��sti ostrova bl�zko m�sta. Je t�m�� nemo�n� opustit Khorinis beze �razu.
};

func void dia_addon_vatras_howtojoin_whatsgreat()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_00");	//Dob�e, jak t� m��u p�esv�d�it?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_01");	//N�co podivn�ho se tyto dny d�je v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_02");	//Po�et zmizel�ch lid� se zvy�uje ka�d�m dnem.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_03");	//Pokud zjist�, co se s nimi stalo, p�ijmeme t� r�di do Kruhu Vody.
	Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RINGOFWATER,LOGTEXT_ADDON_KDWRIGHT);
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Vatras m� nep��jme dokud ta z�le�itost s Kruhem Vody a mizej�c�mi lidmi nebude vy�e�ena.");
	if(SC_HEAREDABOUTMISSINGPEOPLE == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,LOGTEXT_ADDON_SCKNOWSMISSPEAPL);
	};
	MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE = LOG_RUNNING;
	SC_HEAREDABOUTMISSINGPEOPLE = TRUE;
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_04");	//Ale ...
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_05");	//Ano?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_06");	//... m�l by sis nejd��ve promluvit s paladiny a ��ci jim o zpr�v�, kterou jim nese�.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_07");	//Mysl�m, �e to je neoby�ejn� d�le�it�!
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_08");	//Promluv si s Lordem Hagenem.
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Vatras chce, abych paladin�m nejprve p�edal zpr�vu o drac�ch v Hornick�m �dol�.");
	Info_ClearChoices(dia_addon_vatras_howtojoin);
};


instance DIA_ADDON_VATRAS_GUILDBYPASS(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_addon_vatras_guildbypass_condition;
	information = dia_addon_vatras_guildbypass_info;
	description = "Ale oni m� nepust�!";
};


func int dia_addon_vatras_guildbypass_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_vatras_howtojoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_guildbypass_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_15_00");	//Ale oni m� nepust�!
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_01");	//Pust�. Pokud jsi �lenem vlivn� gildy.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_02");	//Kruh m� p�r u�ite�n�ch kontakt�.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_03");	//Pokus�me se zajistit, aby jsi mohl doru�it zpr�vu Lordu Hagenovi, co nejrychleji to bude mo�n�.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_04");	//M�l by ses zeptat p��tele Larese. Mohl by ti pomoci.
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Ke vstupu k Lordu Hagenovi mus�m b�t �lenem n�jak� mocn� khorinissk� gildy.");
	Info_ClearChoices(dia_addon_vatras_guildbypass);
	Info_AddChoice(dia_addon_vatras_guildbypass,"Ud�l�m to.",dia_addon_vatras_guildbypass_back);
	Info_AddChoice(dia_addon_vatras_guildbypass,"Ke kter� gild� bych se m�l p�idat?",dia_addon_vatras_guildbypass_whichguild);
};

func void dia_addon_vatras_guildbypass_back()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_BACK_15_00");	//Ud�l�m to.
	VATRAS_GEHZULARES = TRUE;
	Info_ClearChoices(dia_addon_vatras_guildbypass);
};

func void dia_addon_vatras_guildbypass_whichguild()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_WhichGuild_15_00");	//Ke kter� gild� bych se m�l p�idat?
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_01");	//Jsou zde pouze t�i gildy, kter� jsou dostate�n� vlivn� a siln�.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_02");	//Domobrana, m�gov� Ohn� nebo �old�ci na Onarov� farm�.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_03");	//Je to tv� volba.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_04");	//Mysl�m, �e Lares ti m��e pomoci s t�mto obt�n�m rozhodov�n�m. Navrhuju, aby sis s n�m promluvil.
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Jsou zde t�i mocn� gildy ke kter�m se m��e� p�idat: m�gov� Ohn�, domobrana nebo �old�ci na velkostatk��ov� dvo�e.");
	Info_ClearChoices(dia_addon_vatras_guildbypass);
	Info_AddChoice(dia_addon_vatras_guildbypass,"Ud�l�m to.",dia_addon_vatras_guildbypass_back);
};


instance DIA_ADDON_VATRAS_NOWRANGER(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_nowranger_condition;
	information = dia_addon_vatras_nowranger_info;
	permanent = TRUE;
	description = "Jsem p�ipraven p�idat se ke Kruhu!";
};


func int dia_addon_vatras_nowranger_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_vatras_howtojoin) && (SC_ISRANGER == FALSE) && (MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_nowranger_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_00");	//Jsem p�ipraven p�idat se ke Kruhu!
	AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_01");	//Donesl jsi svou zpr�vu Lordu Hagenovi?
	if(KAPITEL >= 2)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_02");	//Ano.
		if(MIS_OLDWORLD != LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_03");	//Ale, �ekl mi, �e m�m j�t do hornick�ho �dol� a p�in�st d�kaz s�ch tvrzn�!
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_04");	//Mus� se rozhodnout, co d�l.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_05");	//Doru�en� zpr�vy bylo d�le�it� pro m�. Te� je na n�m, aby si posp�il, nebo po�kal na tv�j d�kaz.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_06");	//Co se t��e tebe ...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_07");	//Dobr�.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_08");	//Dok�zal jsi, �e m��e� b�t pro n�s d�le�it�. M��e� b�t jedn�m z n�s. Chodit po sv�t� a ���it Adanosovu v�li.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_09");	//T�mto ti ud�luji prsten Kruhu Vody. Pom��e ti naj�t spojence a starat se s nimi o rovnov�hu sv�ta.
		CreateInvItems(self,itri_ranger_addon,1);
		b_giveinvitems(self,other,itri_ranger_addon,1);
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_10");	//Jsem velmi pot�en t�m, �e jsi prvn�m m�gem Ohn�, kter� se k n�m p�idal.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_11");	//Nech� t� Adanos ochra�uje. Nyn� b� a setkej se sv�mi bratry.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_12");	//�ekaj� t� v hostinci U mrtv� harpyje na p�ijmac� ritu�l.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_13");	//P�edpoklad�m, �e ten hostince zn�. Proch�zi� kolem n�j po cest� na Onar�v statek.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_14");	//Nezapome� si nasadit prsten, tak mohou brat�i poznat, �e jsi jeden z nich.
		b_logentry(TOPIC_ADDON_RINGOFWATER,"Te� pat��m ke Kruhu Vody a m�m se setkat s na�i partou v hospod� u Mrtv� Harpyje.");
		SC_ISRANGER = TRUE;
		LARES_CANBRINGSCTOPLACES = TRUE;
		MIS_ADDON_LARES_COMETORANGERMEETING = LOG_RUNNING;
		b_giveplayerxp(XP_ADDON_SC_ISRANGER);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_15");	//Ne. Je�t� ne.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_16");	//Pak si posp�. Tv� zpr�va se zd� b�t velice d�le�itou!
	};
};


instance DIA_ADDON_VATRAS_CLOSEMEETING(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_closemeeting_condition;
	information = dia_addon_vatras_closemeeting_info;
	description = "Brat�i Kruhu m� poslali za tebou.";
};


func int dia_addon_vatras_closemeeting_condition()
{
	if(LARES_TAKEFIRSTMISSIONFROMVATRAS == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_closemeeting_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_CloseMeeting_15_00");	//Brat�i Kruhu m� poslali za tebou.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_01");	//Skv�le! U� jsem na tebe �ekal!
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_02");	//Po�lu t� skrze port�l s ostatn�mi m�gy Vody.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_03");	//P�jde� po stop� rudobarona Ravena a vyp�tr� pro� un�� ob�any Khorinisu.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_04");	//A my se pokus�me postarat o hrozbu, kterou sk�taj� bandit�.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_05");	//P�ines tuto zpr�vu Saturasovi. Od t�to chv�le bude� z�sk�vat �koly od n�j.
	if(MIS_ADDON_LARES_ORNAMENT2SATURAS != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_08");	//Lares t� tam zavede v p��pad�, �e je�t� nep�inesl zp�t ornament.
	};
	CreateInvItems(self,itwr_vatras2saturas_findraven,1);
	b_giveinvitems(self,other,itwr_vatras2saturas_findraven,1);
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_06");	//Nech� Adanos vede tvou cestu.
	b_logentry(TOPIC_ADDON_KDW,"Vatras m� poslal s dopisem za Saturasem. M�l bych te� j�t s ostatn�mi m�gy Vody skrze port�l a chytit b�val�ho rudobarona Ravena.");
	Log_CreateTopic(TOPIC_ADDON_SKLAVEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_SKLAVEN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_SKLAVEN,"M�m zjistit pro� Raven un�� ob�any Khorinisu.");
	RANGERMEETINGRUNNING = LOG_SUCCESS;
	b_schlussmitrangermeeting();
	b_giveplayerxp(XP_AMBIENT);
};



var int missingpeopleinfo[20];

instance DIA_ADDON_VATRAS_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_missingpeople_condition;
	information = dia_addon_vatras_missingpeople_info;
	permanent = TRUE;
	description = "O zmizel�ch lidech ...";
};


func int dia_addon_vatras_missingpeople_condition()
{
	if(MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE == LOG_RUNNING)
	{
		return TRUE;
	};
};


var int dia_addon_vatras_missingpeople_wo_noperm;

func void dia_addon_vatras_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_15_00");	//O zmizel�ch lidech ...
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_05_01");	//Ano?
	Info_ClearChoices(dia_addon_vatras_missingpeople);
	Info_AddChoice(dia_addon_vatras_missingpeople,DIALOG_BACK,dia_addon_vatras_missingpeople_back);
	if(SCKNOWSMISSINGPEOPLEAREINADDONWORLD == TRUE)
	{
		Info_AddChoice(dia_addon_vatras_missingpeople,"V�m kde jsou.",dia_addon_vatras_missingpeople_success);
	}
	else
	{
		Info_AddChoice(dia_addon_vatras_missingpeople,"Pov�m ti, co jsem doposud vyp�tral ...",dia_addon_vatras_missingpeople_report);
	};
	if(DIA_ADDON_VATRAS_MISSINGPEOPLE_WO_NOPERM == FALSE)
	{
		Info_AddChoice(dia_addon_vatras_missingpeople,"Kde bych m�l za��t hledat stopy?",dia_addon_vatras_missingpeople_wo);
	};
};

func void dia_addon_vatras_missingpeople_back()
{
	Info_ClearChoices(dia_addon_vatras_missingpeople);
};

func void dia_addon_vatras_missingpeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HintMissingPeople_Wo_15_00");	//Kde bych m�l za��t hledat stopy?
	AI_Output(self,other,"DIA_Addon_Vatras_HintMissingPeople_Wo_05_01");	//V�t�ina zmizela v p��stavu. To zn� jako dobr� m�sto pro za��tek.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Nejv�ce lid� zmizelo v khorinissk�m p��stavu. M�l bych za��t hledat tam.");
	dia_addon_vatras_missingpeople_wo_noperm = TRUE;
};

func void dia_addon_vatras_missingpeople_report()
{
	var int vatras_missingpeoplereports;
	var int xp_vatras_missingpeoplereports;
	vatras_missingpeoplereports = 0;
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_00");	//Pov�m ti, co jsem doposud na�el ...
	if(((MIS_AKIL_BRINGMISSPEOPLEBACK != 0) || (MIS_BENGAR_BRINGMISSPEOPLEBACK != 0)) && (MISSINGPEOPLEINFO[1] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_01");	//Farm��i tak� postr�daj� n�kolik lid�.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[1] = TRUE;
	};
	if(((ELVRICH_GOESBACK2THORBEN == TRUE) || (ELVRICH_SCKNOWSPIRATS == TRUE) || (SC_KNOWSDEXTERASKIDNAPPER == TRUE)) && (MISSINGPEOPLEINFO[2] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_02");	//Taky jsem se doslechl, �e jsou za to odpov�dn� bandit�.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[2] = TRUE;
	};
	if((ELVRICH_SCKNOWSPIRATS == TRUE) && (MISSINGPEOPLEINFO[3] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_03");	//Elvrich, u�e� mistra Thorbena, mi �ekl, �e bandit� odv�ej� zajat� lidi na mo�e.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[3] = TRUE;
	};
	if((ELVRICH_SCKNOWSPIRATS == TRUE) && (MISSINGPEOPLEINFO[4] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_04");	//Vypad� to, �e s t�m maj� n�co spole�n�ho tak� pir�ti. Ale nejsem si jejich rol� v tom v�em p��li� jist�.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[4] = TRUE;
	};
	if((ELVRICH_GOESBACK2THORBEN == TRUE) && (MISSINGPEOPLEINFO[5] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_05");	//Osvobodil jsem Elvricha ze zajet� bandit�.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[5] = TRUE;
	};
	if((SC_KNOWSLUCIACAUGHTBYBANDITS == TRUE) && (MISSINGPEOPLEINFO[6] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_06");	//D�vka jm�nem Lucia byla taky unesena bandity.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[6] = TRUE;
	};
	if((Npc_HasItems(other,itwr_luciasloveletter_addon) || (MIS_LUCIASLETTER == LOG_SUCCESS)) && (MISSINGPEOPLEINFO[7] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_07");	//Unesen� Lucia se vz�p�t� s bandity spol�ila.
		if(MIS_LUCIASLETTER == LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_08");	//Vypad� to, �e to ud�lala z vlastn�ho p�esv�d�en�.
		};
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[7] = TRUE;
	};
	if((SC_KNOWSDEXTERASKIDNAPPER == TRUE) && (MISSINGPEOPLEINFO[8] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_09");	//Dexter je v�dcem bandit�. Je odpov�dn� za ty �nosy.
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_10");	//Pamatuju si Dextera z kolonie. Pracoval tenkr�t pro rudobarona Gomeze.
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_11");	//A on si ur�it� bude pamatovat tebe. M�l by sis d�t pozor.
		vatras_missingpeoplereports = vatras_missingpeoplereports + 1;
		MISSINGPEOPLEINFO[8] = TRUE;
	};
	if(vatras_missingpeoplereports != 0)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_12");	//Mysl�m, �e jsi na dobr� cest�. Dr� se ji.
		xp_vatras_missingpeoplereports = XP_ADDON_VATRAS_MISSINGPEOPLEREPORT * vatras_missingpeoplereports;
		b_giveplayerxp(xp_vatras_missingpeoplereports);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_13");	//Co jsi zjistil?
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_14");	//Bohu�el, zat�m nic sm�rodatn�ho.
	};
};

func void dia_addon_vatras_missingpeople_success()
{
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_00");	//V�m, kde jsou zmizel� lid�.
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_01");	//Co jsi zjistil?
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_02");	//Byli uneseni a vzati na vzd�len� m�sto na ostrov� chl�pkem jm�nem Raven.
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_03");	//A pro� jsi si t�m tak jist�?
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_04");	//�etl jsem jeho rozkazy. Banditi v�ude okolo pracuj� pro n�j.
	if(Npc_HasItems(other,itwr_ravenskidnappermission_addon))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_05");	//Tady.
		b_usefakescroll();
	};
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_06");	//Dob�e. Dobr� pr�ce. U� jsem se b�l, �e nikdy nezjist�me pravdu.
	MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_VATRAS_WHEREAREMISSINGPEOPLE);
};


instance DIA_ADDON_VATRAS_FREE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_free_condition;
	information = dia_addon_vatras_free_info;
	permanent = FALSE;
	description = "Ztracen� lid� se vr�tili.";
};


func int dia_addon_vatras_free_condition()
{
	if(MISSINGPEOPLERETURNEDHOME == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_free_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Free_15_00");	//Ztracen� lid� se vr�tili.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_01");	//Ano, dok�zal jsi to. Nakonec to dob�e dopadlo.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_02");	//Av�ak, tv� cesta je�t� nekon��. Nech� ti Adanos po�ehn�.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_03");	//(modl� se) Adanosi, po�ehnej tomuto mu�i. Osvi� jeho pou�, dej mu s�lu obst�t v�em nebezpe��m.
	b_raiseattribute(other,ATR_MANA_MAX,3);
	other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
	other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
	Snd_Play("Levelup");
};


instance DIA_ADDON_VATRAS_WAFFEN(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_waffen_condition;
	information = dia_addon_vatras_waffen_info;
	permanent = TRUE;
	description = "O dodavateli zbran�.....";
};


func int dia_addon_vatras_waffen_condition()
{
	if(MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_waffen_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_15_00");	//O dodavateli zbran�.....
	Info_ClearChoices(dia_addon_vatras_waffen);
	Info_AddChoice(dia_addon_vatras_waffen,DIALOG_BACK,dia_addon_vatras_waffen_back);
	if((FERNANDO_IMKNAST == TRUE) || (FERNANDO_HATSZUGEGEBEN == TRUE))
	{
		Info_AddChoice(dia_addon_vatras_waffen,"Zn�m toho dodavatele zbran� pro bandity!",dia_addon_vatras_waffen_success);
	}
	else
	{
		Info_AddChoice(dia_addon_vatras_waffen,"Co v� o tom prodejci zbran�?",dia_addon_vatras_waffen_tomartin);
	};
};

func void dia_addon_vatras_waffen_back()
{
	Info_ClearChoices(dia_addon_vatras_waffen);
};

func void dia_addon_vatras_waffen_tomartin()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_ToMartin_15_00");	//Co v� o tom prodejci zbran�?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_01");	//Promluv si s Martinem, proviantmistrem paladin�. M��e m�t n�jak� informace.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_02");	//Obdr�el �kol odhalit toho dodavatele.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_03");	//Martina najde� v p��stavu. Pokud pob�� podel t�ch beden, z�sob a paladin�, m�l bys ho naj�t.
	VATRAS_TOMARTIN = TRUE;
};

func void dia_addon_vatras_waffen_success()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_00");	//Zn�m obchodn�ka, kter� dod�v� zbran� bandit�m!
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_01");	//Jmenuje se Fernando.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_02");	//Velmi dob�e. Postaral se Martin o to, aby u� Fernando nikdy nemohl prod�vat zbran�?
	if(FERNANDO_IMKNAST == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_03");	//Jo. Martin se postaral, aby moc brzo neopustil kobky �al��e.
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_04");	//Skv�l� pr�ce, synu.
		if(Npc_KnowsInfo(other,dia_addon_vatras_wannaberanger) && (SC_ISRANGER == FALSE))
		{
			AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_05");	//(sm�le) Znamen� to, �e jsem nyn� p�ipraven vstoupit do Kruhu Vody?
			AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_06");	//(usm�v) To nebylo p�esn� zn�n� na�i dohody - a ty to moc dob�e v�.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_07");	//Nech� Adanos osv�t� tvou cestu.
		MIS_VATRAS_FINDTHEBANDITTRADER = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_VATRAS_FINDTHEBANDITTRADER);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_CaughtFernando_15_09");	//Je�t� ne.
		AI_Output(self,other,"DIA_Addon_Vatras_CaughtFernando_05_10");	//Tak posp� a zprav ho o tom! Toto mus� b�t okam�it� zastaveno.
	};
};


instance DIA_ADDON_VATRAS_WISP(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_wisp_condition;
	information = dia_addon_vatras_wisp_info;
	description = "Je n�co, co by mi mohlo pomoct s hled�n�m?";
};


func int dia_addon_vatras_wisp_condition()
{
	if(MIS_VATRAS_FINDTHEBANDITTRADER != 0)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_wisp_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_WISP_15_00");	//Je n�co, co by mi mohlo pomoct s hled�n�m?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_01");	//Dost na tom trv� mlad� mu�i. Nicm�n�, m��e tu b�t n�co, co mo�n� tv�j �kol trochu zleh��.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_02");	//D�m ti tento amulet z rudy. Bude� ho ur�it� pot�ebovat.
	CreateInvItems(self,itam_addon_wispdetector,1);
	b_giveinvitems(self,other,itam_addon_wispdetector,1);
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_03");	//Je to amulet bludi�ky.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_04");	//Takov�ch je velmi m�lo. Bludi�ka v tomto amuletu m� zvl�tn� schopnosti.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_05");	//Pom�h� to zviditelnit v�ci, kter� pouh�m okem nespat��me.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_06");	//Funguje to, kdy� si to nasad�.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_07");	//Jestli�e bludi�ka zmiz�, jednodu�e si amulet nasa� znovu.
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Vatras mi dal 'Amulet Hledaj�c� bludi�ky'. M�l by mi pomoci v hled�n� dodavatele zbran�.");
	Log_CreateTopic(TOPIC_WISPDETECTOR,LOG_NOTE);
	b_logentry(TOPIC_WISPDETECTOR,LOGTEXT_ADDON_WISPLEARNED);
	b_logentry(TOPIC_WISPDETECTOR,LOGTEXT_ADDON_WISPLEARNED_NF);
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_08");	//Bludi�ka um� naj�t zbran�.
	if(MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_09");	//Tahle v�c se hod� na to patr�n� po dodavateli zbran� pro bandity.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_10");	//Zach�zej s t�m dob�e a m��e� se na to v�dy spolehnout.
	Info_ClearChoices(dia_addon_vatras_wisp);
	Info_AddChoice(dia_addon_vatras_wisp,"D�ky! Budu si to pamatovat.",dia_addon_vatras_wisp_thanks);
	Info_AddChoice(dia_addon_vatras_wisp,"Je to v�e co ta bludi�ka um�?",dia_addon_vatras_wisp_morewisp);
	Info_AddChoice(dia_addon_vatras_wisp,"V tom amuletu je bludi�ka?",dia_addon_vatras_wisp_amulett);
	SC_GOTWISP = TRUE;
};

func void dia_addon_vatras_wisp_thanks()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Thanks_15_00");	//D�ky! Budu si to pamatovat.
	Info_ClearChoices(dia_addon_vatras_wisp);
};

func void dia_addon_vatras_wisp_morewisp()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_MoreWISP_15_00");	//Je to v�e, co ta bludi�ka um�?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_01");	//V�c ne� hledan� zbran�? Jen pokud ji nau�� nov�m dovednostem.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_02");	//Pokud v�m, m� o t�chto v�cech velmi dobr� znalosti Riordian. Moment�ln� je ov�em se Saturasem.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_03");	//To je v�e, co m��u ��ct.
	if(MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		b_logentry(TOPIC_ADDON_BANDITTRADER,"Bludi�ka um� v�c ne� jen hledat zbran�. Riordian, m�g Vody, m��e u�it mou bludi�ku hledat dal�� v�ci.");
	};
};

func void dia_addon_vatras_wisp_amulett()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WISPDETECTOR_was_15_00");	//V tom amuletu je bludi�ka?
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_01");	//Bludi�ky jsou zaj�mav� stvo�en�. Skl�daj� se z �ist� magick� energie.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_02");	//Jsou v�z�ny k magick� rud� tohoto sv�ta. Je to p�irozen� zdroj jejich s�ly.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_03");	//Nep�ekvapuje m�, �e jsi o nich p�ed t�m nesly�el. Ukazuj� se pouze t�m, co u sebe maj� odpov�daj�c� mno�stv� rudy.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_04");	//Divok� bludi�ky byly n�siln� odstran�ny z jejich p�irozen�ho zdroje a tak �to�� na ka�d� stvo�en�, kter� se p�ibl��.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_05");	//T�mto neboh�m stvo�en�m ji� nen� pomoci.  M�l by ses pokusit se jim vyh�bat.
};


instance DIA_ADDON_VATRAS_STONEPLATE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_stoneplate_condition;
	information = dia_addon_vatras_stoneplate_info;
	description = "Na�el jsem tuhle kamennou desku...";
};


func int dia_addon_vatras_stoneplate_condition()
{
	if((c_schasmagicstoneplate() == TRUE) && (Npc_HasItems(other,itwr_stoneplatecommon_addon) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_stoneplate_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Stoneplate_15_00");	//Na�el jsem tuhle kamennou desku. M��e� mi o ni n�co ��ct?
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_01");	//Je to artefakt starobyl� kultury, po kter� p�tr�me pr�v� te�.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_02");	//Jsou jich r�zn� druhy. N�kter� obsahuj� informace o historii n�roda.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_03");	//A to jsou ty, jen� m� zaj�maj�. P�ines v�echny, kter� najde� ke mn�.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_04");	//Bude� odm�n�n.
	Log_CreateTopic(TOPIC_ADDON_STONEPLATES,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_STONEPLATES,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_STONEPLATES,LOGTEXT_ADDON_VATRASTRADE);
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,LOGTEXT_ADDON_VATRASTRADE);
};


instance DIA_ADDON_VATRAS_SELLSTONPLATE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_sellstonplate_condition;
	information = dia_addon_vatras_sellstonplate_info;
	permanent = TRUE;
	description = "M�m pro tebe dal�� kamenn� desky ...";
};


func int dia_addon_vatras_sellstonplate_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_vatras_stoneplate) && (Npc_HasItems(other,itwr_stoneplatecommon_addon) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_sellstonplate_info()
{
	var int anzahl;
	anzahl = Npc_HasItems(other,itwr_stoneplatecommon_addon);
	if(anzahl == 1)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_SellStonplate_15_00");	//M�m pro tebe dal�� kamenn� desky ...
	}
	else
	{
	};
	b_giveinvitems(other,self,itwr_stoneplatecommon_addon,anzahl);
	AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_01");	//V�born�!
	if(anzahl >= 10)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_02");	//Zv���m tvou magickou s�lu!
		b_raiseattribute(other,ATR_MANA_MAX,anzahl);
		Npc_ChangeAttribute(other,ATR_MANA,anzahl);
	}
	else if(anzahl >= 5)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_04");	//Tady, vem si za odm�nu n�jak� svitky ...
		b_giveinvitems(self,other,itsc_instantfireball,anzahl);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_03");	//Tady, vem si za odm�nu n�jak� lektvary ...
		b_giveinvitems(self,other,itpo_health_03,anzahl + 1);
	};
	b_giveplayerxp(XP_ADDON_VATRASSTONPLATE * anzahl);
};


var int vatras_senttodaron;

instance DIA_ADDON_VATRAS_GUILDHELP(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_guildhelp_condition;
	information = dia_addon_vatras_guildhelp_info;
	description = "Lares ��kal, �e mi m��e� pomoci dostat se do kl�tera m�g� Ohn�.";
};


func int dia_addon_vatras_guildhelp_condition()
{
	if(RANGERHELP_GILDEKDF == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_guildhelp_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_00");	//Lares ��kal, �e mi m��e� pomoct dostat se do kl�tera m�g� Ohn�.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_01");	//To je t� volba? Cesta Ohn�?
	AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_02");	//Jo, hodl�m se st�t m�gem Ohn�.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_03");	//Pokud si dob�e pamatuji, nep�estali p��jm�t novice. Pro� chce� tedy mou pomoc?
	if(SC_KNOWSKLOSTERTRIBUT == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_04");	//Novic p�ed kl�terem po mn� chce da�. Ovci a zlato.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_05");	//Lares se zm�nil o dani na zaplacen� ke vstupu do kl�tera.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_06");	//No, nemohu ti p��mo pomoci, proto�e jsem m�gem Vody, jak v�. Ale zn�m velmi dob�e m�ga Ohn� Darona.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_07");	//Je obvykle bl�zko tr�i�t� a vyb�r� dary.
	VATRAS_SENTTODARON = TRUE;
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_08");	//A�koliv to nen� jedin� v�c, o kterou se tady star�.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_09");	//Jednou mi ��kal o so�ce, kterou mu ukradli.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_10");	//Je to pro n�j velmi d�le�it�. Jsem si jist, �e ti pom��e, pokud z�sk� jeho so�ku zp�t.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_11");	//Samoz�ejm�, tv� p�ijet� k m�g�m Ohn� neznamen�, �e se nem��e� p�ipojit ke Kruhu.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_12");	//Pokud si to prokazateln� zaslou��.
	MIS_ADDON_VATRAS_GO2DARON = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_RANGERHELPKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPKDF,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RANGERHELPKDF,"M�g Ohn� Daron na tr�i�ti pot�ebuje pomoci s malou vz�cnou so�kou. M��e mi pomoci dostat se rychle do kl�tera.");
};


instance DIA_VATRAS_MORE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 998;
	condition = dia_vatras_more_condition;
	information = dia_vatras_more_info;
	permanent = TRUE;
	description = "(V�ce)";
};


func int dia_vatras_more_condition()
{
	if(VATRAS_MORE == FALSE)
	{
		return TRUE;
	};
};

func void dia_vatras_more_info()
{
	VATRAS_MORE = TRUE;
};


instance DIA_VATRAS_INFLUENCE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 92;
	condition = dia_vatras_influence_condition;
	information = dia_vatras_influence_info;
	permanent = FALSE;
	description = "Dej mi pros�m sv� po�ehn�n�.";
};


func int dia_vatras_influence_condition()
{
	if((MIS_THORBEN_GETBLESSINGS == LOG_RUNNING) && (PLAYER_ISAPPRENTICE == APP_NONE) && (VATRAS_MORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_influence_info()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_00");	//Dej mi pros�m sv� po�ehn�n�.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_01");	//A pro� bych ti m�l po�ehnat, cizin�e?
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_02");	//Chci se st�t u�edn�kem u jednoho z mistr� v doln� ��sti m�sta.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_11");	//Jdi s Adanov�m po�ehn�n�m, synu!
	Snd_Play("LevelUp");
	b_giveplayerxp(XP_VATRASTRUTH);
	VATRAS_SEGEN = TRUE;
	b_logentry(TOPIC_THORBEN,"M�g vody Vatras mi po�ehnal.");
};


instance DIA_VATRAS_WOKDF(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 93;
	condition = dia_vatras_wokdf_condition;
	information = dia_vatras_wokdf_info;
	permanent = FALSE;
	description = "Kde bych na�el Innosova kn�ze?";
};


func int dia_vatras_wokdf_condition()
{
	if((MIS_THORBEN_GETBLESSINGS == LOG_RUNNING) && (VATRAS_SEGEN == TRUE) && (VATRAS_SENTTODARON == FALSE) && (VATRAS_MORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_wokdf_info()
{
	AI_Output(other,self,"DIA_Vatras_WoKdF_15_00");	//Kde bych na�el Innosova kn�ze?
	AI_Output(self,other,"DIA_Vatras_WoKdF_05_01");	//Nejl�pe bude, kdy� se rozhl�dne� po tr�i�ti. Tam na n�koho z kl�tera jist� naraz�.
};


instance DIA_VATRAS_SPENDE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 94;
	condition = dia_vatras_spende_condition;
	information = dia_vatras_spende_info;
	permanent = TRUE;
	description = "R�d bych Adanovi poskytl dar!";
};


func int dia_vatras_spende_condition()
{
	if(VATRAS_MORE == TRUE)
	{
		return TRUE;
	};
};

func void dia_vatras_spende_info()
{
	AI_Output(other,self,"DIA_Vatras_Spende_15_00");	//R�d bych Adanovi poskytl dar!
	AI_Output(self,other,"DIA_Vatras_Spende_05_01");	//Darem Adanovu chr�mu smyje� ��st h��ch�, kter� jsi mo�n� sp�chal, synu.
	AI_Output(self,other,"DIA_Vatras_Spende_05_02");	//Kolik m��e� v�novat?
	Info_ClearChoices(dia_vatras_spende);
	Info_AddChoice(dia_vatras_spende,"Zrovna te� nem�m pen�z nazbyt...",dia_vatras_spende_back);
	if(Npc_HasItems(other,itmi_gold) >= 50)
	{
		Info_AddChoice(dia_vatras_spende,"M�m u sebe 50 zla��k�...",dia_vatras_spende_50);
	};
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice(dia_vatras_spende,"M�m u sebe 100 zla��k�...",dia_vatras_spende_100);
	};
};

func void dia_vatras_spende_back()
{
	AI_Output(other,self,"DIA_Vatras_Spende_BACK_15_00");	//Zrovna te� nem�m pen�z nazbyt.
	AI_Output(self,other,"DIA_Vatras_Spende_BACK_05_01");	//To nevad�, sv� dobr� �mysly m��e� vyj�d�it pozd�ji, synu.
	Info_ClearChoices(dia_vatras_spende);
};

func void dia_vatras_spende_50()
{
	AI_Output(other,self,"DIA_Vatras_Spende_50_15_00");	//M�m u sebe 50 zla��k�.
	AI_Output(self,other,"DIA_Vatras_Spende_50_05_01");	//D�kuji ti ve jm�nu Adana, synu. Tv� zlato bude rozd�leno mezi pot�ebn�.
	b_giveinvitems(other,self,itmi_gold,50);
	Info_ClearChoices(dia_vatras_spende);
};

func void dia_vatras_spende_100()
{
	AI_Output(other,self,"DIA_Vatras_Spende_100_15_00");	//M�m u sebe 100 zla��k�.
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_01");	//Za tento �lechetn� �in ti ve jm�nu Adana �ehn�m!
	Snd_Play("LevelUp");
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_02");	//Nech� ti Adanos na tv� cest� po�ehn�!
	b_giveinvitems(other,self,itmi_gold,100);
	VATRAS_SEGEN = TRUE;
	Info_ClearChoices(dia_vatras_spende);
	if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
	{
		b_logentry(TOPIC_THORBEN,"M�g vody Vatras mi po�ehnal.");
	};
};


instance DIA_VATRAS_CANTEACH(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 95;
	condition = dia_vatras_canteach_condition;
	information = dia_vatras_canteach_info;
	permanent = FALSE;
	description = "M��e� m� nau�it n�co o magii?";
};


func int dia_vatras_canteach_condition()
{
	if(VATRAS_MORE == TRUE)
	{
		return TRUE;
	};
};

func void dia_vatras_canteach_info()
{
	AI_Output(other,self,"DIA_Vatras_CanTeach_15_00");	//M��e� m� nau�it n�co o magii?
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_01");	//Pouze vyvolen�m Innose nebo Adana je dovoleno pou��vat runovou magii.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_02");	//Ale oby�ejn� smrteln�ci mohou pou��vat magii za pomoci kouzeln�ch svitk�.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_03");	//Mohu ti uk�zat, jak lze z�skat a roz�i�ovat magick� schopnosti.
	VATRAS_TEACHMANA = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"M�g vody Vatras mi pom��e zv��it magickou moc.");
};


instance DIA_VATRAS_TEACH(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 100;
	condition = dia_vatras_teach_condition;
	information = dia_vatras_teach_info;
	permanent = TRUE;
	description = "Cht�l bych pos�lit svoji magickou moc.";
};


func int dia_vatras_teach_condition()
{
	if((VATRAS_TEACHMANA == TRUE) && (VATRAS_MORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_teach_info()
{
	AI_Output(other,self,"DIA_Vatras_Teach_15_00");	//Cht�l bych pos�lit svoji magickou moc.
	Info_ClearChoices(dia_vatras_teach);
	Info_AddChoice(dia_vatras_teach,DIALOG_BACK,dia_vatras_teach_back);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_vatras_teach_1);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_vatras_teach_5);
};

func void dia_vatras_teach_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self,other,"DIA_Vatras_Teach_05_00");	//Tv� magick� moc p�es�hla m� schopnosti.
	};
	Info_ClearChoices(dia_vatras_teach);
};

func void dia_vatras_teach_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_HIGH);
	Info_ClearChoices(dia_vatras_teach);
	Info_AddChoice(dia_vatras_teach,DIALOG_BACK,dia_vatras_teach_back);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_vatras_teach_1);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_vatras_teach_5);
};

func void dia_vatras_teach_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_HIGH);
	Info_ClearChoices(dia_vatras_teach);
	Info_AddChoice(dia_vatras_teach,DIALOG_BACK,dia_vatras_teach_back);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_vatras_teach_1);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_vatras_teach_5);
};


instance DIA_VATRAS_GODS(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 98;
	condition = dia_vatras_gods_condition;
	information = dia_vatras_gods_info;
	permanent = TRUE;
	description = "�ekni mi n�co o boz�ch.";
};


func int dia_vatras_gods_condition()
{
	if(VATRAS_MORE == TRUE)
	{
		return TRUE;
	};
};

func void dia_vatras_gods_info()
{
	AI_Output(other,self,"DIA_Vatras_GODS_15_00");	//�ekni mi n�co o boz�ch.
	AI_Output(self,other,"DIA_Vatras_GODS_05_01");	//Co p�esn� bys cht�l v�d�t?
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"�ekni mi n�co o Innosovi.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"�ekni mi n�co o Adanovi.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"�ekni mi n�co o Beliarovi.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_back()
{
	Info_ClearChoices(dia_vatras_gods);
};

func void dia_vatras_gods_innos()
{
	AI_Output(other,self,"DIA_Vatras_GODS_INNOS_15_00");	//�ekni mi n�co o Innosovi.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_01");	//Velmi dob�e. (k�e) Innos je prvn�m a nejvy���m bohem. Stvo�il slunce a sv�t.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_02");	//Ovl�d� sv�tlo a ohe�, sv� dary lidstvu. Je zt�lesn�n�m ��du a spravedlnosti.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_03");	//Jeho kn�� jsou ohniv� m�gov�, paladinov� jsou jeho v�le�n�ky.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"�ekni mi n�co o Innosovi.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"�ekni mi n�co o Adanovi.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"�ekni mi n�co o Beliarovi.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_adanos()
{
	AI_Output(other,self,"DIA_Vatras_GODS_ADANOS_15_00");	//�ekni mi n�co o Adanovi.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_01");	//Adanos je b�h st�edu. Vymezuje pr�vo a je str�cem rovnov�hy mezi Innosem a Beliarem.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_02");	//Ovl�d� s�lu p�em�n, jeho darem je voda v�ech oce�n�, jezer a �ek.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_03");	//Jeho kn�� jsou vodn� m�gov�, stejn� jako j� jsem slu�ebn�kem a kn�zem Adanov�m.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"�ekni mi n�co o Innosovi.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"�ekni mi n�co o Adanovi.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"�ekni mi n�co o Beliarovi.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_beliar()
{
	AI_Output(other,self,"DIA_Vatras_GODS_BELIAR_15_00");	//�ekni mi n�co o Beliarovi.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_01");	//Beliar je temn� b�h smrti, zk�zy a v�ech nep�irozen�ch v�c�.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_02");	//Vede v��nou v�lku s Innosem, ale Adanos bd� nad t�m, aby byly jejich s�ly st�le vyrovnan�.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_03");	//Pouze n�kolik m�lo lid� n�sleduje vol�n� Beliara - nicm�n� on t�m, kdo tak �in�, zajist� velkou moc.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"�ekni mi n�co o Innosovi.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"�ekni mi n�co o Adanovi.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"�ekni mi n�co o Beliarovi.",dia_vatras_gods_beliar);
};


instance DIA_VATRAS_HEAL(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 99;
	condition = dia_vatras_heal_condition;
	information = dia_vatras_heal_info;
	permanent = TRUE;
	description = "M��e� m� vyl��it?";
};


func int dia_vatras_heal_condition()
{
	if(VATRAS_MORE == TRUE)
	{
		return TRUE;
	};
};

func void dia_vatras_heal_info()
{
	AI_Output(other,self,"DIA_Vatras_HEAL_15_00");	//M��e� m� vyl��it?
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_01");	//(zbo�n�) Adane po�ehnej tomuto t�lu. Zbav ho jeho zran�n� a posil ho nov�m �ivotem.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FULLYHEALED,-1,-1,FONT_SCREEN,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_02");	//Pr�v� te� nepot�ebuje� ��dn� magick� l��en�.
	};
};


instance DIA_VATRAS_MISSION(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_vatras_mission_condition;
	information = dia_vatras_mission_info;
	important = TRUE;
};


func int dia_vatras_mission_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_vatras_mission_info()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_10");	//M�m zpr�vu pro mistra Isgarotha. St�e�� svatyni p�ed kl�terem.
	AI_Output(self,other,"DIA_Vatras_MISSION_05_01");	//Kdy� mu ji doru��, z�sk� odm�nu podle vlastn�ho v�b�ru.
	Info_ClearChoices(dia_vatras_mission);
	Info_AddChoice(dia_vatras_mission,"Najdi si jin�ho posl��ka, starochu!",dia_vatras_mission_no);
	Info_AddChoice(dia_vatras_mission,"Ud�l�m to.",dia_vatras_mission_yes);
};

func void b_sayvatrasgo()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_13");	//Dob�e. Tak te� pokra�uj ve sv� cest� k mistru Isgarothovi.
};

func void dia_vatras_mission_yes()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_YES_15_00");	//Ud�l�m to.
	AI_Output(self,other,"DIA_Vatras_Add_05_11");	//Dobr�, tak si vezmi tu zpr�vu a vyber si jeden z t�chto kouzeln�ch svitk�.
	AI_Output(self,other,"DIA_Vatras_Add_05_12");	//A� doru�� tu zpr�vu, �ek� t� n�le�it� odm�na.
	b_giveinvitems(self,hero,itwr_vatrasmessage,1);
	MIS_VATRAS_MESSAGE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BOTSCHAFT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BOTSCHAFT,LOG_RUNNING);
	b_logentry(TOPIC_BOTSCHAFT,"Vatras mi p�edal zpr�vu pro mistra Isgarota, kter�ho najdu ve svatyni naproti kl�teru.");
	Info_ClearChoices(dia_vatras_mission);
	Info_AddChoice(dia_vatras_mission,"Vezmu si kouzlo Sv�tla.",dia_vatras_mission_light);
	Info_AddChoice(dia_vatras_mission,"Vybral jsem si l��iv� svitek.",dia_vatras_mission_heal);
	Info_AddChoice(dia_vatras_mission,"Dej mi Ledov� ��p.",dia_vatras_mission_ice);
};

func void dia_vatras_mission_no()
{
	AI_Output(other,self,"DIA_ADDON_Vatras_MISSION_NO_15_00");	//Te� ne!
	AI_Output(self,other,"DIA_ADDON_Vatras_MISSION_NO_05_01");	//��dn� probl�m. Po�lu n�koho jin�ho.
	MIS_VATRAS_MESSAGE = LOG_OBSOLETE;
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_heal()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_HEAL_15_00");	//Vybral jsem si l��iv� svitek.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,itsc_lightheal,1);
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_ice()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_ICE_15_00");	//Dej mi Ledov� ��p.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,itsc_icebolt,1);
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_light()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_LIGHT_15_00");	//Vezmu si kouzlo Sv�tla.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,itsc_light,1);
	Info_ClearChoices(dia_vatras_mission);
};


instance DIA_VATRAS_MESSAGE_SUCCESS(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_vatras_message_success_condition;
	information = dia_vatras_message_success_info;
	description = "Doru�il jsem tvou zpr�vu.";
};


func int dia_vatras_message_success_condition()
{
	if((MIS_VATRAS_MESSAGE == LOG_RUNNING) && (VATRAS_RETURN == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_message_success_info()
{
	AI_Output(other,self,"DIA_Vatras_MESSAGE_SUCCESS_15_00");	//Doru�il jsem tvou zpr�vu.
	AI_Output(self,other,"DIA_Vatras_Add_05_14");	//P�ijmi m� d�ky. A te� si vezmi svou odm�nu.
	MIS_VATRAS_MESSAGE = LOG_SUCCESS;
	b_giveplayerxp(XP_VATRAS_MESSAGE);
	Info_ClearChoices(dia_vatras_message_success);
	Info_AddChoice(dia_vatras_message_success,"1 kr�lovsk� ��ov�k",dia_vatras_message_success_plant);
	Info_AddChoice(dia_vatras_message_success,"Prsten obratnosti.",dia_vatras_message_success_ring);
	Info_AddChoice(dia_vatras_message_success,"1 hrudka rudy",dia_vatras_message_success_ore);
};

func void dia_vatras_message_success_plant()
{
	b_giveinvitems(self,hero,itpl_perm_herb,1);
	Info_ClearChoices(dia_vatras_message_success);
};

func void dia_vatras_message_success_ring()
{
	b_giveinvitems(self,hero,itri_dex_01,1);
	Info_ClearChoices(dia_vatras_message_success);
};

func void dia_vatras_message_success_ore()
{
	b_giveinvitems(self,hero,itmi_nugget,1);
	Info_ClearChoices(dia_vatras_message_success);
};


const int KURZ = 0;
const int LANG = 1;
var int vatras_einmallangweg;

func void b_vatras_geheweg(var int dauer)
{
	if(VATRAS_EINMALLANGWEG == TRUE)
	{
		return;
	};
	if((Npc_GetDistToWP(self,"NW_CITY_MERCHANT_TEMPLE_FRONT") <= 500) && Npc_WasInState(self,zs_preach_vatras))
	{
		b_stoplookat(self);
		AI_AlignToWP(self);
		AI_Output(self,other,"DIA_Vatras_Add_05_06");	//Sly�te, lid�! Je m� pot�eba n�kde jinde.
		if(dauer == KURZ)
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_07");	//Nebude to m�t dlouh�ho trv�n�. A� se vr�t�m, dopov�m v�m zbytek p��b�hu.
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_08");	//Nev�m, jestli se je�t� vr�t�m. Pokud chcete zn�t konec, p�e�t�te si ten p��b�h v P�smu.
			VATRAS_EINMALLANGWEG = TRUE;
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_09");	//Adanos s v�mi!
		b_turntonpc(self,other);
	};
	VATRAS_SCHICKELEUTEWEG = TRUE;
};


instance DIA_ADDON_VATRAS_ABLOESEPRE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_abloesepre_condition;
	information = dia_addon_vatras_abloesepre_info;
	description = "M�m probl�m s Innosov�m Okem.";
};


func int dia_addon_vatras_abloesepre_condition()
{
	if((Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)) && (KAPITEL == 3) && (VATRASCANLEAVETOWN_KAP3 == FALSE) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_abloesepre_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AbloesePre_15_00");	//M�m probl�m s Innosov�m okem. Pot�ebuju tvoji podporu.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_01");	//Budu kv�li tomu muset opustit m�sto?
	AI_Output(other,self,"DIA_Addon_Vatras_AbloesePre_15_02");	//To nev�m. Mo�n�.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_03");	//�ek�m na svou n�hradu u� p�r dn�. Ostatn� m�gov� Vody by se u� m�li vr�tit.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_04");	//Ujisti se, �e po�lou n�hradn�ka a j� ti pomohu.
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	Log_CreateTopic(TOPIC_ADDON_VATRASABLOESUNG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_VATRASABLOESUNG,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_VATRASABLOESUNG,"Vatras mi nem��e pomoci s probl�mem 'Innosova Oka' dokud ve m�st� nebude jin� m�g Vody, kter� ho zastoup�.");
};


instance DIA_ADDON_VATRAS_ADDONSOLVED(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_addonsolved_condition;
	information = dia_addon_vatras_addonsolved_info;
	description = "N�hrada dorazila.";
};


func int dia_addon_vatras_addonsolved_condition()
{
	if(RAVENISDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_addonsolved_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AddonSolved_15_00");	//N�hrada dorazila.
	AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_01");	//Je v�e v po��dku za severo-v�chodn�mi horami?
	AI_Output(other,self,"DIA_Addon_Vatras_AddonSolved_15_02");	//Ano. Raven je mrtv� a u� nep�edstavuje ��dnou hrozbu.
	AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_03");	//To je vskutku dobr� zpr�va. Doufejme, �e podobn� v�ci se u� nikdy nestanou.
	if(Npc_KnowsInfo(other,dia_addon_vatras_abloesepre))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_04");	//TE� ti mohu pomoci s tv�m mal�m probl�mem.
		AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_05");	//Pokud si dob�e pamatuji, t�kalo se to Innosova Oka �e?
	};
	VATRASCANLEAVETOWN_KAP3 = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_VATRAS_INNOSEYEKAPUTT(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_vatras_innoseyekaputt_condition;
	information = dia_vatras_innoseyekaputt_info;
	description = "Innosovo oko je rozbit�.";
};


func int dia_vatras_innoseyekaputt_condition()
{
	if((Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)) && (KAPITEL == 3) && (VATRASCANLEAVETOWN_KAP3 == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_innoseyekaputt_info()
{
	if(MIS_PYROKAR_GOTOVATRASINNOSEYE == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_00");	//Pos�l� m� Pyrokar.
	}
	else if(MIS_XARDAS_GOTOVATRASINNOSEYE == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_01");	//Pos�l� m� Xardas.
	};
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_02");	//Innosovo oko je rozbit�.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_03");	//J� v�m. Sly�el jsem o tom od n�jak�ch velmi rozru�en�ch novic�.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_04");	//P�tra�i zneu�ili Kruh slunce m�g� Ohn� ke zni�en� Oka.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_05");	//�ekl bych, �e jsou ovl�d�ni nep��telem.
	Info_ClearChoices(dia_vatras_innoseyekaputt);
	Info_AddChoice(dia_vatras_innoseyekaputt,"Po tomhle m�st� se novinky ���� rychle.",dia_vatras_innoseyekaputt_schnellenachrichten);
	if((hero.guild == GIL_KDF) && (MIS_PYROKAR_GOTOVATRASINNOSEYE == LOG_RUNNING))
	{
		Info_AddChoice(dia_vatras_innoseyekaputt,"Pro� si Pyrokar ze v�ech lid� vybral pr�v� tebe?",dia_vatras_innoseyekaputt_warumdu);
	};
	Info_AddChoice(dia_vatras_innoseyekaputt,"Co se stane s Okem te�?",dia_vatras_innoseyekaputt_auge);
};

func void dia_vatras_innoseyekaputt_auge()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00");	//Co se stane s Okem te�?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01");	//Mus�me ho znovu spravit. Ale boj�m se, �e to nebude jen tak.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02");	//Obj�mka se rozbila na dva kusy. Zru�n� kov�� by si s t�m m�l um�t poradit.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03");	//Ale tohle nen� ten probl�m. Co mi d�l� starosti, je samotn� drahokam.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04");	//Je matn� a bez moci. Zd� se, �e nep��tel p�esn� v�d�l, jak ho oslabit.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Kde bych na�el kov��e, kter� by to dok�zal opravit?",dia_vatras_innoseyekaputt_auge_schmied);
	Info_AddChoice(dia_vatras_innoseyekaputt,"Jak m��e drahokam z�skat zp�t svoji s�lu?",dia_vatras_innoseyekaputt_auge_stein);
};

func void dia_vatras_innoseyekaputt_auge_stein()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00");	//Jak m��e drahokam z�skat zp�t svoji s�lu?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01");	//Vid�m jen jedinou cestu. Spojen� t�� vl�dnouc�ch boh� by mohlo zajistit pot�ebn� efekt.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02");	//Dob�e p�ipraven� ritu�l zvratu proveden� na m�st� zni�en� vr�t� drahokamu jeho s�lu.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03");	//Nicm�n�, probl�m je, �e na to m�sto mus� dostat pozemsk� z�stupce ka�d�ho ze t�� boh�.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04");	//Nav�c je pot�eba mnoho tr�vy z ba�in. Odhaduju, �e to budou nejm�n� t�i st�bla.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Kdo by m�li b�t ti t�i pozem�t� z�stupci boh�?",dia_vatras_innoseyekaputt_auge_stein_wer);
	Info_AddChoice(dia_vatras_innoseyekaputt,"Kde najdu tu tr�vu z ba�in?",dia_vatras_innoseyekaputt_auge_stein_kraut);
};

func void dia_vatras_innoseyekaputt_auge_stein_kraut()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00");	//Kde najdu tu tr�vu z ba�in?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01");	//Sly�el jsem o star� masti�k��ce v les�ch, co si ��k� Sagitta. Mohla by ti ty rostliny prodat.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02");	//Ale taky bys mohl zkusit �t�st� dole v p��stavu.
};

func void dia_vatras_innoseyekaputt_auge_stein_wer()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00");	//Kdo by m�li b�t ti t�i pozem�t� z�stupci boh�?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01");	//Adana bych m�l zastupovat j� s�m.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02");	//Pyrokar, nejvy��� ohniv� m�g, bude ten prav� p�edstavitel boha Innose.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03");	//Ale pro Beliara nev�m, koho vybrat. Mus� to b�t n�kdo, kdo ovl�d� �ernou magii.
	Info_AddChoice(dia_vatras_innoseyekaputt,"�ernou magii? Co Xardas?",dia_vatras_innoseyekaputt_auge_stein_wer_xardas);
};

func void dia_vatras_innoseyekaputt_auge_stein_wer_xardas()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00");	//�ernou magii? Co Xardas?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01");	//To je ono. To by mohlo fungovat.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02");	//Ale pt�m se s�m sebe, jak ty t�i dostat k sob�.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03");	//Dok�u si p�edstavit, jak se Pyrokar bude tv��it, a� se dozv�, �e mus� spolupracovat s Xardasem.
	Info_AddChoice(dia_vatras_innoseyekaputt,"U� mus�m j�t.",dia_vatras_innoseyekaputt_auge_stein_wer_xardas_weiter);
};

func void dia_vatras_innoseyekaputt_auge_schmied()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00");	//Kde najdu kov��e schopn�ho opravit obj�mku Oka?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01");	//Poptej se tady po okol� po n�kom, kdo um� opravit �perk.
};

func void dia_vatras_innoseyekaputt_warumdu()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00");	//Pro� si Pyrokar ze v�ech lid� vybral pr�v� tebe?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01");	//M�l jsem podez�en�, �e se d��ve �i pozd�ji n�co podobn�ho p�ihod�.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02");	//Pyrokar se v�dycky pova�oval za tak nezraniteln�ho a mocn�ho, �e to skoro hrani�ilo s nerozv�nost�.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03");	//Proto byla jeho opat�en� na ochranu Oka tak� tak... ehm, lajd�ck�.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04");	//Prost� si mysl�m, �e mimovoln� spol�hal na schopnosti, je� mi Adanos prop�j�il.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05");	//Rad�ji ani nemysl�m na to, co by se mohlo st�t, kdybych te� nebyl k dispozici.
};

func void dia_vatras_innoseyekaputt_schnellenachrichten()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00");	//Po tomhle m�st� se novinky ���� rychle.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01");	//Taky dob�e. Nep��tel se stejn� bude m�t na pozoru.
};

func void dia_vatras_innoseyekaputt_auge_stein_wer_xardas_weiter()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00");	//U� mus�m j�t.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01");	//Mus�m vyrazit a p�ipravit v Kruhu slunce ten ritu�l.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02");	//Po�li tam Xardase a Pyrokara. A nezapome� p�in�st tr�vu z ba�in. Spol�h�m na tebe.
	b_logentry(TOPIC_INNOSEYE,"Podle Vatrase mohu Oku navr�tit moc pouze tak, �e vykon�m ritu�l v kruhu Slunce. Mus�m ov�em p�im�t Xardase a Pyrokara, aby se ho tak� z��astnili, a z�rove� naj�t kov��e, kter� dok�e rozbit� amulet opravit.");
	MIS_RITUALINNOSEYEREPAIR = LOG_RUNNING;
	Info_ClearChoices(dia_vatras_innoseyekaputt);
	Npc_ExchangeRoutine(self,"RITUALINNOSEYEREPAIR");
	b_vatras_geheweg(KURZ);
	dmt_1201.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1202.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1203.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1204.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1205.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1206.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1207.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1208.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1209.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1210.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1211.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_startotherroutine(dmt_1201,"AfterRitual");
	b_startotherroutine(dmt_1202,"AfterRitual");
	b_startotherroutine(dmt_1203,"AfterRitual");
	b_startotherroutine(dmt_1204,"AfterRitual");
	b_startotherroutine(dmt_1205,"AfterRitual");
	b_startotherroutine(dmt_1206,"AfterRitual");
	b_startotherroutine(dmt_1207,"AfterRitual");
	b_startotherroutine(dmt_1208,"AfterRitual");
	b_startotherroutine(dmt_1209,"AfterRitual");
	b_startotherroutine(dmt_1210,"AfterRitual");
	b_startotherroutine(dmt_1211,"AfterRitual");
};


instance DIA_VATRAS_RITUALINNOSEYEREPAIR(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 33;
	condition = dia_vatras_ritualinnoseyerepair_condition;
	information = dia_vatras_ritualinnoseyerepair_info;
	permanent = TRUE;
	description = "Jak se to m� s Innosov�m okem?";
};


func int dia_vatras_ritualinnoseyerepair_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_vatras_ritualinnoseyerepair_info()
{
	AI_Output(other,self,"DIA_Vatras_RitualInnosEyeRepair_15_00");	//Jak se to m� s Innosov�m okem?
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_01");	//Pamatuj: jedin� ritu�l zvratu v Kruhu slunce spole�n� s Xardasem a Pyrokarem m��e Oku navr�tit s�lu.
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_02");	//A nezapome� p�in�st Oko s opravenou obj�mkou.
};


instance DIA_VATRAS_BEGINN(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 31;
	condition = dia_vatras_beginn_condition;
	information = dia_vatras_beginn_info;
	description = "Ud�lal jsem v�e, co jsi �ekl. Tady je opraven� Oko.";
};


func int dia_vatras_beginn_condition()
{
	if((KAPITEL == 3) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(xardas,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(pyrokar,"NW_TROLLAREA_RITUAL_02") < 2000) && Npc_HasItems(other,itmi_innoseye_broken_mis) && (MIS_BENNET_INNOSEYEREPAIREDSETTING == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_vatras_beginn_info()
{
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_00");	//Ud�lal jsem v�e, co jsi �ekl. Tady je opraven� Oko.
	b_giveplayerxp(XP_RITUALINNOSEYERUNS);
	b_giveinvitems(other,self,itmi_innoseye_broken_mis,1);
	Npc_RemoveInvItem(self,itmi_innoseye_broken_mis);
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_01");	//Te� u� nic nebr�n� proveden� ritu�lu.
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_02");	//A co tr�va z ba�in?
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_03");	//�, ano. Tak m� ty t�i rostlinky?
	if(b_giveinvitems(other,self,itpl_swampherb,3))
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_04");	//Ahem. Ano. Tady jsou ty t�i rostlinky.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_05");	//V�born�.
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_06");	//Ne. Bohu�el ne.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_07");	//Dobr�. Tak to budeme muset ud�lat bez nich.
	};
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_08");	//Ud�lals to dob�e, ale te� se postav kousek stranou, a� m��eme za��t s ritu�lem. Nech� se na�e du�e spoj�.
	Info_ClearChoices(dia_vatras_beginn);
	Info_AddChoice(dia_vatras_beginn,DIALOG_ENDE,dia_vatras_beginn_los);
};

func void dia_vatras_beginn_los()
{
	AI_StopProcessInfos(self);
	VATRAS_MORE = FALSE;
	Npc_ExchangeRoutine(self,"RITUALINNOSEYE");
	b_startotherroutine(xardas,"RITUALINNOSEYE");
	b_startotherroutine(pyrokar,"RITUALINNOSEYE");
	Npc_SetRefuseTalk(self,60);
	RITUALINNOSEYERUNS = LOG_RUNNING;
};


instance DIA_VATRAS_AUGEGEHEILT(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 33;
	condition = dia_vatras_augegeheilt_condition;
	information = dia_vatras_augegeheilt_info;
	important = TRUE;
};


func int dia_vatras_augegeheilt_condition()
{
	if((KAPITEL == 3) && (RITUALINNOSEYERUNS == LOG_RUNNING) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_augegeheilt_info()
{
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_00");	//Hotovo. Poda�ilo se n�m p�ekazit nep��teli pl�ny a opravit Oko.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_01");	//A� ti Pyrokar vysv�tl�, jak pou��vat jeho s�lu.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_02");	//Douf�m, �e se je�t� uvid�me, a� dokon�� svou misi. Sbohem.
	b_logentry(TOPIC_INNOSEYE,"Oko je ji� v po��dku. Pyrokar mi je vyd� a pak p�jdu lovit draky.");
	AI_StopProcessInfos(self);
	VATRAS_MORE = FALSE;
	RITUALINNOSEYERUNS = LOG_SUCCESS;
	MIS_RITUALINNOSEYEREPAIR = LOG_SUCCESS;
	b_startotherroutine(pyrokar,"RitualInnosEyeRepair");
	b_startotherroutine(xardas,"RitualInnosEyeRepair");
	b_startotherroutine(vlk_455_buerger,"START");
	b_startotherroutine(vlk_454_buerger,"START");
	b_startotherroutine(vlk_428_buergerin,"START");
	b_startotherroutine(vlk_450_buerger,"START");
	b_startotherroutine(vlk_426_buergerin,"START");
	b_startotherroutine(vlk_421_valentino,"START");
};


instance DIA_VATRAS_PERMKAP3(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 33;
	condition = dia_vatras_permkap3_condition;
	information = dia_vatras_permkap3_info;
	description = "D�ky za pomoc p�i obnoven� s�ly Innosova oka.";
};


func int dia_vatras_permkap3_condition()
{
	if(MIS_RITUALINNOSEYEREPAIR == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_vatras_permkap3_info()
{
	AI_Output(other,self,"DIA_Vatras_PERMKAP3_15_00");	//D�ky za pomoc p�i obnoven� s�ly Innosova oka.
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_01");	//Nepl�tvej tak sv�mi d�ky. Tv�j nejv�t�� �kol na tebe je�t� �ek�.
	if(MIS_READYFORCHAPTER4 == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_02");	//Promluv si s Pyrokarem, vysv�tl� ti v�echno ostatn�.
	};
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_03");	//Douf�m, �e t� je�t� uvid�m �iv�ho a zdrav�ho, m�j synu.
};


instance DIA_VATRAS_HILDAKRANK(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 34;
	condition = dia_vatras_hildakrank_condition;
	information = dia_vatras_hildakrank_info;
	description = "Lobartov� �en� Hild� je �patn�.";
};


func int dia_vatras_hildakrank_condition()
{
	if((MIS_HEALHILDA == LOG_RUNNING) && Npc_KnowsInfo(other,dia_vatras_greet))
	{
		return TRUE;
	};
};

func void dia_vatras_hildakrank_info()
{
	AI_Output(other,self,"DIA_Vatras_HILDAKRANK_15_00");	//Lobartov� �en� Hild� je �patn�.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_01");	//Co? U� zase? Ta dobr� �ena by na sebe m�la d�vat v�t�� pozor.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_02");	//Jedna tuh� zima a u� tu s n�mi nebude. Dobr�, d�m ti pro ni medic�nu, co potla�� hore�ku.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_03");	//A v�, kdy� u� jsi v tom, m�l bys na sebe taky d�vat pozor.
	CreateInvItems(self,itpo_healhilda_mis,1);
	b_giveinvitems(self,other,itpo_healhilda_mis,1);
};


instance DIA_VATRAS_OBSESSION(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 35;
	condition = dia_vatras_obsession_condition;
	information = dia_vatras_obsession_info;
	description = "M�m podivn� pocity �zkosti.";
};


func int dia_vatras_obsession_condition()
{
	if((SC_ISOBSESSED == TRUE) && (SC_OBSESSIONTIMES < 1))
	{
		return TRUE;
	};
};

func void dia_vatras_obsession_info()
{
	AI_Output(other,self,"DIA_Vatras_OBSESSION_15_00");	//M�m podivn� pocity �zkosti.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_01");	//Taky nevypad� moc dob�e. Byl jsi vystaven �ern�mu pohledu P�tra�� p��li� dlouhou dobu.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_02");	//V�echno, co svedu l��it, je tvoje t�lo, ale jedin� v kl�te�e mohou o�istit tvou du�i. Promluv si s Pyrokarem. Pom��e ti.
};


instance DIA_VATRAS_ALLDRAGONSDEAD(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 59;
	condition = dia_vatras_alldragonsdead_condition;
	information = dia_vatras_alldragonsdead_info;
	description = "Ti draci u� ��dnou spou�� nezp�sob�.";
};


func int dia_vatras_alldragonsdead_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_vatras_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_00");	//Ti draci u� ��dnou spou�� nezp�sob�.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_01");	//V�d�l jsem, �e se vr�t� �iv� a zdrav�. Nicm�n�, je�t� po��d m� tu nejv�t�� p�ek�ku p�ed sebou.
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_02");	//J� v�m.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_03");	//Tak se po��dn� p�iprav a p�ij� za mnou, kdykoli bude� n�co pot�ebovat. Tak� po��d u sebe nos Innosovo oko, sly��? Nech� ti Adanos �ehn�.
};


instance DIA_VATRAS_KNOWWHEREENEMY(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 55;
	condition = dia_vatras_knowwhereenemy_condition;
	information = dia_vatras_knowwhereenemy_info;
	permanent = TRUE;
	description = "V�m, kde jsou na�i nep��tel�.";
};


func int dia_vatras_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (VATRAS_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_00");	//V�m, kde jsou na�i nep��tel�.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_01");	//Tak to u� nesm�me ztr�cet �as. Mus�me je vyhledat d��v, ne� si pro n�s p�ijdou.
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_02");	//Chce� se ke mn� p�idat?
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_03");	//Dlouho jsem o tom p�em��lel a nikdy jsem si nebyl ni��m tak jist�, p��teli.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Vatras mi p�ekvapiv� nab�dl, �e m� na cest� doprovod�. Mu� s jeho dovednostmi a zku�enostmi pro m� bude jist� velmi cenn�.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_04");	//U� m�m skupinu plnou. Ob�v�m se, �e pro tebe nezbylo m�sto.
		AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_05");	//Tak ho n�jak ud�lej. Pot�ebuje� m�.
	}
	else
	{
		Info_ClearChoices(dia_vatras_knowwhereenemy);
		Info_AddChoice(dia_vatras_knowwhereenemy,"Je�t� o tom pop�em��l�m.",dia_vatras_knowwhereenemy_no);
		Info_AddChoice(dia_vatras_knowwhereenemy,"Pova�uju za velkou poctu m�t t� po sv�m boku.",dia_vatras_knowwhereenemy_yes);
	};
};

func void dia_vatras_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_Yes_15_00");	//Pova�uju za velkou poctu m�t t� po sv�m boku. Uvid�me se v p��stavu.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01");	//A� ti to netrv� moc dlouho. Nep��tel nikdy nesp�, p��teli.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	VATRAS_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	b_vatras_geheweg(LANG);
	Info_ClearChoices(dia_vatras_knowwhereenemy);
};

func void dia_vatras_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_No_15_00");	//Je�t� o tom pop�em��l�m.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_No_05_01");	//Jak je libo. Vra� se, jestli si to rozmysl�.
	VATRAS_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_vatras_knowwhereenemy);
};


instance DIA_VATRAS_LEAVEMYSHIP(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 55;
	condition = dia_vatras_leavemyship_condition;
	information = dia_vatras_leavemyship_info;
	permanent = TRUE;
	description = "Rad�ji bys m�l z�stat tady. M�sto t� pot�ebuje.";
};


func int dia_vatras_leavemyship_condition()
{
	if((VATRAS_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_leavemyship_info()
{
	AI_Output(other,self,"DIA_Vatras_LeaveMyShip_15_00");	//Rad�ji bys m�l z�stat tady. M�sto t� pot�ebuje.
	AI_Output(self,other,"DIA_Vatras_LeaveMyShip_05_01");	//Mo�n� m� pravdu. Ale stejn� se k tob� p�id�m, jestli m� z�jem. To snad v�.
	VATRAS_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"PRAY");
};


instance DIA_VATRAS_STILLNEEDYOU(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 55;
	condition = dia_vatras_stillneedyou_condition;
	information = dia_vatras_stillneedyou_info;
	permanent = TRUE;
	description = "Poje� se mnou na nep��telsk� ostrov.";
};


func int dia_vatras_stillneedyou_condition()
{
	if(((VATRAS_ISONBOARD == LOG_OBSOLETE) || (VATRAS_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_vatras_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Vatras_StillNeedYou_15_00");	//Poje� se mnou na nep��telsk� ostrov.
	AI_Output(self,other,"DIA_Vatras_StillNeedYou_05_01");	//Moudr� rozhodnut�. Douf�m, �e se toho bude� dr�et.
	self.flags = NPC_FLAG_IMMORTAL;
	VATRAS_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	b_vatras_geheweg(LANG);
	AI_StopProcessInfos(self);
	VATRAS_MORE = FALSE;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_ADDON_VATRAS_PISSOFFFOREVVER(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_addon_vatras_pissoffforevver_condition;
	information = dia_addon_vatras_pissoffforevver_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_vatras_pissoffforevver_condition()
{
	if((VATRASPISSEDOFFFOREVER == TRUE) && (KAPITEL >= 5))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_pissoffforevver_info()
{
	b_vatraspissedoff();
	AI_StopProcessInfos(self);
	VATRAS_MORE = FALSE;
};

