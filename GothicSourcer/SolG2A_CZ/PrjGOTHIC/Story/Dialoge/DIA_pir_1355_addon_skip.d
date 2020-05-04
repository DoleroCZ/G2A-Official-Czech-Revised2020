
instance DIA_ADDON_SKIP_EXIT(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 999;
	condition = dia_addon_skip_exit_condition;
	information = dia_addon_skip_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_skip_exit_condition()
{
	return TRUE;
};

func void dia_addon_skip_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SKIP_PICKPOCKET(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 900;
	condition = dia_addon_skip_pickpocket_condition;
	information = dia_addon_skip_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_skip_pickpocket_condition()
{
	return c_beklauen(20,43);
};

func void dia_addon_skip_pickpocket_info()
{
	Info_ClearChoices(dia_addon_skip_pickpocket);
	Info_AddChoice(dia_addon_skip_pickpocket,DIALOG_BACK,dia_addon_skip_pickpocket_back);
	Info_AddChoice(dia_addon_skip_pickpocket,DIALOG_PICKPOCKET,dia_addon_skip_pickpocket_doit);
};

func void dia_addon_skip_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_skip_pickpocket);
};

func void dia_addon_skip_pickpocket_back()
{
	Info_ClearChoices(dia_addon_skip_pickpocket);
};


instance DIA_ADDON_SKIP_HELLO(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 1;
	condition = dia_addon_skip_hello_condition;
	information = dia_addon_skip_hello_info;
	important = TRUE;
};


func int dia_addon_skip_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (PLAYERTALKEDTOSKIPNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_00");	//No kdo to zase k��� cestu se star�m Skipem?
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_01");	//(p�ehnan�) J� t� zn�m!
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_02");	//Z�toka pobl� m�sta, pamatuje�?
	AI_Output(other,self,"DIA_Addon_Skip_Hello_15_03");	//Skip! Spr�vn�?
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_04");	//(hrd�) M��u ��ci, �e jsem ti to natrvalo vtiskl.
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_05");	//Ale mezit�m jsem tvoji tv�� musel vid�t n�kde JINDE ...
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_06");	//Ah! Jasn�!
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_07");	//Tak dobr�. �patn� nakreslen�, ale jsi to TY.
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_08");	//Neboj. M� plak�ty vypadaj� stejn� hloup�.
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_ADDON_SKIPADW_BALTRAMPAKET(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 2;
	condition = dia_addon_skipadw_baltrampaket_condition;
	information = dia_addon_skipadw_baltrampaket_info;
	description = "M�m pro tebe bal�k od Baltrama.";
};


func int dia_addon_skipadw_baltrampaket_condition()
{
	if(Npc_HasItems(other,itmi_packet_baltram4skip_addon))
	{
		return TRUE;
	};
};

func void dia_addon_skipadw_baltrampaket_info()
{
	AI_Output(other,self,"DIA_Addon_SkipADW_BaltramPaket_15_00");	//M�m pro tebe bal�k od Baltrama.
	AI_Output(self,other,"DIA_Addon_SkipADW_BaltramPaket_08_01");	//(�kleb� se) Mus� b�t velmi chtiv� po na�em rumu, nebo by nem�l pos�lat v�ci TOUHLE CESTOU.
	b_giveinvitems(other,self,itmi_packet_baltram4skip_addon,1);
	AI_Output(self,other,"DIA_Addon_SkipADW_BaltramPaket_08_02");	//Tady jsou pro n�j 2 l�hve rumu. T�et� jsem vypil, kdy� jsem na n�j �ekal.
	b_giveinvitems(self,other,itfo_addon_rum,2);
	b_giveplayerxp(XP_ADDON_SKIP_BALTRAMPAKET);
	b_logentry(TOPIC_ADDON_BALTRAMSKIPTRADE,LOGTEXT_ADDON_SKIPSRUMTOBALTRAM);
	SKIP_RUM4BALTRAM = TRUE;
};


instance DIA_ADDON_SKIP_JOB(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 3;
	condition = dia_addon_skip_job_condition;
	information = dia_addon_skip_job_info;
	description = "Co tady d�l�?";
};


func int dia_addon_skip_job_condition()
{
	return TRUE;
};

func void dia_addon_skip_job_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Job_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Addon_Skip_Job_08_01");	//Zrovna jsem se vr�til z Khorinisu a te� �ek�m, a� se Greg vr�t�.
};


