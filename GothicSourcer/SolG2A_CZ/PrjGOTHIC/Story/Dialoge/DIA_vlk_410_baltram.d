
instance DIA_BALTRAM_EXIT(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 999;
	condition = dia_baltram_exit_condition;
	information = dia_baltram_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_baltram_exit_condition()
{
	return TRUE;
};

func void dia_baltram_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BALTRAM_HALLO(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 2;
	condition = dia_baltram_hallo_condition;
	information = dia_baltram_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baltram_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (MIS_NAGUR_BOTE == FALSE))
	{
		return TRUE;
	};
};

func void dia_baltram_hallo_info()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Baltram_Hallo_01_00");	//V�tej, cizin�e, jmenuji se Baltram. P�i�el ses z�sobit j�dlem?
		AI_Output(self,other,"DIA_Baltram_Hallo_01_01");	//Ob�v�m se, �e t� zklamu. Moc toho pr�v� te� na sklad� nem�m.
		AI_Output(self,other,"DIA_Baltram_Hallo_01_02");	//Ale ka�d�m dnem bych m�l dostat nov� zbo��.
	}
	else
	{
		AI_Output(self,other,"DIA_Baltram_Hallo_01_03");	//Pokud jsi p�i�el ke mn� nakoupit j�dlo, m��e� j�t klidn� zase pry�.
		AI_Output(self,other,"DIA_Baltram_Hallo_01_04");	//Nemysl�m si o v�s �old�c�ch nic dobr�ho! Zp�sobujete mi jen sam� probl�my.
	};
};


instance DIA_ADDON_BALTRAM_LARESABLOESE(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 1;
	condition = dia_addon_baltram_laresabloese_condition;
	information = dia_addon_baltram_laresabloese_info;
	important = TRUE;
};


