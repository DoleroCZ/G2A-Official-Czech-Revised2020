
instance DIA_DAR_EXIT(C_INFO)
{
	npc = sld_810_dar;
	nr = 999;
	condition = dia_dar_exit_condition;
	information = dia_dar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_dar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DAR_HALLO(C_INFO)
{
	npc = sld_810_dar;
	nr = 1;
	condition = dia_dar_hallo_condition;
	information = dia_dar_hallo_info;
	permanent = FALSE;
	description = "Co to tu kouøíš?";
};


func int dia_dar_hallo_condition()
{
	return TRUE;
};

func void dia_dar_hallo_info()
{
	AI_Output(other,self,"DIA_Dar_Hallo_15_00");	//Co to tu kouøíš?
	AI_Output(self,other,"DIA_Dar_Hallo_03_01");	//Chceš šluka?
	Info_ClearChoices(dia_dar_hallo);
	Info_AddChoice(dia_dar_hallo,"Ne.",dia_dar_hallo_nein);
	Info_AddChoice(dia_dar_hallo,"Jasnì.",dia_dar_hallo_ja);
};

func void dia_dar_hallo_ja()
{
	AI_Output(other,self,"DIA_Dar_Hallo_Ja_15_00");	//Jasnì.
	CreateInvItem(other,itmi_joint);
	b_useitem(other,itmi_joint);
	AI_Output(self,other,"DIA_Dar_Hallo_Ja_03_01");	//Není špatná, co?
	AI_Output(other,self,"DIA_Dar_Hallo_Ja_15_02");	//Kde jsi tenhle matroš sehnal?
	CreateInvItem(self,itmi_joint);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Dar_Hallo_Ja_03_03");	//(køení se) Mám své zdroje.
	Info_ClearChoices(dia_dar_hallo);
};

func void dia_dar_hallo_nein()
{
	AI_Output(other,self,"DIA_Dar_Hallo_Nein_15_00");	//Ne.
	Info_ClearChoices(dia_dar_hallo);
};


var int dar_einmal;

instance DIA_DAR_PERM(C_INFO)
{
	npc = sld_810_dar;
	nr = 2;
	condition = dia_dar_perm_condition;
	information = dia_dar_perm_info;
	permanent = TRUE;
	description = "Dìláš taky kromì hulení nìco jinıho?";
};


func int dia_dar_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_dar_hallo))
	{
		return TRUE;
	};
};

func void dia_dar_perm_info()
{
	AI_Output(other,self,"DIA_Dar_PERM_15_00");	//Dìláš taky kromì hulení nìco jinıho?
	if((DAR_LOSTAGAINSTCIPHER == TRUE) && (DAR_EINMAL == FALSE))
	{
		AI_Output(self,other,"DIA_Dar_PERM_03_01");	//(sarkasticky) Nìkdy se nechám zmlátit od nìkolika pomstychtivıch feákù kvùli tıhle trávì...
		DAR_EINMAL = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_PERM_03_02");	//V tuhle chvíli ne.
	};
};


instance DIA_DAR_WANNAJOIN(C_INFO)
{
	npc = sld_810_dar;
	nr = 3;
	condition = dia_dar_wannajoin_condition;
	information = dia_dar_wannajoin_info;
	permanent = FALSE;
	description = "Chci se pøidat k oldákùm. Bude ti to vadit?";
};


func int dia_dar_wannajoin_condition()
{
	if(Npc_KnowsInfo(other,dia_dar_hallo) && (other.guild == GIL_NONE) && (DAR_LOSTAGAINSTCIPHER == FALSE))
	{
		return TRUE;
	};
};

func void dia_dar_wannajoin_info()
{
	AI_Output(other,self,"DIA_Dar_WannaJoin_15_00");	//Chci se pøidat k oldákùm. Bude ti to vadit?
	AI_Output(self,other,"DIA_Dar_WannaJoin_03_01");	//Je mi to jedno.
};


instance DIA_DAR_DUDIEB(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_dudieb_condition;
	information = dia_dar_dudieb_info;
	permanent = FALSE;
	description = "Cipher mi øekl, e mu nìkdo ukradnul jeho balíèek trávy.";
};