instance DIA_ADDON_SKIP_ADW_GREGGETROFFEN(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 4;
	condition = dia_addon_skip_adw_greggetroffen_condition;
	information = dia_addon_skip_adw_greggetroffen_info;
	description = "Vid�l jsem Grega v Khorinisu.";
};


func int dia_addon_skip_adw_greggetroffen_condition()
{
	if((PLAYERTALKEDTOGREGNW == TRUE) && (GREGISBACK == FALSE) && Npc_KnowsInfo(other,dia_addon_skip_job))
	{
		return TRUE;
	};
};

func void dia_addon_skip_adw_greggetroffen_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_ADW_GregGetroffen_15_00");	//Vid�l jsem Grega v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_01");	//Opravdu? Zatracen�! N�co mus� b�t �patn�.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_02");	//M�l by b�t zp�t s na�� lod�.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_03");	//(zamy�len�) Bude nejlep��, kdy� se vr�t�m do Khorinisu a po�k�m tam na n�ho ...
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_04");	//(povzdech) Ale ur�it� ne dnes. Zrovna jsem p�ijel.
	b_giveplayerxp(XP_AMBIENT);
};


var int skip_transport_variation;

instance DIA_ADDON_SKIP_TRANSPORT(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 99;
	condition = dia_addon_skip_transport_condition;
	information = dia_addon_skip_transport_info;
	permanent = TRUE;
	description = "M��e� m� vz�t zp�t do Khorinisu?";
};


func int dia_addon_skip_transport_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_job) && (self.aivar[AIV_PARTYMEMBER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_transport_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Transport_15_00");	//M��e� m� vz�t zp�t do Khorinisu?
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_01");	//Ne. Je�t� nejdu. Nejd��v si d�m po��dn� hlt grogu.
	}
	else if(SKIP_TRANSPORT_VARIATION == 0)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_02");	//Zbl�znil jsi se? Ztratili jsme na�i lo�, chlape!
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_03");	//Nebudu pou��vat na�i posledn� lo� na plavbu pro pot�en�, jenom proto, �e ty jsi moc l�n� dostat tv�j zadek do Khorinisu S�M!
		SKIP_TRANSPORT_VARIATION = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_04");	//Kolikr�t? NE!
	};
};


instance DIA_ADDON_SKIP_BANDITS(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 6;
	condition = dia_addon_skip_bandits_condition;
	information = dia_addon_skip_bandits_info;
	description = "Co mi m��e� ��ct o banditech?";
};


func int dia_addon_skip_bandits_condition()
{
	return TRUE;
};

func void dia_addon_skip_bandits_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Bandits_15_00");	//Co mi m��e� ��ct o banditech?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_01");	//Bandit�? �TO�� na n�s!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_02");	//Pro� by jsme jinak stavili palis�dy?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_03");	//Vlastn� jsme ty �mejdy sem p�ivedli my.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_04");	//Tak� jsme s nimi obchodovali. Chlap�e, m�li moc zlata, m�li ho i za u�ima!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_05");	//Byli p�ipraveni zaplatit barel rumu za jakkoukoli cenu.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_06");	//Ale tyhle dny skon�ili. Te� je v�lka!
	AI_Output(other,self,"DIA_Addon_Erol_Bandits_15_06");	//Co se stalo?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_07");	//Ti teplou�i nezaplatili posledn� z�silku.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_08");	//Tak jsem se tam byl pod�vat, co se d�je s na��m zlatem.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_09");	//Ale kdy� jsem vstoupil do mo��lu, ti bastardi na m� za�ali �to�it!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_10");	//To ale nen� v�e. Odstranili Agnuse a Hanka! Dva z na�ich nejlep��ch chlapc�!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_11");	//Necho� do mo��lu, to ti �eknu!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_12");	//Za�to�� na v�e, co nen� tak otrhan� jako oni sami.
};


