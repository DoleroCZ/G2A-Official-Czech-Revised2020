
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
	AI_Output(self,other,"DIA_Sekob_HALLO_01_00");	//Co dìláš na mém pozemku? Tady není nic, co bys mohl ukrást. Pakuj se.
	AI_Output(other,self,"DIA_Sekob_HALLO_15_01");	//Není v týhle zatracený zemi kousek pùdy, která by nikomu nepatøila?
	AI_Output(self,other,"DIA_Sekob_HALLO_01_02");	//Zaèni makat, pak ti možná jednoho dne bude taky nìjaká pùda patøit. Ale do té doby se poflakuj nìkde jinde.
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
	AI_Output(self,other,"DIA_Sekob_PermVorMis_01_01");	//Nemám pro tebe žádnou práci. A teï vypadni!
};


instance DIA_SEKOB_ZAHLPACHT(C_INFO)
{
	npc = bau_930_sekob;
	nr = 5;
	condition = dia_sekob_zahlpacht_condition;
	information = dia_sekob_zahlpacht_info;
	permanent = FALSE;
	description = "Onar chce, abys už koneènì zaplatil nájem.";
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
	AI_Output(other,self,"DIA_Sekob_ZAHLPACHT_15_00");	//Tahle pùda patøí velkostatkáøi. Jsi tady pouze nájemcem. Onar chce, abys mu zaplatil rentu. Dlužíš už za nìkolik týdnù.
	AI_Output(self,other,"DIA_Sekob_ZAHLPACHT_01_01");	//Co? A to poslal takovýho nièemu? Pøece ti nebudu vìøit.
	AI_Output(self,other,"DIA_Sekob_ZAHLPACHT_01_02");	//Vypadni odsud, nebo se neudržím.
	self.aivar[AIV_DEFEATEDBYPLAYER] = FALSE;
};


instance DIA_SEKOB_KOHLERAUS(C_INFO)
{
	npc = bau_930_sekob;
	nr = 5;
	condition = dia_sekob_kohleraus_condition;
	information = dia_sekob_kohleraus_info;
	permanent = TRUE;
	description = "Naval prachy, nebo dostaneš do zubù.";
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
	AI_Output(other,self,"DIA_Sekob_KohleRaus_15_00");	//Naval prachy, nebo dostaneš do zubù.
	AI_Output(self,other,"DIA_Sekob_KohleRaus_01_01");	//Ty se mi do šrajtofle nedostaneš, ty kriminálníku. TY NE!
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
	description = "Tak to mám dojem, že o tom povím Onarovi.";
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
	AI_Output(other,self,"DIA_Sekob_InformOnar_15_00");	//Tak to mám dojem, že o tom povím Onarovi.
	AI_Output(self,other,"DIA_Sekob_InformOnar_01_01");	//To je mi fuk! Mùžeš Onarovi øíct, že nic nemám. To je smutná pravda.
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
	description = "Kde jsou ty peníze!?!";
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
	AI_Output(other,self,"DIA_Sekob_Defeated_15_00");	//Kde jsou ty peníze!?!
	AI_Output(self,other,"DIA_Sekob_Defeated_01_01");	//Už mì nebij, prosím. Udìlám, co øekneš.
	AI_Output(other,self,"DIA_Sekob_Defeated_15_02");	//Tak zapla nájem.
	AI_Output(self,other,"DIA_Sekob_Defeated_01_03");	//O(naøíkavì) Ale pane, já nic nemám. Jsem jen chudý ubožák, co skoro umírá hlady.
	AI_Output(self,other,"DIA_Sekob_Defeated_01_04");	//Moje úroda celá uschla. CHTÌL bych zaplatit, ale já prostì nemám èím. Smùla.
	Info_ClearChoices(dia_sekob_defeated);
	Info_AddChoice(dia_sekob_defeated,"Buï ten nájem zaplatíš hned teï, nebo tì zabiju.",dia_sekob_defeated_hart);
	Info_AddChoice(dia_sekob_defeated,"Fajn, øeknu to Onarovi..",dia_sekob_defeated_weich);
};

func void dia_sekob_defeated_weich()
{
	AI_Output(other,self,"DIA_Sekob_Defeated_weich_15_00");	//Fajn, øeknu to Onarovi.
	AI_Output(self,other,"DIA_Sekob_Defeated_weich_01_01");	//Díky, pane. Tisíceré díky!
	MIS_SEKOB_REDEMITONAR = LOG_RUNNING;
	AI_StopProcessInfos(self);
};