func int dia_dar_dudieb_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_tradewhat) && (MIS_CIPHER_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_dar_dudieb_info()
{
	AI_Output(other,self,"DIA_Dar_DuDieb_15_00");	//Cipher mi øekl, e mu nìkdo ukradnul jeho balíèek trávy.
	AI_Output(self,other,"DIA_Dar_DuDieb_03_01");	//(debilnì a tlumenì se smìje)
	AI_Output(other,self,"DIA_Dar_DuDieb_15_02");	//Nevíš o tom nìco?
	AI_Output(self,other,"DIA_Dar_DuDieb_03_03");	//(velmi krátce) Ne.
	DAR_VERDACHT = TRUE;
};


instance DIA_DAR_WOPAKET(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_wopaket_condition;
	information = dia_dar_wopaket_info;
	permanent = TRUE;
	description = "Kde je ten balíèek?";
};


func int dia_dar_wopaket_condition()
{
	if(Npc_KnowsInfo(other,dia_dar_dudieb) && (DAR_DIEB == FALSE) && (MIS_CIPHER_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_dar_wopaket_info()
{
	AI_Output(other,self,"DIA_Dar_WoPaket_15_00");	//(vıhrùnì) Kde je ten balíèek?
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Dar_WoPaket_03_01");	//Dobøe, dobøe, dobøe. Prodal jsem ho nìjakımu pobudovi ve mìstì.
		AI_Output(self,other,"DIA_Dar_WoPaket_03_02");	//Bylo to v pøístavu. Nemùu si vzpomenout, jak vypadal.
		AI_Output(other,self,"DIA_Dar_WoPaket_15_03");	//Vypadá to, e potøebuješ další vıprask?
		AI_Output(self,other,"DIA_Dar_WoPaket_03_04");	//Upøímnì, chlape, byl jsem totálnì zfetovanej. Nemám nejmenší ponìtí jak ten chlápek vypadal.
		AI_Output(self,other,"DIA_Dar_WoPaket_03_05");	//Bylo to v pøístavu blízko stavitelù lodí. To je všechno, na co si vzpomínám.
		DAR_DIEB = TRUE;
		b_logentry(TOPIC_CIPHERPAKET,"Dar se pøiznal, e balík s trávou ukradl on. Prodal jej v khorinisské pøístavní ètvrti, hned vedle loïaøovy dílny.");
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_WoPaket_03_06");	//Co já vím?
	};
};


instance DIA_DAR_AUFSMAUL(C_INFO)
{
	npc = sld_810_dar;
	nr = 5;
	condition = dia_dar_aufsmaul_condition;
	information = dia_dar_aufsmaul_info;
	permanent = FALSE;
	description = "Já to z tebe vymlátím!";
};


func int dia_dar_aufsmaul_condition()
{
	if(Npc_KnowsInfo(other,dia_dar_dudieb) && (DAR_DIEB == FALSE) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_LOST))
	{
		return TRUE;
	};
};

func void dia_dar_aufsmaul_info()
{
	AI_Output(other,self,"DIA_Dar_AufsMaul_15_00");	//Já to z tebe vymlátím!
	AI_Output(self,other,"DIA_Dar_AufsMaul_03_01");	//Klídek. Jsem moc zhulenej na to, abych s tebou bojoval!
	b_giveinvitems(self,other,itmi_joint,1);
	AI_Output(self,other,"DIA_Dar_AufsMaul_03_02");	//Na, dej si nejdøív velkıho šluka!
};


instance DIA_DAR_KAMERADENSCHWEIN(C_INFO)
{
	npc = sld_810_dar;
	nr = 1;
	condition = dia_dar_kameradenschwein_condition;
	information = dia_dar_kameradenschwein_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dar_kameradenschwein_condition()
{
	if(DAR_LOSTAGAINSTCIPHER == TRUE)
	{
		self.aivar[AIV_LASTFIGHTCOMMENT] = FALSE;
		return TRUE;
	};
};

func void dia_dar_kameradenschwein_info()
{
	AI_Output(self,other,"DIA_Dar_Kameradenschwein_03_00");	//Kecale! Øekl jsi Cipherovi, e jsem mu vzal jeho trávu!
	if(Npc_KnowsInfo(other,dia_dar_wannajoin) && (other.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Dar_Kameradenschwein_03_01");	//Nebudu pro tebe hlasovat.
	};
};


instance DIA_DAR_PILZTABAK(C_INFO)
{
	npc = sld_810_dar;
	nr = 6;
	condition = dia_dar_pilztabak_condition;
	information = dia_dar_pilztabak_info;
	permanent = FALSE;
	description = "U jsi nìkdy balil tabák?";
};


func int dia_dar_pilztabak_condition()
{
	if(Npc_HasItems(other,itmi_pilztabak) > 0)
	{
		return TRUE;
	};
};

func void dia_dar_pilztabak_info()
{
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_00");	//U jsi nìkdy balil tabák?
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_01");	//To zní zajímavì. Dej to sem.
	b_giveinvitems(other,self,itmi_pilztabak,1);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_02");	//Jasnì, jdeme na to.
	CreateInvItem(self,itmi_joint);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_03");	//U jsi nìkdy kouøil takovejhle materiálek?
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_04");	//No...
	CreateInvItem(self,itmi_joint);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_05");	//Kouøil, nebo nekouøil?
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_06");	//Nìjak jsem se k tomu nedostal...
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_07");	//Kurva!
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_08");	//Svatı Rhobare!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_09");	//Tenhle matroš je dost krutej! Vùbec to nezkoušej!
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_DAR_KAP3_EXIT(C_INFO)
{
	npc = sld_810_dar;
	nr = 999;
	condition = dia_dar_kap3_exit_condition;
	information = dia_dar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_dar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DAR_KAP4_EXIT(C_INFO)
{
	npc = sld_810_dar;
	nr = 999;
	condition = dia_dar_kap4_exit_condition;
	information = dia_dar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_dar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DAR_ORCRING(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_orcring_condition;
	information = dia_dar_orcring_info;
	description = "Vypadá to, e tu chybí nìjací oldáci.";
};


func int dia_dar_orcring_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_dar_orcring_info()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_15_00");	//Vypadá to, e tu chybí nìjací oldáci.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_01");	//Jistì. To je pravda. Sylvio je na míle daleko a vzal pùlku posádky s sebou.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_02");	//To je jedno. Mám alespoò lepší šanci stát se jedním z Leeovıch chlapcù. Všechno, co potøebuju, je se porvat.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_03");	//Kdybych mohl dokázat, e jsem skuteènì ostrej chlápek, moná bych se dokonce mohl stát jedním z Leeovıch tìlesnıch strácù.
	Info_ClearChoices(dia_dar_orcring);
	Info_AddChoice(dia_dar_orcring,"To mì neznepokojuje.",dia_dar_orcring_no);
	Info_AddChoice(dia_dar_orcring,"Ostrej chlápek? Ty?",dia_dar_orcring_necken);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF))
	{
		Info_AddChoice(dia_dar_orcring,"Co by to mìlo bıt?",dia_dar_orcring_wie);
	};
};

func void dia_dar_orcring_necken()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_15_00");	//Ostrej chlápek? Ty?
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_01");	//(naštvanì) Oj, ale no tak, sklapni. Kdopak jsi ve skuteènosti?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_02");	//Nìjakej nafoukanej trouba z mìsta. Vy chcípáci nemáte nic, co byste mohli nabídnout.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_03");	//Jsi tu jenom pár dní a u máš takovıhle kecy.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_04");	//Koho si myslíš, e tìma svejma blbejma magickıma kecama vystrašíš? Mì teda rozhodnì ne.
	};
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_05");	//Kdy o tom tak pøemıšlím, rozbití tvojí lebky je pøesnì to, èím bych si mohl u Leeovım chlapcù vyslouit ten správnı respekt.
		Info_ClearChoices(dia_dar_orcring);
		Info_AddChoice(dia_dar_orcring,"INemám èas na tyhle kecy.",dia_dar_orcring_necken_no);
		Info_AddChoice(dia_dar_orcring,"OK. Tak to zkus.",dia_dar_orcring_necken_schlagen);
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_06");	//Tak poèkej. Najdu si zpùsob, jak udìlat na Leeho dojem.
	};
};