instance DIA_ADDON_SKIP_ARMORPRICE(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 6;
	condition = dia_addon_skip_armorprice_condition;
	information = dia_addon_skip_armorprice_info;
	description = "Pot�ebuji zbroj bandit�.";
};


func int dia_addon_skip_armorprice_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_bandits) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_armorprice_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_ArmorPrice_15_00");	//Pot�ebuji zbroj bandit�.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_01");	//Ty tam chce� j�t? Jsi �pln� ztratil rozum.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_02");	//Jestli tihle chlapi zjist�, �e nejsi jeden z nich, nakrm� s tebou ba�inn� �raloky!
	AI_Output(other,self,"DIA_Addon_Skip_ArmorPrice_15_02");	//N�jak� n�pad, kde mohu naj�t takov� brn�n�?
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_03");	//(povzdech) Ty to nevzd�, �e? Dobr�. M�li jsme jedno.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_04");	//Greg ho mo�n� m� ve sv� chatr�i.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_05");	//Kdy� se vr�t�, mo�n� ti ho prod� ...
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Skip p�edpokl�d�, �e zbroj bude v Gregov� chatr�i.");
};


instance DIA_ADDON_SKIP_GREGSHUT(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 6;
	condition = dia_addon_skip_gregshut_condition;
	information = dia_addon_skip_gregshut_info;
	permanent = FALSE;
	description = "N�jak� n�pad, jak se m��u dostat do chatr�e?";
};


func int dia_addon_skip_gregshut_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_armorprice) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_gregshut_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_GregsHut_15_00");	//N�jak� n�pad, jak se m��u dostat do chatr�e?
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_01");	//Hahaha! Spolehliv�!
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_02");	//Chyst� se �lohnout n�co z Gregovy sb�rky?
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_03");	//Kdy� ode�el, dal Francisovi kl��e a p��kaz, �e NIKDO nesm� vstoupit do chatr�e.
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Francis m� kl�� od Gregovy chatr�e. M� p��kaz nikoho nepou�t�t dovnit�.");
	KNOWS_GREGSHUT = TRUE;
};


instance DIA_ADDON_SKIP_FRANCIS(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 6;
	condition = dia_addon_skip_francis_condition;
	information = dia_addon_skip_francis_info;
	permanent = FALSE;
	description = "Co mi m��e� ��ct o Francisovi?";
};


func int dia_addon_skip_francis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_gregshut))
	{
		return TRUE;
	};
};

func void dia_addon_skip_francis_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Francis_15_00");	//Co mi m��e� ��ct o Francisovi?
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_01");	//Francis je n� pokladn�k.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_02");	//Kapit�n mu v���. Proto mu sv��il velen�.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_03");	//I kdy� ho nikdo nebere v�n�.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_04");	//Jestli se chce� dov�d�t v�c, promluv se Samuelem.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_05");	//Jeho destil�tor je v mal� jeskyni na severu.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_06");	//V tomhle t�bo�e nen� nikdo, o kom by Samuel N�CO zaj�mav�ho nev�d�l.
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"M�l bych si promluvit se Samuelem. Mo�n� m� m��e d�t tip.");
};


instance DIA_ADDON_SKIP_RAVEN(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 5;
	condition = dia_addon_skip_raven_condition;
	information = dia_addon_skip_raven_info;
	permanent = FALSE;
	description = "Setkal jsi se n�kdy s Ravenem?";
};


func int dia_addon_skip_raven_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_bandits) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_skip_raven_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Raven_15_00");	//Setkal jsi se n�kdy s Ravenem?
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_01");	//Jasn�. Byl jsem u p�edn� br�ny s Henrym. Mohli jsme vid�t Ravena, jak pos�lal n�kter� ze sv�ch lid� do v�e na v�chod odsud.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_02");	//Opravdu bl�zko k na�emu t�boru. (sm�je se) H�d�m, �e jsou tam proto, aby n�s �pehovali.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_03");	//Tak� jsem vid�l, jak o�et�uje lidi, kte�� ned�laj�, co jim p�ik�e.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_04");	//Ka�d� kdo neposlechne na slovo, je bez rozm��len� zabit.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_05");	//Vyvaruj se Ravena, to ti pov�m.
};