func void b_sekob_kassieren()
{
	AI_Output(other,self,"DIA_Sekob_Kassieren_15_00");	//Pøestaò s tìmi žvásty. Celou dobu tu pršelo a máš plné sýpky. Zapla hned teï, nebo tì zabiju.
	AI_Output(self,other,"DIA_Sekob_Kassieren_01_01");	//(podlézavì) Ne, prosím, tady je zlato. Ještì ti pøidám, když mì necháš naživu.
	b_giveinvitems(self,other,itmi_gold,60);
	AI_Output(other,self,"DIA_Sekob_Kassieren_15_02");	//Ani to nebolelo, co?
	AI_Output(self,other,"DIA_Sekob_Kassieren_01_03");	//(zoufale) Jsem na mizinì.
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
	description = "K té rentì..";
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
	AI_Output(other,self,"DIA_Sekob_Again_15_00");	//K té rentì...
	AI_Output(self,other,"DIA_Sekob_Again_01_01");	//Mluvil jsi s Onarem, pravda?
	Info_ClearChoices(dia_sekob_again);
	Info_AddChoice(dia_sekob_again,"Zmìnil jsem názor.",dia_sekob_again_nein);
	if(ONAR_WEGENSEKOB == TRUE)
	{
		Info_AddChoice(dia_sekob_again,"Byl jsem ... ",dia_sekob_again_verarscht);
	}
	else
	{
		Info_AddChoice(dia_sekob_again,"Jasnì.",dia_sekob_again_ja);
	};
};

func void dia_sekob_again_nein()
{
	AI_Output(other,self,"DIA_Sekob_Again_Nein_15_00");	//Zmìnil jsem názor.
	b_sekob_kassieren();
};

func void dia_sekob_again_ja()
{
	AI_Output(other,self,"DIA_Sekob_Again_Ja_15_00");	//Jasnì.
	AI_Output(self,other,"DIA_Sekob_Again_Ja_01_01");	//Mùžeš to udìlat.
	AI_StopProcessInfos(self);
};

func void dia_sekob_again_verarscht()
{
	MIS_SEKOB_REDEMITONAR = LOG_SUCCESS;
	AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_00");	//Byl jsem...
	AI_Output(self,other,"DIA_Sekob_Again_verarscht_01_01");	//A? Co øíkal?
	AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_02");	//Je mi líto, ale teï tì musím pøipravit o hlavu.
	AI_Output(self,other,"DIA_Sekob_Again_verarscht_01_03");	//Ale proè? Co jsem udìlal?
	AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_04");	//Hráls to na mì.
	AI_Output(self,other,"DIA_Sekob_Again_verarscht_01_05");	//Mluvil jsem pravdu - pøísahám!
	b_sekob_kassieren();
};


instance DIA_SEKOB_PERMKAP1(C_INFO)
{
	npc = bau_930_sekob;
	nr = 6;
	condition = dia_sekob_permkap1_condition;
	information = dia_sekob_permkap1_info;
	permanent = TRUE;
	description = "Pøíštì už zaplatíš vèas, jasný?";
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
	AI_Output(other,self,"DIA_Sekob_PERMKAP1_15_00");	//Pøíštì už zaplatíš vèas, jasný?
	AI_Output(self,other,"DIA_Sekob_PERMKAP1_01_01");	//(pro sebe) Èím jsem si tohle zasloužil...
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
	description = "Nìco se stalo?";
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
	AI_Output(other,self,"DIA_Sekob_DMT_15_00");	//Nìco se stalo?
	AI_Output(self,other,"DIA_Sekob_DMT_01_01");	//Budeš mi muset pomoct. Ty postavy v èerné kápi vpadly do mého domu.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_02");	//Vy, lidé z královské gardy, byste se mìli postarat o to, aby se všichni mìli dobøe, ne?
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_03");	//Vím, že vy žoldáci se moc o charitu nezajímáte, ale mùžu ti zaplatit.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_04");	//Budeš mi muset pomoct, vážený pane mágu.
	};
	AI_Output(self,other,"DIA_Sekob_DMT_01_05");	//Ti chlápkové øíkali, že nìco hledají. Ale urèitì ne v mém domì.
	AI_Output(self,other,"DIA_Sekob_DMT_01_06");	//Prosím, pomoz mi. Zaøiï, a vypadnou.
	Log_CreateTopic(TOPIC_SEKOBDMT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SEKOBDMT,LOG_RUNNING);
	b_logentry(TOPIC_SEKOBDMT,"Èerní mágové vyhnali Sekoba z domu a já mám teï vypudit je.");
};