var int dar_fightagainstpaladin;

func void dia_dar_orcring_necken_schlagen()
{
	DAR_FIGHTAGAINSTPALADIN = TRUE;
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_schlagen_15_00");	//Fajn. Tak to zkus.
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_schlagen_03_01");	//Ooch, nemùu èekat.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_dar_orcring_necken_no()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_no_15_00");	//Nemám èas na tyhle kecy.
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_no_03_01");	//Jo, jasnì. Zapomnìl jsem, rytíø spravedlnosti bez báznì a hany. To je zlı. Myslel jsem, e máš víc kuráe.
	AI_StopProcessInfos(self);
};

func void dia_dar_orcring_wie()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_wie_15_00");	//Co by to mìlo bıt?
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_01");	//Nevím pøesnì. Nìjaká skøetí trofej by nebyla k zahození.
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_02");	//Tøeba odznak od vùdce skøetù nebo nìco takového. Prapor, prsten, nebo tak nìco.
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_03");	//S nièím menším tady prorazit nejde. To je zøejmé.
	Log_CreateTopic(TOPIC_DAR_BRINGORCELITERING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DAR_BRINGORCELITERING,LOG_RUNNING);
	b_logentry(TOPIC_DAR_BRINGORCELITERING,"Dar se chce stát pohlavárem oldnéøù, a k tomu potøebuje nìjakou skøetí trofej. Praporec, nárameník, prsten nebo nìco takového.");
	MIS_DAR_BRINGORCELITERING = LOG_RUNNING;
	Info_ClearChoices(dia_dar_orcring);
};