instance DIA_ADDON_SKIP_ANGUSHANK(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 5;
	condition = dia_addon_skip_angushank_condition;
	information = dia_addon_skip_angushank_info;
	description = "�ekni mi v�ce o Agnusovi a Hankovi.";
};


func int dia_addon_skip_angushank_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_bandits))
	{
		return TRUE;
	};
};

func void dia_addon_skip_angushank_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHank_15_00");	//�ekni mi v�ce o Agnusovi a Hankovi.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_01");	//Angus a Hank se byli pravd�podobn� setkat s p�r bandity za t�borem.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_02");	//M�li s sebou v�echno mo�n�. V�e, o co si ti bastardi �ekli.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_03");	//Surovou ocel a pakl��e.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_04");	//Ale nikdy se nevr�tili. Ty banditsk� svin� je musely odpravit!
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_05");	//Morgand a Bill se po nich byli pod�vat - bez v�sledku.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_06");	//Bill byl z toho p�kn� �patn�. Kamar�dil se s nimi.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_07");	//Je st�le mlad� a tenhle incident ho hodn� poznamenal.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_08");	//Ostatn� to brali v klidu. Ztr�ta v�ci je snadn�. (povzdech) Ale grog co m�li s sebou ...
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_09");	//(kysele) Mluv�me nejm�n� o 20 l�hv�ch!
	MIS_ADDON_SKIPSGROG = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_SKIPSGROG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_SKIPSGROG,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_SKIPSGROG,"Jak se zd�, tak Skip ztratil 20 l�hv� grogu. Chce je zp�tky.");
	Log_AddEntry(TOPIC_ADDON_SKIPSGROG,"Angus a Hank byli vysl�ni za p�r bandity na obchod. Potom u� nebyli znovu spat�eni.");
	Log_AddEntry(TOPIC_ADDON_SKIPSGROG,"Morganovo a Billovo p�tr�n� nep�ineslo ��dn� v�sledky ...");
};


instance DIA_ADDON_SKIP_ANGUSHANKDEAD(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 5;
	condition = dia_addon_skip_angushankdead_condition;
	information = dia_addon_skip_angushankdead_info;
	permanent = FALSE;
	description = "O Angusovi a Hankovi ...";
};


func int dia_addon_skip_angushankdead_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_bandits) && !Npc_HasItems(angus,itri_addon_morgansring_mission))
	{
		return TRUE;
	};
};

func void dia_addon_skip_angushankdead_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_00");	//O Angusovi a Hankovi ...
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_01");	//Co?
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_01");	//Na�el jsem je.
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_03");	//Jsou mrtv�.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_03");	//(pro sebe) Mrtv� jako dve�n� h�eb�k - uboz� chlapi!
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_04");	//Dobr�, nic v�c jsem ne�ekal.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_05");	//M�l bys d�t Billovi v�d�t, pokud jsi to u� neud�lal.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_06");	//Ale �ekni mu to jemn� - je st�le mlad�.
};


instance DIA_ADDON_SKIP_ANGUSHANKMURDER(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 5;
	condition = dia_addon_skip_angushankmurder_condition;
	information = dia_addon_skip_angushankmurder_info;
	permanent = FALSE;
	description = "Zn�m vraha Agnuse a Hanka.";
};


func int dia_addon_skip_angushankmurder_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_angushankdead) && (SC_KNOWS_JUANMURDEREDANGUS == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_angushankmurder_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_JuanMurder_15_00");	//Zn�m vraha Agnuse a Hanka.
	if(MIS_ADDON_SKIPSGROG == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_01");	//Dob�e pro tebe. Jsou oba mrtv�. Kdo se o n�j postar�?
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_02");	//Pomsta nikdy neud�l� pir�ta bohat�ho.
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_03");	//Nejd�le�it�j�� je, �e m�m sv�j grog zp�tky.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_04");	//Vrah m� nezaj�m�! Co m�j grog?!
	};
};