func int dia_addon_baltram_laresabloese_condition()
{
	if(Npc_IsInState(self,zs_talk) && (SCISWEARINGRANGERRING == TRUE) && (MIS_LARES_BRINGRANGERTOME == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_baltram_laresabloese_info()
{
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_00");	//Pro� vypad� tak skepticky?
	AI_Output(self,other,"DIA_Addon_Baltram_LaresAbloese_01_01");	//Vid�m, �e m� znamen� 'Kruhu Vody'.
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_02");	//Jsi jedn�m z nich?
	AI_Output(self,other,"DIA_Addon_Baltram_LaresAbloese_01_03");	//A pokud by to byl ten p��pad?
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_04");	//To bych ti pak �ekl, �e Lares chce n�koho jin�ho, kdo se postar� o jeho �kol v p��stavu.
	AI_Output(self,other,"DIA_Addon_Baltram_LaresAbloese_01_05");	//Ok. Pokus�m se naj�t n�koho, kdo bude ochoten to ud�lat.
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_06");	//M�m to.
	b_giveplayerxp(XP_AMBIENT);
	b_logentry(TOPIC_ADDON_BRINGRANGERTOLARES,"Baltram, obchodn�k na tr�i�ti, se postar� o Lares�v ornament. Mo�n� bude moci Lares KONE�N� opustit p��stav.");
	SC_KNOWSBALTRAMASRANGER = TRUE;
	BALTRAM_EXCHANGE4LARES = TRUE;
};


instance DIA_BALTRAM_JOB(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 3;
	condition = dia_baltram_job_condition;
	information = dia_baltram_job_info;
	permanent = FALSE;
	description = "M� pro m� pr�ci?";
};


func int dia_baltram_job_condition()
{
	if((MIS_NAGUR_BOTE != LOG_RUNNING) && (MIS_NAGUR_BOTE != LOG_SUCCESS) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_baltram_job_info()
{
	AI_Output(other,self,"DIA_Baltram_Job_15_00");	//M� pro m� pr�ci?
	AI_Output(self,other,"DIA_Baltram_Job_01_01");	//Ne, posl��ka u� m�m. Zkus to u jin�ho obchodn�ka.
};


instance DIA_BALTRAM_TRICK(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 4;
	condition = dia_baltram_trick_condition;
	information = dia_baltram_trick_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baltram_trick_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_NAGUR_BOTE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_baltram_trick_info()
{
	AI_Output(self,other,"DIA_Baltram_Trick_01_00");	//Hled� pr�ci?
	AI_Output(other,self,"DIA_Baltram_Trick_15_01");	//Jasn�, o co jde?
	AI_Output(self,other,"DIA_Baltram_Trick_01_02");	//M�j posl��ek se je�t� nevr�til zp�tky a j� �ek�m dod�vku od farm��e Akila.
	AI_Output(other,self,"DIA_Baltram_Trick_15_03");	//A kolik mi za to d�?
	AI_Output(self,other,"DIA_Baltram_Trick_01_04");	//D�m ti 50 zla��k�.
	AI_Output(other,self,"DIA_Baltram_Trick_15_05");	//Dobr�, to beru.
	AI_Output(self,other,"DIA_Baltram_Trick_01_06");	//Dobr�, jenom �ekni Akilovi, �e t� pos�l�m. D� ti bal�k. P�ines mi ho.
	MIS_BALTRAM_SCOUTAKIL = LOG_RUNNING;
	b_logentry(TOPIC_NAGUR,"Baltram m� zam�stnal jako posl��ka. M�m mu p�in�st n�jakou z�silku z Akilova statku.");
	Log_CreateTopic(TOPIC_BALTRAM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BALTRAM,LOG_RUNNING);
	b_logentry(TOPIC_BALTRAM,"Kdy� Beltramovi doru��m jeho z�silku, zaplat� mi 50 zla��k�.");
};


var int baltram_tradelog;

instance DIA_BALTRAM_WAREZ(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 2;
	condition = dia_baltram_warez_condition;
	information = dia_baltram_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Uka� mi sv� zbo��.";
};


func int dia_baltram_warez_condition()
{
	return TRUE;
};

func void dia_baltram_warez_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Baltram_WAREZ_15_00");	//Uka� mi sv� zbo��.
	if(BALTRAM_TRADELOG == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Baltram prod�v� na tr�i�ti potraviny.");
		BALTRAM_TRADELOG = TRUE;
	};
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_01");	//Nem�li to nechat doj�t tak daleko. Te� jeden ze �old�k� zavra�dil paladina.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_02");	//N�co by se m�lo st�t!
	};
	if((MIS_BALTRAMTRADE != LOG_SUCCESS) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_03");	//Lid� jako ty ode mne nic nedostanou.
		AI_Output(other,self,"DIA_Baltram_WAREZ_15_04");	//Pro�?
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_05");	//Nejd��v znesv���te farm��e a potom d�l�te, jako by se nic nestalo.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_06");	//Te� vypadni, odh�n� mi z�kazn�ky.
		MIS_BALTRAMTRADE = LOG_FAILED;
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_BALTRAM_SKIP(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 5;
	condition = dia_addon_baltram_skip_condition;
	information = dia_addon_baltram_skip_info;
	description = "Mimochodem, ty jsi v kontaktu s pir�ty?";
};


func int dia_addon_baltram_skip_condition()
{
	if(SCKNOWSBALTRAMASPIRATETRADER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_baltram_skip_info()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_15_00");	//(n�hodile) Mimochoem, ty jsi v kontaktu s pir�ty?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_01_01");	//(c�t� se odhalen) Co? Kdo to ��kal?
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_15_02");	//Mluvil jsem s jedn�m. Vypad� to, �e na tebe �ek� ve sv�m z�livu.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_01_03");	//Dob�e, a co bych m�l teda d�lat? T�k� �asy, v�dy� v�. Mus�m se n�jak �ivit.
	Info_ClearChoices(dia_addon_baltram_skip);
	Info_AddChoice(dia_addon_baltram_skip,"Neboj� se, �e t� p�itom chyt�?",dia_addon_baltram_skip_erwischen);
	Info_AddChoice(dia_addon_baltram_skip,"Bude� muset �elit d�sledk�m sv�ch �in�!",dia_addon_baltram_skip_mil);
};

func void dia_addon_baltram_skip_back()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_Back_15_00");	//Ok, to je v�e, co jsem cht�l v�d�t.
	Info_ClearChoices(dia_addon_baltram_skip);
};

func void dia_addon_baltram_skip_mil()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_MIL_15_00");	//Bude� muset �elit d�sledk�m sv�ch �in�!
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_MIL_01_01");	//Hej, poslouchej. �eknu ti v�echno, co v�m a ty to na m� na opl�tku ne�ekne�, dob�e?
	Info_ClearChoices(dia_addon_baltram_skip);
	Info_AddChoice(dia_addon_baltram_skip,"Jak� zbo�� vym��uje�?",dia_addon_baltram_skip_was);
	Info_AddChoice(dia_addon_baltram_skip,"Co v� o pir�tech?",dia_addon_baltram_skip_pirat);
};

func void dia_addon_baltram_skip_erwischen()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_erwischen_15_00");	//Neboj� se, �e t� p�itom chyt�?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_erwischen_01_01");	//No, m��e se to st�t. Nakonec ty jsi to p�ece zjistil.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_erwischen_01_02");	//Ale ty to nikomu ne�ekne�, �e ne?
	Info_ClearChoices(dia_addon_baltram_skip);
	Info_AddChoice(dia_addon_baltram_skip,"Jak� zbo�� vym��uje�?",dia_addon_baltram_skip_was);
	Info_AddChoice(dia_addon_baltram_skip,"Co v� o pir�tech?",dia_addon_baltram_skip_pirat);
};