func void dia_dar_orcring_no()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_no_15_00");	//To mì neznepokojuje.
	AI_Output(self,other,"DIA_Dar_ORCRING_no_03_01");	//(naštvanì) Samozøejmì, e ne. To by mì ohromilo.
	Info_ClearChoices(dia_dar_orcring);
};


instance DIA_DAR_FIGHTAGAINSTPALOVER(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_fightagainstpalover_condition;
	information = dia_dar_fightagainstpalover_info;
	important = TRUE;
};


func int dia_dar_fightagainstpalover_condition()
{
	if((DAR_FIGHTAGAINSTPALADIN == TRUE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_dar_fightagainstpalover_info()
{
	AI_Output(self,other,"DIA_Dar_FIGHTAGAINSTPALOVER_03_00");	//Jasnì, vím, e Lee nebude úplnì nadšenej, kdy se v tom s tebou budu zase angaovat.
	AI_Output(self,other,"DIA_Dar_FIGHTAGAINSTPALOVER_03_01");	//Nechci si tu nikoho znepøátelit, tak na ten nesmysl prostì zapomeòme, jo?
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};


instance DIA_DAR_BRINGORCELITERING(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_bringorcelitering_condition;
	information = dia_dar_bringorcelitering_info;
	description = "Mám tu skøetí trofej, jak jsi chtìl.";
};


func int dia_dar_bringorcelitering_condition()
{
	if((MIS_DAR_BRINGORCELITERING == LOG_RUNNING) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF)) && Npc_HasItems(other,itri_orcelitering))
	{
		return TRUE;
	};
};

func void dia_dar_bringorcelitering_info()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_15_00");	//Mám tu skøetí trofej, jak jsi chtìl.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_03_01");	//Cos mi to pøinesl?
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_15_02");	//Prsten skøetího vojevùdce.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_03_03");	//Fíha, no kdy je to tak... Co za to chceš?
	MIS_DAR_BRINGORCELITERING = LOG_SUCCESS;
	Info_ClearChoices(dia_dar_bringorcelitering);
	Info_AddChoice(dia_dar_bringorcelitering,"Co mi mùeš nabídnout?",dia_dar_bringorcelitering_was);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(dia_dar_bringorcelitering,"Dej mi nìjaké zlato.",dia_dar_bringorcelitering_geld);
	};
};