instance DIA_ADDON_SKIP_GROG(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 9;
	condition = dia_addon_skip_grog_condition;
	information = dia_addon_skip_grog_info;
	permanent = TRUE;
	description = "O grogu ...";
};


func int dia_addon_skip_grog_condition()
{
	if(MIS_ADDON_SKIPSGROG == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_skip_grog_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_15_00");	//O grogu ...
	if(Npc_HasItems(other,itfo_addon_grog) >= 20)
	{
		Info_ClearChoices(dia_addon_skip_grog);
		Info_AddChoice(dia_addon_skip_grog,DIALOG_BACK,dia_addon_skip_grog_back);
		Info_AddChoice(dia_addon_skip_grog,"Tady je tv�ch 20 l�hv�.",dia_addon_skip_grog_geben);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Skip_Grog_15_01");	//Postr�d� 20 l�hv�, �e?
		AI_Output(self,other,"DIA_Addon_Skip_Grog_08_02");	//Ano, zatracen�. To byly na�e �pln� z�soby.
	};
};

func void dia_addon_skip_grog_back()
{
	Info_ClearChoices(dia_addon_skip_grog);
};

func void dia_addon_skip_grog_geben()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_00");	//Tady je tv�ch 20 l�hv�.
	b_giveinvitems(other,self,itfo_addon_grog,20);
	b_logentry(TOPIC_ADDON_SKIPSGROG,"Skip m� sv�ch 20 l�hv� grogu a je spokojen�.");
	MIS_ADDON_SKIPSGROG = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_SKIPSGROG);
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_01");	//Co to? Za nic?
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_02");	//Noo ...
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_03");	//Dobr�. Zaplat�m ti.
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_04");	//M� n�co v�ce zaj�mav�j��ho, ne� je zlato?
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_05");	//Hmm. Nech m� se kouknout. M�m tu tady ten prsten.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_06");	//Vyhr�l jsem ho p�ed mnoha roky v jednom dusn�m p��stavn�m baru p�i h�e na �anci.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_07");	//Staroch �ekl, �e je magick�. Co� se zd�.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_08");	//Chce� ho, nebo chce� zlato?
	Info_ClearChoices(dia_addon_skip_grog);
	Info_AddChoice(dia_addon_skip_grog,"Dej mi pen�ze.",dia_addon_skip_grog_gold);
	Info_AddChoice(dia_addon_skip_grog,"Dej mi prsten.",dia_addon_skip_grog_ring);
};

func void dia_addon_skip_grog_ring()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_ring_15_00");	//Dej mi prsten.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_ring_08_01");	//Tady m�.
	b_giveinvitems(self,other,itri_prot_edge_02,1);
	Info_ClearChoices(dia_addon_skip_grog);
};

func void dia_addon_skip_grog_gold()
{
	var int grogkohle;
	AI_Output(other,self,"DIA_Addon_Skip_Grog_gold_15_00");	//Dej mi pen�ze.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_gold_08_01");	//Jasn�.
	grogkohle = VALUE_GROG * 20;
	b_giveinvitems(self,other,itmi_gold,grogkohle);
	Info_ClearChoices(dia_addon_skip_grog);
};


instance DIA_ADDON_SKIP_NEWS(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 888;
	condition = dia_addon_skip_news_condition;
	information = dia_addon_skip_news_info;
	permanent = FALSE;
	description = "M� n�co k prodeji?";
};


func int dia_addon_skip_news_condition()
{
	return TRUE;
};

func void dia_addon_skip_news_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_News_15_00");	//M� n�co k prodeji?
	AI_Output(self,other,"DIA_Addon_Skip_News_08_01");	//Jestli chce� obchodovat, promluv si s Garettem. Star� se o z�soby.
	Log_CreateTopic(TOPIC_ADDON_PIR_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_PIR_TRADER,LOG_TEXT_ADDON_GARETTTRADE);
};