func void dia_addon_baltram_skip_was()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_was_15_00");	//(tvrd�) Jak� zbo�� vym��uje�?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_was_01_01");	//Obvykle j�dlo.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_was_01_02");	//A v�m�nou za to dost�v�m ten nejlep�� rum, jak� m��es v Khorinisu dostat.
	Info_AddChoice(dia_addon_baltram_skip,"Ok, to je v�e, co jsem cht�l v�d�t.",dia_addon_baltram_skip_back);
	Info_AddChoice(dia_addon_baltram_skip,"Mohl bych ti pomoci.",dia_addon_baltram_skip_ich);
};

func void dia_addon_baltram_skip_ich()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_Ich_15_00");	//(s �sm�vem) Mohl bych ti pomoci.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_Ich_01_01");	//To nen� �patn� n�pad. Te� zrovna nem��u opustit Khorinis.
	CreateInvItems(self,itmi_packet_baltram4skip_addon,1);
	b_giveinvitems(self,other,itmi_packet_baltram4skip_addon,1);
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_Ich_01_02");	//Tady, vezmi si tento bal��ek a �ekni Skipovi, a� tentokr�t s t�m rumem ne�et��.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_Ich_01_03");	//Nem�lo by to b�t m�� ne� 3 fla�ky.
	b_logentry(TOPIC_ADDON_BALTRAMSKIPTRADE,"Baltram mi dal bal��ek. M�l bych ho doru�it Skipovi.");
	MIS_ADDON_BALTRAM_PAKET4SKIP = LOG_RUNNING;
};

func void dia_addon_baltram_skip_pirat()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_pirat_15_00");	//(tvrd�) Co v� o pir�tech?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_01");	//(sp�n�) �ij� n�kde schovan� na ostrov�.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_02");	//Pokud v�m, tak se tam d� dostat jedin� lod�.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_03");	//Ob�an� Khorinisu se jich boj�. Opr�vn�n�. V podstat� je to banda smradlav�ch hrdlo�ez�.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_04");	//Na druhou stranu si mysl�m, �e po��d nejsou tak stra�n� jako banditi.
};


instance DIA_ADDON_BALTRAM_SKIPSRUM(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 5;
	condition = dia_addon_baltram_skipsrum_condition;
	information = dia_addon_baltram_skipsrum_info;
	description = "M�m ten rum. Bohu�el mi Skip dal jen 2 fla�ky.";
};


func int dia_addon_baltram_skipsrum_condition()
{
	if((SKIP_RUM4BALTRAM == TRUE) && (MIS_ADDON_BALTRAM_PAKET4SKIP == LOG_RUNNING) && (Npc_HasItems(other,itfo_addon_rum) >= 2))
	{
		return TRUE;
	};
};