func void dia_dar_bringorcelitering_geld()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_15_00");	//Dej mi nìjaké zlato.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_01");	//Tøeba 600 zlaákù?
		AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_15_02");	//Kolik e?
	};
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_03");	//No dobøe, dám ti za to 1200 zlaákù.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_04");	//Buï ber, nebo si ten prsten nech.
	};
	Info_ClearChoices(dia_dar_bringorcelitering);
	Info_AddChoice(dia_dar_bringorcelitering,"To nestaèí.",dia_dar_bringorcelitering_geld_no);
	Info_AddChoice(dia_dar_bringorcelitering,"Dojednáno - tady je.",dia_dar_bringorcelitering_geld_ok);
};

func void dia_dar_bringorcelitering_geld_ok()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_ok_15_00");	//Dojednáno - tady je.
	b_giveinvitems(other,self,itri_orcelitering,1);
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_ok_03_01");	//Díky, u se nemùu doèkat, co na to øeknou ostatní.
	CreateInvItems(self,itmi_gold,1200);
	b_giveinvitems(self,other,itmi_gold,1200);
	b_giveplayerxp(XP_DAR_BRINGORCELITERING);
	Info_ClearChoices(dia_dar_bringorcelitering);
};

func void dia_dar_bringorcelitering_geld_no()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_no_15_00");	//To nestaèí.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_no_03_01");	//A já zase myslím, e je to nìjak moc. Bez uráky, tahle záleitost se mi zdá nìjak podezøelá.
	Info_ClearChoices(dia_dar_bringorcelitering);
};

func void dia_dar_bringorcelitering_was()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_was_15_00");	//Co mi mùeš nabídnout?
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_03_01");	//Buï si vezmi peníze, nebo tenhle amulet, kterı jsem... no, øeknìme e jsem jej pøed èasem nìjak získal.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_03_02");	//Zvyšuje obratnost, sám jsem to vyzkoušel.
	Info_ClearChoices(dia_dar_bringorcelitering);
	Info_AddChoice(dia_dar_bringorcelitering,"Dej mi nìjaké zlato.",dia_dar_bringorcelitering_geld);
	Info_AddChoice(dia_dar_bringorcelitering,"Dej mi ten amulet.",dia_dar_bringorcelitering_was_am);
};

func void dia_dar_bringorcelitering_was_am()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_was_am_15_00");	//Dej mi ten amulet.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_am_03_01");	//Jasòaèka, jen si ho uij. A teï naval ten prsten.
	b_giveinvitems(other,self,itri_orcelitering,1);
	CreateInvItems(self,itam_dex_01,1);
	b_giveinvitems(self,other,itam_dex_01,1);
	b_giveplayerxp(XP_DAR_BRINGORCELITERING);
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_am_03_02");	//Tìšilo mì.
	Info_ClearChoices(dia_dar_bringorcelitering);
};


instance DIA_DAR_KAP5_EXIT(C_INFO)
{
	npc = sld_810_dar;
	nr = 999;
	condition = dia_dar_kap5_exit_condition;
	information = dia_dar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_dar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DAR_KAP6_EXIT(C_INFO)
{
	npc = sld_810_dar;
	nr = 999;
	condition = dia_dar_kap6_exit_condition;
	information = dia_dar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_dar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DAR_PICKPOCKET(C_INFO)
{
	npc = sld_810_dar;
	nr = 900;
	condition = dia_dar_pickpocket_condition;
	information = dia_dar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_dar_pickpocket_condition()
{
	return c_beklauen(67,35);
};

func void dia_dar_pickpocket_info()
{
	Info_ClearChoices(dia_dar_pickpocket);
	Info_AddChoice(dia_dar_pickpocket,DIALOG_BACK,dia_dar_pickpocket_back);
	Info_AddChoice(dia_dar_pickpocket,DIALOG_PICKPOCKET,dia_dar_pickpocket_doit);
};

func void dia_dar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_dar_pickpocket);
};

func void dia_dar_pickpocket_back()
{
	Info_ClearChoices(dia_dar_pickpocket);
};