instance DIA_ADDON_SKIP_ANHEUERN(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 11;
	condition = dia_addon_skip_anheuern_condition;
	information = dia_addon_skip_anheuern_info;
	permanent = FALSE;
	description = "Poj�, pomo� mi.";
};


func int dia_addon_skip_anheuern_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_skip_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Anheuern_15_00");	//Poj�, pomo� mi.
	AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_01");	//Co se d�je?
	AI_Output(other,self,"DIA_Addon_Skip_Anheuern_15_01");	//Ka�on �ek�.
	if(c_howmanypiratesinparty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_02");	//Vid�m, �e jsi shrom�dil p�r chlapc�. To je dob�e!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_03");	//Rad�i s sebou vezmi v�c chlapc�!
	};
	AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_04");	//Ka�on je smrt�c�!
};


instance DIA_ADDON_SKIP_COMEON(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 12;
	condition = dia_addon_skip_comeon_condition;
	information = dia_addon_skip_comeon_info;
	permanent = TRUE;
	description = "Poj� se mnou.";
};


func int dia_addon_skip_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_skip_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_skip_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_ComeOn_15_00");	//Poj� se mnou.
	if(c_gregspiratestoofar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Skip_ComeOn_08_02");	//Po�kej. Nejd��v se vra�me do ka�onu ...
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_ComeOn_08_01");	//Jasn�!
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			b_turntonpc(self,other);
		};
		AI_StopProcessInfos(self);
		b_addon_piratesfollowagain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_SKIP_GOHOME(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 13;
	condition = dia_addon_skip_gohome_condition;
	information = dia_addon_skip_gohome_info;
	permanent = TRUE;
	description = "U� t� v�ce nepot�ebuji.";
};


func int dia_addon_skip_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_skip_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_GoHome_15_00");	//U� t� v�ce nepot�ebuji.
	AI_Output(self,other,"DIA_Addon_Skip_GoHome_08_01");	//Pak dobr�. Jsem v t�bo�e.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_SKIP_TOOFAR(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 14;
	condition = dia_addon_skip_toofar_condition;
	information = dia_addon_skip_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_skip_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (c_gregspiratestoofar() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_toofar_info()
{
	AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_01");	//To je dost daleko!
	if(c_howmanypiratesinparty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_02");	//Jestli opravdu chce� j�t d�l, ud�lej to bez n�s!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_03");	//Jestli opravdu chce� j�t d�l, ud�lej to beze m�.
	};
	b_addon_piratesgohome();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SKIP_TREFFPUNKT(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 1;
	condition = dia_addon_skip_treffpunkt_condition;
	information = dia_addon_skip_treffpunkt_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_skip_treffpunkt_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_CANYON_TELEPORT_PATH_06") <= 800) && (c_allcanyonrazordead() == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_treffpunkt_info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_00");	//Pokud se rozd�l�me, setk�me se u tohohle jez�rka.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_02");	//Poj�me!
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SKIP_ORKS(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 1;
	condition = dia_addon_skip_orks_condition;
	information = dia_addon_skip_orks_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_skip_orks_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_CANYON_PATH_TO_LIBRARY_14") <= 2000))
	{
		return TRUE;
	};
};

func void dia_addon_skip_orks_info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_01");	//Sk�eti! Nen�vid�m tyhle bestie!
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SKIP_ALLRAZORSDEAD(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 1;
	condition = dia_addon_skip_allrazorsdead_condition;
	information = dia_addon_skip_allrazorsdead_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_skip_allrazorsdead_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (c_allcanyonrazordead() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_allrazorsdead_info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_03");	//Vypad� to, �e jsme dostali v�echny b�itvy.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_04");	//M��eme se tu je�t� trochu potulovat, jestli chce�.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_05");	//Tak dlouho dokud z�staneme v ka�onu.
	AI_StopProcessInfos(self);
};