func void dia_addon_baltram_skipsrum_info()
{
	AI_Output(other,self,"DIA_Addon_Baltram_SkipsRum_15_00");	//M�m ten rum. Bohu�el mi Skip dal jen 2 fla�ky.
	AI_Output(self,other,"DIA_Addon_Baltram_SkipsRum_01_01");	//(na�tvan�) Zatracen� drah�. Co si o sob� ten Skip v�bec mysl�? Ale dob�e, dej to sem.
	b_giveinvitems(other,self,itfo_addon_rum,2);
	AI_Output(self,other,"DIA_Addon_Baltram_SkipsRum_01_02");	//Nem��u ti za to d�t mnoho. To je v�e, co m�m.
	CreateInvItems(self,itmi_gold,10);
	b_giveinvitems(self,other,itmi_gold,10);
	TOPIC_END_BALTRAMSKIPTRADE = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BALTRAM_AKILSHOF(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 4;
	condition = dia_baltram_akilshof_condition;
	information = dia_baltram_akilshof_info;
	permanent = FALSE;
	description = "Kde najdu Akilovu farmu?";
};


func int dia_baltram_akilshof_condition()
{
	if(MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_baltram_akilshof_info()
{
	AI_Output(other,self,"DIA_Baltram_AkilsHof_15_00");	//Kde najdu Akilovu farmu?
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_01");	//Projdi v�chodn� branou a dr� se cesty vedouc� na jihov�chod.
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_02");	//Po chv�li p�ijde� ke kamenn�mu schodi�ti. Vyjdi nahoru a odtud u� uvid� Akilovu farmu.
};


instance DIA_BALTRAM_LIEFERUNG(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 5;
	condition = dia_baltram_lieferung_condition;
	information = dia_baltram_lieferung_info;
	permanent = FALSE;
	description = "M�m Akilovu dod�vku.";
};


func int dia_baltram_lieferung_condition()
{
	if(Npc_HasItems(other,itmi_baltrampaket) >= 1)
	{
		return TRUE;
	};
};

func void dia_baltram_lieferung_info()
{
	AI_Output(other,self,"DIA_Baltram_Lieferung_15_00");	//M�m Akilovu dod�vku.
	AI_Output(self,other,"DIA_Baltram_Lieferung_01_01");	//V�born�. Kone�n� zase m��u nab�zet �erstv� zbo��. Tady m� 50 zlat�ch.
	b_giveinvitems(other,self,itmi_baltrampaket,1);
	b_giveinvitems(self,other,itmi_gold,50);
	MIS_BALTRAM_SCOUTAKIL = LOG_SUCCESS;
	MIS_NAGUR_BOTE = LOG_FAILED;
	b_giveplayerxp(XP_BALTRAM_SCOUTAKIL);
	Npc_RemoveInvItems(self,itmi_baltrampaket,1);
	CreateInvItems(self,itfo_cheese,5);
	CreateInvItems(self,itfo_apple,10);
	CreateInvItems(self,itfo_beer,5);
	CreateInvItems(self,itfo_bacon,5);
	CreateInvItems(self,itfo_sausage,5);
};


instance DIA_BALTRAM_LETUSTRADE(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 6;
	condition = dia_baltram_letustrade_condition;
	information = dia_baltram_letustrade_info;
	permanent = FALSE;
	description = "Mohli bychom po tom v�em spolu uzav��t obchod?";
};


func int dia_baltram_letustrade_condition()
{
	if(MIS_BALTRAMTRADE == LOG_FAILED)
	{
		return TRUE;
	};
};

func void dia_baltram_letustrade_info()
{
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_00");	//Mohli bychom po tom v�em spolu uzav��t obchod?
	AI_Output(self,other,"DIA_Baltram_LetUsTrade_01_01");	//Poslouchej, kdy� mi p�inese� 10 �unek a 10 lahv� v�na, potom s tebou budu zase obchodovat.
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_02");	//Uvid�m, co se d� d�lat.
	MIS_BALTRAMTRADE = LOG_RUNNING;
};


var int baltramenoughbacon;
var int baltramenoughwine;

instance DIA_BALTRAM_HAVEYOURWAREZ(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 6;
	condition = dia_baltram_haveyourwarez_condition;
	information = dia_baltram_haveyourwarez_info;
	permanent = TRUE;
	description = "M�m tv� zbo��.";
};


func int dia_baltram_haveyourwarez_condition()
{
	if((MIS_BALTRAMTRADE == LOG_RUNNING) && (MIS_BALTRAMTRADE != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_baltram_haveyourwarez_info()
{
	AI_Output(other,self,"DIA_Baltram_HaveYourWarez_15_00");	//M�m tv� zbo��.
	AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_01");	//Uka� mi to.
	if(Npc_HasItems(other,itfo_bacon) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_02");	//Dohodli jsme se snad na 10 �unk�ch. P�ij�, a� jich bude� m�t dost.
		BALTRAMENOUGHBACON = FALSE;
	}
	else
	{
		BALTRAMENOUGHBACON = TRUE;
	};
	if(Npc_HasItems(other,itfo_wine) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_03");	//A co 10 lahv� v�na? Na ty jsi zapomn�l?
		BALTRAMENOUGHWINE = FALSE;
	}
	else
	{
		BALTRAMENOUGHWINE = TRUE;
	};
	if((BALTRAMENOUGHBACON == TRUE) && (BALTRAMENOUGHWINE == TRUE))
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_04");	//Hmm, nen� to sice nejlep�� kvalita, ale v t�chto dob�ch nem��e� b�t moc vyb�rav�.
		b_giveinvitems(other,self,itfo_bacon,10);
		b_giveinvitems(other,self,itfo_wine,10);
		MIS_BALTRAMTRADE = LOG_SUCCESS;
		b_giveplayerxp(XP_BALTRAMTRADE);
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_05");	//Te� n�m nic nebr�n� v uzav�en� obchodu.
	};
};


instance DIA_BALTRAM_PICKPOCKET(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 900;
	condition = dia_baltram_pickpocket_condition;
	information = dia_baltram_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_baltram_pickpocket_condition()
{
	return c_beklauen(76,175);
};

func void dia_baltram_pickpocket_info()
{
	Info_ClearChoices(dia_baltram_pickpocket);
	Info_AddChoice(dia_baltram_pickpocket,DIALOG_BACK,dia_baltram_pickpocket_back);
	Info_AddChoice(dia_baltram_pickpocket,DIALOG_PICKPOCKET,dia_baltram_pickpocket_doit);
};

func void dia_baltram_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_baltram_pickpocket);
};

func void dia_baltram_pickpocket_back()
{
	Info_ClearChoices(dia_baltram_pickpocket);
};