instance DIA_SEKOB_DMTWEG(C_INFO)
{
	npc = bau_930_sekob;
	nr = 31;
	condition = dia_sekob_dmtweg_condition;
	information = dia_sekob_dmtweg_info;
	description = "Tvùj dùm je prázdný. Èerné kápì už vypadly.";
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
	AI_Output(other,self,"DIA_Sekob_DMTWEG_15_00");	//Tvùj dùm je prázdný. Èerné kápì už vypadly.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_01");	//Vìdìl jsem, že na stráž se dá spolehnout.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_02");	//Udìlals poøádný kus práce. Onar mùže být rád, že má na své stranì lidi jako ty.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_03");	//Díky, vážený pane mágu. Co by s námi bylo, kdybychom nad sebou nemìli ochranou ruku církve?
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
	description = "Ne tak rychle, pøíteli";
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
	AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_00");	//Ne tak rychle, pøíteli.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		if(Npc_KnowsInfo(other,dia_rosi_wasmachstdu))
		{
			AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_01");	//Od teï už nepatøíš k tý špinavý lùze a místo toho se budeš èinit pro obecné blaho. Jinak si na tebe došlápnu.
		};
		AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_02");	//Nerozumím. Co ještì chceš?
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_03");	//Nìco jsi blábolil o odmìnì, ne? Nebo jsem jen slyšel trávu rùst?
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_04");	//Zajímá mì jen jediná vìc. Co chtìly ty èerné kápì ve tvém domì?
		AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_05");	//Sám si to nedokážu vysvìtlit, vážený pane mágu. Snad...
		AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_06");	//Co?
		AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_07");	//Je mi líto. Pøed nìkolika lety jsem pøísahal, že o tom nebudu mluvit, a nemám v úmyslu porušit své slovo.
	};
	AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_08");	//Jediné, co mùžu udìlat, je, že ti dám trochu zlata a požádám tì, abys mì ušetøil.
	AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_09");	//Tak to sem teda dej. Spìchám.
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
	description = "Stalo se tu mezitím nìco?";
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
		AI_Output(other,self,"DIA_Sekob_PERM_15_00");	//Stalo se tu mezitím nìco?
		if(MIS_BRINGROSIBACKTOSEKOB == LOG_FAILED)
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_01");	//Zmizni.
		}
		else if(MIS_BRINGROSIBACKTOSEKOB == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_02");	//Ne. Nic zvláštního.
		}
		else if((KAPITEL >= 5) && (MIS_BRINGROSIBACKTOSEKOB != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_03");	//Moje žena zmizela. Nejdøív jsem si toho vùbec nevšiml a pak najednou byla pryè.
			AI_Output(self,other,"DIA_Sekob_PERM_01_04");	//Nejspíš se schovala v lese, aby unikla polním škùdcùm.
			AI_Output(self,other,"DIA_Sekob_PERM_01_05");	//Udìlej mi laskavost, když ji najdeš, vra mi ji živou a zdravou.
			MIS_BRINGROSIBACKTOSEKOB = LOG_RUNNING;
			Log_CreateTopic(TOPIC_BRINGROSIBACKTOSEKOB,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BRINGROSIBACKTOSEKOB,LOG_RUNNING);
			b_logentry(TOPIC_BRINGROSIBACKTOSEKOB,"Sekobova žena Rosi zmizela a její muž by byl rád, kdyby jí nìkdo pomohl k návratu.");
		}
		else
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_06");	//Nic, od té doby, co jsou ti nièemové v èerném nastìhovaní v mém domì.
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
	description = "Máš problém.";
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
	AI_Output(other,self,"DIA_Sekob_Heilung_15_00");	//Máš problém.
	if(DIA_SEKOB_HEILUNG_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Sekob_Heilung_01_01");	//Jo, to teda mám. TY jsi mùj problém, ty mizernej mágu. Vypadni, nebo z tebe stáhnu kùži za živa.
		AI_Output(other,self,"DIA_Sekob_Heilung_15_02");	//(pro sebe) To je teda tìžkej pøípad.
		b_npcclearobsessionbydmt(self);
		DIA_SEKOB_HEILUNG_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sekob_Heilung_01_03");	//Ty prostì neposlechneš, co?
		AI_Output(other,self,"DIA_Sekob_Heilung_15_04");	//(pro sebe) Beznadìjnej pøípad.
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
	description = "Pøivedl jsem ti zpìt tvou ženu.";
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
	AI_Output(other,self,"DIA_Sekob_ROSIBACKATSEKOB_15_00");	//Pøivedl jsem ti zpìt tvou ženu.
	AI_Output(self,other,"DIA_Sekob_ROSIBACKATSEKOB_01_01");	//To je bájeèný. Tady, vezmi si to za svoji námahu.
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
	description = "Rosi už se k tobì nikdy nevrátí. Vzal jsem ji na bezpeèné místo.";
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
	AI_Output(other,self,"DIA_Sekob_ROSINEVERBACK_15_00");	//Rosi už se k tobì nikdy nevrátí. Vzal jsem ji na bezpeèné místo.
	AI_Output(self,other,"DIA_Sekob_ROSINEVERBACK_01_01");	//Bezpeèné? Pøed kým?
	AI_Output(other,self,"DIA_Sekob_ROSINEVERBACK_15_02");	//Pøed tebou.
	AI_Output(self,other,"DIA_Sekob_ROSINEVERBACK_01_03");	//Toho budeš litovat, ty svinì.
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

