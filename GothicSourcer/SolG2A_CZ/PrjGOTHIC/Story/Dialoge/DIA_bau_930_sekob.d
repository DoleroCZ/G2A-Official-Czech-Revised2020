
instance DIA_SEKOB_EXIT(C_INFO)
{
	npc = bau_930_sekob;
	nr = 999;
	condition = dia_sekob_exit_condition;
	information = dia_sekob_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sekob_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_sekob_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SEKOB_HALLO(C_INFO)
{
	npc = bau_930_sekob;
	nr = 3;
	condition = dia_sekob_hallo_condition;
	information = dia_sekob_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sekob_hallo_condition()
{
	if((KAPITEL < 3) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sekob_hallo_info()
{
	AI_Output(self,other,"DIA_Sekob_HALLO_01_00");	//Co d�l� na m�m pozemku? Tady nen� nic, co bys mohl ukr�st. Pakuj se.
	AI_Output(other,self,"DIA_Sekob_HALLO_15_01");	//Nen� v t�hle zatracen� zemi kousek p�dy, kter� by nikomu nepat�ila?
	AI_Output(self,other,"DIA_Sekob_HALLO_01_02");	//Za�ni makat, pak ti mo�n� jednoho dne bude taky n�jak� p�da pat�it. Ale do t� doby se poflakuj n�kde jinde.
};


instance DIA_SEKOB_PERMVORMIS(C_INFO)
{
	npc = bau_930_sekob;
	nr = 3;
	condition = dia_sekob_permvormis_condition;
	information = dia_sekob_permvormis_info;
	permanent = TRUE;
	description = "Poslouchej... ";
};


func int dia_sekob_permvormis_condition()
{
	if((KAPITEL < 3) && (MIS_TORLOF_HOLPACHTVONSEKOB == FALSE))
	{
		return TRUE;
	};
};

func void dia_sekob_permvormis_info()
{
	AI_Output(other,self,"DIA_Sekob_PermVorMis_15_00");	//Poslouchej...
	AI_Output(self,other,"DIA_Sekob_PermVorMis_01_01");	//Nem�m pro tebe ��dnou pr�ci. A te� vypadni!
};


instance DIA_SEKOB_ZAHLPACHT(C_INFO)
{
	npc = bau_930_sekob;
	nr = 5;
	condition = dia_sekob_zahlpacht_condition;
	information = dia_sekob_zahlpacht_info;
	permanent = FALSE;
	description = "Onar chce, abys u� kone�n� zaplatil n�jem.";
};


func int dia_sekob_zahlpacht_condition()
{
	if(MIS_TORLOF_HOLPACHTVONSEKOB == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_sekob_zahlpacht_info()
{
	AI_Output(other,self,"DIA_Sekob_ZAHLPACHT_15_00");	//Tahle p�da pat�� velkostatk��i. Jsi tady pouze n�jemcem. Onar chce, abys mu zaplatil rentu. Dlu�� u� za n�kolik t�dn�.
	AI_Output(self,other,"DIA_Sekob_ZAHLPACHT_01_01");	//Co? A to poslal takov�ho ni�emu? P�ece ti nebudu v��it.
	AI_Output(self,other,"DIA_Sekob_ZAHLPACHT_01_02");	//Vypadni odsud, nebo se neudr��m.
	self.aivar[AIV_DEFEATEDBYPLAYER] = FALSE;
};


instance DIA_SEKOB_KOHLERAUS(C_INFO)
{
	npc = bau_930_sekob;
	nr = 5;
	condition = dia_sekob_kohleraus_condition;
	information = dia_sekob_kohleraus_info;
	permanent = TRUE;
	description = "Naval prachy, nebo dostane� do zub�.";
};


func int dia_sekob_kohleraus_condition()
{
	if(Npc_KnowsInfo(other,dia_sekob_zahlpacht) && (self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sekob_kohleraus_info()
{
	AI_Output(other,self,"DIA_Sekob_KohleRaus_15_00");	//Naval prachy, nebo dostane� do zub�.
	AI_Output(self,other,"DIA_Sekob_KohleRaus_01_01");	//Ty se mi do �rajtofle nedostane�, ty krimin�ln�ku. TY NE!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SEKOB_INFORMONAR(C_INFO)
{
	npc = bau_930_sekob;
	nr = 5;
	condition = dia_sekob_informonar_condition;
	information = dia_sekob_informonar_info;
	permanent = FALSE;
	description = "Tak to m�m dojem, �e o tom pov�m Onarovi.";
};


func int dia_sekob_informonar_condition()
{
	if(Npc_KnowsInfo(other,dia_sekob_zahlpacht) && (self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sekob_informonar_info()
{
	AI_Output(other,self,"DIA_Sekob_InformOnar_15_00");	//Tak to m�m dojem, �e o tom pov�m Onarovi.
	AI_Output(self,other,"DIA_Sekob_InformOnar_01_01");	//To je mi fuk! M��e� Onarovi ��ct, �e nic nem�m. To je smutn� pravda.
	MIS_SEKOB_REDEMITONAR = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_SEKOB_DEFEATED(C_INFO)
{
	npc = bau_930_sekob;
	nr = 5;
	condition = dia_sekob_defeated_condition;
	information = dia_sekob_defeated_info;
	permanent = FALSE;
	description = "Kde jsou ty pen�ze!?!";
};


func int dia_sekob_defeated_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) && Npc_KnowsInfo(other,dia_sekob_zahlpacht) && (SEKOB_PACHTBEZAHLT == FALSE))
	{
		return TRUE;
	};
};

func void dia_sekob_defeated_info()
{
	AI_Output(other,self,"DIA_Sekob_Defeated_15_00");	//Kde jsou ty pen�ze!?!
	AI_Output(self,other,"DIA_Sekob_Defeated_01_01");	//U� m� nebij, pros�m. Ud�l�m, co �ekne�.
	AI_Output(other,self,"DIA_Sekob_Defeated_15_02");	//Tak zapla� n�jem.
	AI_Output(self,other,"DIA_Sekob_Defeated_01_03");	//O(na��kav�) Ale pane, j� nic nem�m. Jsem jen chud� ubo��k, co skoro um�r� hlady.
	AI_Output(self,other,"DIA_Sekob_Defeated_01_04");	//Moje �roda cel� uschla. CHT�L bych zaplatit, ale j� prost� nem�m ��m. Sm�la.
	Info_ClearChoices(dia_sekob_defeated);
	Info_AddChoice(dia_sekob_defeated,"Bu� ten n�jem zaplat� hned te�, nebo t� zabiju.",dia_sekob_defeated_hart);
	Info_AddChoice(dia_sekob_defeated,"Fajn, �eknu to Onarovi..",dia_sekob_defeated_weich);
};

func void dia_sekob_defeated_weich()
{
	AI_Output(other,self,"DIA_Sekob_Defeated_weich_15_00");	//Fajn, �eknu to Onarovi.
	AI_Output(self,other,"DIA_Sekob_Defeated_weich_01_01");	//D�ky, pane. Tis�cer� d�ky!
	MIS_SEKOB_REDEMITONAR = LOG_RUNNING;
	AI_StopProcessInfos(self);
};

func void b_sekob_kassieren()
{
	AI_Output(other,self,"DIA_Sekob_Kassieren_15_00");	//P�esta� s t�mi �v�sty. Celou dobu tu pr�elo a m� pln� s�pky. Zapla� hned te�, nebo t� zabiju.
	AI_Output(self,other,"DIA_Sekob_Kassieren_01_01");	//(podl�zav�) Ne, pros�m, tady je zlato. Je�t� ti p�id�m, kdy� m� nech� na�ivu.
	b_giveinvitems(self,other,itmi_gold,60);
	AI_Output(other,self,"DIA_Sekob_Kassieren_15_02");	//Ani to nebolelo, co?
	AI_Output(self,other,"DIA_Sekob_Kassieren_01_03");	//(zoufale) Jsem na mizin�.
	SEKOB_PACHTBEZAHLT = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_sekob_defeated_hart()
{
	b_sekob_kassieren();
};


instance DIA_SEKOB_AGAIN(C_INFO)
{
	npc = bau_930_sekob;
	nr = 5;
	condition = dia_sekob_again_condition;
	information = dia_sekob_again_info;
	permanent = TRUE;
	description = "K t� rent�..";
};


func int dia_sekob_again_condition()
{
	if((MIS_SEKOB_REDEMITONAR == LOG_RUNNING) && Npc_KnowsInfo(other,dia_sekob_defeated) && (SEKOB_PACHTBEZAHLT == FALSE))
	{
		return TRUE;
	};
};

func void dia_sekob_again_info()
{
	AI_Output(other,self,"DIA_Sekob_Again_15_00");	//K t� rent�...
	AI_Output(self,other,"DIA_Sekob_Again_01_01");	//Mluvil jsi s Onarem, pravda?
	Info_ClearChoices(dia_sekob_again);
	Info_AddChoice(dia_sekob_again,"Zm�nil jsem n�zor.",dia_sekob_again_nein);
	if(ONAR_WEGENSEKOB == TRUE)
	{
		Info_AddChoice(dia_sekob_again,"Byl jsem ... ",dia_sekob_again_verarscht);
	}
	else
	{
		Info_AddChoice(dia_sekob_again,"Jasn�.",dia_sekob_again_ja);
	};
};

func void dia_sekob_again_nein()
{
	AI_Output(other,self,"DIA_Sekob_Again_Nein_15_00");	//Zm�nil jsem n�zor.
	b_sekob_kassieren();
};

func void dia_sekob_again_ja()
{
	AI_Output(other,self,"DIA_Sekob_Again_Ja_15_00");	//Jasn�.
	AI_Output(self,other,"DIA_Sekob_Again_Ja_01_01");	//M��e� to ud�lat.
	AI_StopProcessInfos(self);
};

func void dia_sekob_again_verarscht()
{
	MIS_SEKOB_REDEMITONAR = LOG_SUCCESS;
	AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_00");	//Byl jsem...
	AI_Output(self,other,"DIA_Sekob_Again_verarscht_01_01");	//A? Co ��kal?
	AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_02");	//Je mi l�to, ale te� t� mus�m p�ipravit o hlavu.
	AI_Output(self,other,"DIA_Sekob_Again_verarscht_01_03");	//Ale pro�? Co jsem ud�lal?
	AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_04");	//Hr�ls to na m�.
	AI_Output(self,other,"DIA_Sekob_Again_verarscht_01_05");	//Mluvil jsem pravdu - p��sah�m!
	b_sekob_kassieren();
};


instance DIA_SEKOB_PERMKAP1(C_INFO)
{
	npc = bau_930_sekob;
	nr = 6;
	condition = dia_sekob_permkap1_condition;
	information = dia_sekob_permkap1_info;
	permanent = TRUE;
	description = "P��t� u� zaplat� v�as, jasn�?";
};


func int dia_sekob_permkap1_condition()
{
	if((SEKOB_PACHTBEZAHLT == TRUE) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_sekob_permkap1_info()
{
	AI_Output(other,self,"DIA_Sekob_PERMKAP1_15_00");	//P��t� u� zaplat� v�as, jasn�?
	AI_Output(self,other,"DIA_Sekob_PERMKAP1_01_01");	//(pro sebe) ��m jsem si tohle zaslou�il...
	AI_StopProcessInfos(self);
};


instance DIA_SEKOB_KAP3_EXIT(C_INFO)
{
	npc = bau_930_sekob;
	nr = 999;
	condition = dia_sekob_kap3_exit_condition;
	information = dia_sekob_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sekob_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_sekob_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SEKOB_DMT(C_INFO)
{
	npc = bau_930_sekob;
	nr = 30;
	condition = dia_sekob_dmt_condition;
	information = dia_sekob_dmt_info;
	description = "N�co se stalo?";
};


func int dia_sekob_dmt_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_sekob_dmt_info()
{
	AI_Output(other,self,"DIA_Sekob_DMT_15_00");	//N�co se stalo?
	AI_Output(self,other,"DIA_Sekob_DMT_01_01");	//Bude� mi muset pomoct. Ty postavy v �ern� k�pi vpadly do m�ho domu.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_02");	//Vy, lid� z kr�lovsk� gardy, byste se m�li postarat o to, aby se v�ichni m�li dob�e, ne?
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_03");	//V�m, �e vy �old�ci se moc o charitu nezaj�m�te, ale m��u ti zaplatit.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_04");	//Bude� mi muset pomoct, v�en� pane m�gu.
	};
	AI_Output(self,other,"DIA_Sekob_DMT_01_05");	//Ti chl�pkov� ��kali, �e n�co hledaj�. Ale ur�it� ne v m�m dom�.
	AI_Output(self,other,"DIA_Sekob_DMT_01_06");	//Pros�m, pomoz mi. Za�i�, a� vypadnou.
	Log_CreateTopic(TOPIC_SEKOBDMT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SEKOBDMT,LOG_RUNNING);
	b_logentry(TOPIC_SEKOBDMT,"�ern� m�gov� vyhnali Sekoba z domu a j� m�m te� vypudit je.");
};


instance DIA_SEKOB_DMTWEG(C_INFO)
{
	npc = bau_930_sekob;
	nr = 31;
	condition = dia_sekob_dmtweg_condition;
	information = dia_sekob_dmtweg_info;
	description = "Tv�j d�m je pr�zdn�. �ern� k�p� u� vypadly.";
};


func int dia_sekob_dmtweg_condition()
{
	if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_sekob_dmt) && Npc_IsDead(dmt_dementorambientsekob1) && Npc_IsDead(dmt_dementorambientsekob2) && Npc_IsDead(dmt_dementorambientsekob3) && Npc_IsDead(dmt_dementorambientsekob4))
	{
		return TRUE;
	};
};

func void dia_sekob_dmtweg_info()
{
	AI_Output(other,self,"DIA_Sekob_DMTWEG_15_00");	//Tv�j d�m je pr�zdn�. �ern� k�p� u� vypadly.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_01");	//V�d�l jsem, �e na str� se d� spolehnout.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_02");	//Ud�lals po��dn� kus pr�ce. Onar m��e b�t r�d, �e m� na sv� stran� lidi jako ty.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_03");	//D�ky, v�en� pane m�gu. Co by s n�mi bylo, kdybychom nad sebou nem�li ochranou ruku c�rkve?
	};
	TOPIC_END_SEKOBDMT = TRUE;
	b_giveplayerxp(XP_SEKOBDMTWEG);
	if(KAPITEL < 5)
	{
		Npc_ExchangeRoutine(self,"Start");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Obsessed");
	};
	if(ROSI_FLEEFROMSEKOB_KAP5 == FALSE)
	{
		b_startotherroutine(rosi,"Start");
		b_startotherroutine(till,"Start");
	};
	b_startotherroutine(balthasar,"Start");
	b_startotherroutine(bau_933_rega,"Start");
	b_startotherroutine(bau_934_babera,"Start");
	b_startotherroutine(bau_937_bauer,"Start");
	b_startotherroutine(bau_938_bauer,"Start");
};


instance DIA_SEKOB_BELOHNUNG(C_INFO)
{
	npc = bau_930_sekob;
	nr = 32;
	condition = dia_sekob_belohnung_condition;
	information = dia_sekob_belohnung_info;
	description = "Ne tak rychle, p��teli";
};


func int dia_sekob_belohnung_condition()
{
	if(Npc_KnowsInfo(other,dia_sekob_dmtweg) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_sekob_belohnung_info()
{
	AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_00");	//Ne tak rychle, p��teli.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		if(Npc_KnowsInfo(other,dia_rosi_wasmachstdu))
		{
			AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_01");	//Od te� u� nepat�� k t� �pinav� l�ze a m�sto toho se bude� �init pro obecn� blaho. Jinak si na tebe do�l�pnu.
		};
		AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_02");	//Nerozum�m. Co je�t� chce�?
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_03");	//N�co jsi bl�bolil o odm�n�, ne? Nebo jsem jen sly�el tr�vu r�st?
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_04");	//Zaj�m� m� jen jedin� v�c. Co cht�ly ty �ern� k�p� ve tv�m dom�?
		AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_05");	//S�m si to nedok�u vysv�tlit, v�en� pane m�gu. Snad...
		AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_06");	//Co?
		AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_07");	//Je mi l�to. P�ed n�kolika lety jsem p��sahal, �e o tom nebudu mluvit, a nem�m v �myslu poru�it sv� slovo.
	};
	AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_08");	//Jedin�, co m��u ud�lat, je, �e ti d�m trochu zlata a po��d�m t�, abys m� u�et�il.
	AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_09");	//Tak to sem teda dej. Sp�ch�m.
	AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_10");	//Tady.
	CreateInvItems(self,itmi_gold,250);
	b_giveinvitems(self,other,itmi_gold,250);
	AI_StopProcessInfos(self);
};


instance DIA_SEKOB_PERM(C_INFO)
{
	npc = bau_930_sekob;
	nr = 80;
	condition = dia_sekob_perm_condition;
	information = dia_sekob_perm_info;
	permanent = TRUE;
	description = "Stalo se tu mezit�m n�co?";
};


func int dia_sekob_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_sekob_belohnung) && (KAPITEL >= 3) && (NPCOBSESSEDBYDMT_SEKOB == FALSE))
	{
		return TRUE;
	};
};

func void dia_sekob_perm_info()
{
	if((hero.guild == GIL_KDF) && (KAPITEL >= 5))
	{
		b_npcobsessedbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Sekob_PERM_15_00");	//Stalo se tu mezit�m n�co?
		if(MIS_BRINGROSIBACKTOSEKOB == LOG_FAILED)
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_01");	//Zmizni.
		}
		else if(MIS_BRINGROSIBACKTOSEKOB == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_02");	//Ne. Nic zvl�tn�ho.
		}
		else if((KAPITEL >= 5) && (MIS_BRINGROSIBACKTOSEKOB != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_03");	//Moje �ena zmizela. Nejd��v jsem si toho v�bec nev�iml a pak najednou byla pry�.
			AI_Output(self,other,"DIA_Sekob_PERM_01_04");	//Nejsp� se schovala v lese, aby unikla poln�m �k�dc�m.
			AI_Output(self,other,"DIA_Sekob_PERM_01_05");	//Ud�lej mi laskavost, kdy� ji najde�, vra� mi ji �ivou a zdravou.
			MIS_BRINGROSIBACKTOSEKOB = LOG_RUNNING;
			Log_CreateTopic(TOPIC_BRINGROSIBACKTOSEKOB,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BRINGROSIBACKTOSEKOB,LOG_RUNNING);
			b_logentry(TOPIC_BRINGROSIBACKTOSEKOB,"Sekobova �ena Rosi zmizela a jej� mu� by byl r�d, kdyby j� n�kdo pomohl k n�vratu.");
		}
		else
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_06");	//Nic, od t� doby, co jsou ti ni�emov� v �ern�m nast�hovan� v m�m dom�.
		};
	};
};


instance DIA_SEKOB_KAP4_EXIT(C_INFO)
{
	npc = bau_930_sekob;
	nr = 999;
	condition = dia_sekob_kap4_exit_condition;
	information = dia_sekob_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sekob_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_sekob_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SEKOB_KAP5_EXIT(C_INFO)
{
	npc = bau_930_sekob;
	nr = 999;
	condition = dia_sekob_kap5_exit_condition;
	information = dia_sekob_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sekob_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_sekob_kap5_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_SEKOB_HEILUNG(C_INFO)
{
	npc = bau_930_sekob;
	nr = 55;
	condition = dia_sekob_heilung_condition;
	information = dia_sekob_heilung_info;
	permanent = TRUE;
	description = "M� probl�m.";
};


func int dia_sekob_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_SEKOB == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF) && (KAPITEL >= 5))
	{
		return TRUE;
	};
};


var int dia_sekob_heilung_onetime;

func void dia_sekob_heilung_info()
{
	AI_Output(other,self,"DIA_Sekob_Heilung_15_00");	//M� probl�m.
	if(DIA_SEKOB_HEILUNG_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Sekob_Heilung_01_01");	//Jo, to teda m�m. TY jsi m�j probl�m, ty mizernej m�gu. Vypadni, nebo z tebe st�hnu k��i za �iva.
		AI_Output(other,self,"DIA_Sekob_Heilung_15_02");	//(pro sebe) To je teda t�kej p��pad.
		b_npcclearobsessionbydmt(self);
		DIA_SEKOB_HEILUNG_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sekob_Heilung_01_03");	//Ty prost� neposlechne�, co?
		AI_Output(other,self,"DIA_Sekob_Heilung_15_04");	//(pro sebe) Beznad�jnej p��pad.
		b_npcclearobsessionbydmt(self);
		b_attack(self,other,AR_NONE,1);
	};
};


instance DIA_SEKOB_ROSIBACKATSEKOB(C_INFO)
{
	npc = bau_930_sekob;
	nr = 53;
	condition = dia_sekob_rosibackatsekob_condition;
	information = dia_sekob_rosibackatsekob_info;
	description = "P�ivedl jsem ti zp�t tvou �enu.";
};


func int dia_sekob_rosibackatsekob_condition()
{
	if((KAPITEL >= 5) && (hero.guild != GIL_KDF) && (Npc_GetDistToWP(rosi,"NW_FARM4_SEKOB") < 3000) && (MIS_BRINGROSIBACKTOSEKOB == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_sekob_rosibackatsekob_info()
{
	AI_Output(other,self,"DIA_Sekob_ROSIBACKATSEKOB_15_00");	//P�ivedl jsem ti zp�t tvou �enu.
	AI_Output(self,other,"DIA_Sekob_ROSIBACKATSEKOB_01_01");	//To je b�je�n�. Tady, vezmi si to za svoji n�mahu.
	MIS_BRINGROSIBACKTOSEKOB = LOG_SUCCESS;
	CreateInvItems(self,itmi_gold,650);
	b_giveinvitems(self,other,itmi_gold,650);
	b_giveplayerxp(XP_AMBIENT);
	b_npcclearobsessionbydmt(self);
	b_startotherroutine(rosi,"Start");
	b_startotherroutine(till,"Start");
};


instance DIA_SEKOB_ROSINEVERBACK(C_INFO)
{
	npc = bau_930_sekob;
	nr = 56;
	condition = dia_sekob_rosineverback_condition;
	information = dia_sekob_rosineverback_info;
	description = "Rosi u� se k tob� nikdy nevr�t�. Vzal jsem ji na bezpe�n� m�sto.";
};


func int dia_sekob_rosineverback_condition()
{
	if((MIS_BRINGROSIBACKTOSEKOB == LOG_OBSOLETE) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_sekob_rosineverback_info()
{
	AI_Output(other,self,"DIA_Sekob_ROSINEVERBACK_15_00");	//Rosi u� se k tob� nikdy nevr�t�. Vzal jsem ji na bezpe�n� m�sto.
	AI_Output(self,other,"DIA_Sekob_ROSINEVERBACK_01_01");	//Bezpe�n�? P�ed k�m?
	AI_Output(other,self,"DIA_Sekob_ROSINEVERBACK_15_02");	//P�ed tebou.
	AI_Output(self,other,"DIA_Sekob_ROSINEVERBACK_01_03");	//Toho bude� litovat, ty svin�.
	b_npcclearobsessionbydmt(self);
	b_attack(self,other,AR_NONE,1);
	b_giveplayerxp(XP_AMBIENT);
	MIS_BRINGROSIBACKTOSEKOB = LOG_FAILED;
};


instance DIA_SEKOB_KAP6_EXIT(C_INFO)
{
	npc = bau_930_sekob;
	nr = 999;
	condition = dia_sekob_kap6_exit_condition;
	information = dia_sekob_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sekob_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_sekob_kap6_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_SEKOB_PICKPOCKET(C_INFO)
{
	npc = bau_930_sekob;
	nr = 900;
	condition = dia_sekob_pickpocket_condition;
	information = dia_sekob_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_sekob_pickpocket_condition()
{
	return c_beklauen(75,230);
};

func void dia_sekob_pickpocket_info()
{
	Info_ClearChoices(dia_sekob_pickpocket);
	Info_AddChoice(dia_sekob_pickpocket,DIALOG_BACK,dia_sekob_pickpocket_back);
	Info_AddChoice(dia_sekob_pickpocket,DIALOG_PICKPOCKET,dia_sekob_pickpocket_doit);
};

func void dia_sekob_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sekob_pickpocket);
};

func void dia_sekob_pickpocket_back()
{
	Info_ClearChoices(dia_sekob_pickpocket);
};

