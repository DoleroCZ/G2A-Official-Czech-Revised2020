
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
	description = "Co to tu kou��?";
};


func int dia_dar_hallo_condition()
{
	return TRUE;
};

func void dia_dar_hallo_info()
{
	AI_Output(other,self,"DIA_Dar_Hallo_15_00");	//Co to tu kou��?
	AI_Output(self,other,"DIA_Dar_Hallo_03_01");	//Chce� �luka?
	Info_ClearChoices(dia_dar_hallo);
	Info_AddChoice(dia_dar_hallo,"Ne.",dia_dar_hallo_nein);
	Info_AddChoice(dia_dar_hallo,"Jasn�.",dia_dar_hallo_ja);
};

func void dia_dar_hallo_ja()
{
	AI_Output(other,self,"DIA_Dar_Hallo_Ja_15_00");	//Jasn�.
	CreateInvItem(other,itmi_joint);
	b_useitem(other,itmi_joint);
	AI_Output(self,other,"DIA_Dar_Hallo_Ja_03_01");	//Nen� �patn�, co?
	AI_Output(other,self,"DIA_Dar_Hallo_Ja_15_02");	//Kde jsi tenhle matro� sehnal?
	CreateInvItem(self,itmi_joint);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Dar_Hallo_Ja_03_03");	//(k�en� se) M�m sv� zdroje.
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
	description = "D�l� taky krom� hulen� n�co jin�ho?";
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
	AI_Output(other,self,"DIA_Dar_PERM_15_00");	//D�l� taky krom� hulen� n�co jin�ho?
	if((DAR_LOSTAGAINSTCIPHER == TRUE) && (DAR_EINMAL == FALSE))
	{
		AI_Output(self,other,"DIA_Dar_PERM_03_01");	//(sarkasticky) N�kdy se nech�m zml�tit od n�kolika pomstychtiv�ch fe��k� kv�li t�hle tr�v�...
		DAR_EINMAL = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_PERM_03_02");	//V tuhle chv�li ne.
	};
};


instance DIA_DAR_WANNAJOIN(C_INFO)
{
	npc = sld_810_dar;
	nr = 3;
	condition = dia_dar_wannajoin_condition;
	information = dia_dar_wannajoin_info;
	permanent = FALSE;
	description = "Chci se p�idat k �old�k�m. Bude ti to vadit?";
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
	AI_Output(other,self,"DIA_Dar_WannaJoin_15_00");	//Chci se p�idat k �old�k�m. Bude ti to vadit?
	AI_Output(self,other,"DIA_Dar_WannaJoin_03_01");	//Je mi to jedno.
};


instance DIA_DAR_DUDIEB(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_dudieb_condition;
	information = dia_dar_dudieb_info;
	permanent = FALSE;
	description = "Cipher mi �ekl, �e mu n�kdo ukradnul jeho bal��ek tr�vy.";
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
	AI_Output(other,self,"DIA_Dar_DuDieb_15_00");	//Cipher mi �ekl, �e mu n�kdo ukradnul jeho bal��ek tr�vy.
	AI_Output(self,other,"DIA_Dar_DuDieb_03_01");	//(debiln� a tlumen� se sm�je)
	AI_Output(other,self,"DIA_Dar_DuDieb_15_02");	//Nev� o tom n�co?
	AI_Output(self,other,"DIA_Dar_DuDieb_03_03");	//(velmi kr�tce) Ne.
	DAR_VERDACHT = TRUE;
};


instance DIA_DAR_WOPAKET(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_wopaket_condition;
	information = dia_dar_wopaket_info;
	permanent = TRUE;
	description = "Kde je ten bal��ek?";
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
	AI_Output(other,self,"DIA_Dar_WoPaket_15_00");	//(v�hr��n�) Kde je ten bal��ek?
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Dar_WoPaket_03_01");	//Dob�e, dob�e, dob�e. Prodal jsem ho n�jak�mu pobudovi ve m�st�.
		AI_Output(self,other,"DIA_Dar_WoPaket_03_02");	//Bylo to v p��stavu. Nem��u si vzpomenout, jak vypadal.
		AI_Output(other,self,"DIA_Dar_WoPaket_15_03");	//Vypad� to, �e pot�ebuje� dal�� v�prask?
		AI_Output(self,other,"DIA_Dar_WoPaket_03_04");	//Up��mn�, chlape, byl jsem tot�ln� zfetovanej. Nem�m nejmen�� pon�t� jak ten chl�pek vypadal.
		AI_Output(self,other,"DIA_Dar_WoPaket_03_05");	//Bylo to v p��stavu bl�zko stavitel� lod�. To je v�echno, na co si vzpom�n�m.
		DAR_DIEB = TRUE;
		b_logentry(TOPIC_CIPHERPAKET,"Dar se p�iznal, �e bal�k s tr�vou ukradl on. Prodal jej v khorinissk� p��stavn� �tvrti, hned vedle lo�a�ovy d�lny.");
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_WoPaket_03_06");	//Co j� v�m?
	};
};


instance DIA_DAR_AUFSMAUL(C_INFO)
{
	npc = sld_810_dar;
	nr = 5;
	condition = dia_dar_aufsmaul_condition;
	information = dia_dar_aufsmaul_info;
	permanent = FALSE;
	description = "J� to z tebe vyml�t�m!";
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
	AI_Output(other,self,"DIA_Dar_AufsMaul_15_00");	//J� to z tebe vyml�t�m!
	AI_Output(self,other,"DIA_Dar_AufsMaul_03_01");	//Kl�dek. Jsem moc zhulenej na to, abych s tebou bojoval!
	b_giveinvitems(self,other,itmi_joint,1);
	AI_Output(self,other,"DIA_Dar_AufsMaul_03_02");	//Na, dej si nejd��v velk�ho �luka!
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
	AI_Output(self,other,"DIA_Dar_Kameradenschwein_03_00");	//Kecale! �ekl jsi Cipherovi, �e jsem mu vzal jeho tr�vu!
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
	description = "U� jsi n�kdy balil tab�k?";
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
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_00");	//U� jsi n�kdy balil tab�k?
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_01");	//To zn� zaj�mav�. Dej to sem.
	b_giveinvitems(other,self,itmi_pilztabak,1);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_02");	//Jasn�, jdeme na to.
	CreateInvItem(self,itmi_joint);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_03");	//U� jsi n�kdy kou�il takovejhle materi�lek?
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_04");	//No...
	CreateInvItem(self,itmi_joint);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_05");	//Kou�il, nebo nekou�il?
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_06");	//N�jak jsem se k tomu nedostal...
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_07");	//Kurva!
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_08");	//Svat� Rhobare!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_09");	//Tenhle matro� je dost krutej! V�bec to nezkou�ej!
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
	description = "Vypad� to, �e tu chyb� n�jac� �old�ci.";
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
	AI_Output(other,self,"DIA_Dar_ORCRING_15_00");	//Vypad� to, �e tu chyb� n�jac� �old�ci.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_01");	//Jist�. To je pravda. Sylvio je na m�le daleko a vzal p�lku pos�dky s sebou.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_02");	//To je jedno. M�m alespo� lep�� �anci st�t se jedn�m z Leeov�ch chlapc�. V�echno, co pot�ebuju, je se porvat.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_03");	//Kdybych mohl dok�zat, �e jsem skute�n� ostrej chl�pek, mo�n� bych se dokonce mohl st�t jedn�m z Leeov�ch t�lesn�ch str�c�.
	Info_ClearChoices(dia_dar_orcring);
	Info_AddChoice(dia_dar_orcring,"To m� neznepokojuje.",dia_dar_orcring_no);
	Info_AddChoice(dia_dar_orcring,"Ostrej chl�pek? Ty?",dia_dar_orcring_necken);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF))
	{
		Info_AddChoice(dia_dar_orcring,"Co by to m�lo b�t?",dia_dar_orcring_wie);
	};
};

func void dia_dar_orcring_necken()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_15_00");	//Ostrej chl�pek? Ty?
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_01");	//(na�tvan�) Oj, ale no tak, sklapni. Kdopak jsi ve skute�nosti?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_02");	//N�jakej nafoukanej trouba z m�sta. Vy chc�p�ci nem�te nic, co byste mohli nab�dnout.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_03");	//Jsi tu jenom p�r dn� a u� m� takov�hle kecy.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_04");	//Koho si mysl�, �e t�ma svejma blbejma magick�ma kecama vystra��? M� teda rozhodn� ne.
	};
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_05");	//Kdy� o tom tak p�em��l�m, rozbit� tvoj� lebky je p�esn� to, ��m bych si mohl u Leeov�m chlapc� vyslou�it ten spr�vn� respekt.
		Info_ClearChoices(dia_dar_orcring);
		Info_AddChoice(dia_dar_orcring,"INem�m �as na tyhle kecy.",dia_dar_orcring_necken_no);
		Info_AddChoice(dia_dar_orcring,"OK. Tak to zkus.",dia_dar_orcring_necken_schlagen);
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_06");	//Tak po�kej. Najdu si zp�sob, jak ud�lat na Leeho dojem.
	};
};


var int dar_fightagainstpaladin;

func void dia_dar_orcring_necken_schlagen()
{
	DAR_FIGHTAGAINSTPALADIN = TRUE;
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_schlagen_15_00");	//Fajn. Tak to zkus.
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_schlagen_03_01");	//Ooch, nem��u �ekat.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_dar_orcring_necken_no()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_no_15_00");	//Nem�m �as na tyhle kecy.
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_no_03_01");	//Jo, jasn�. Zapomn�l jsem, ryt�� spravedlnosti bez b�zn� a hany. To je zl�. Myslel jsem, �e m� v�c kur�e.
	AI_StopProcessInfos(self);
};

func void dia_dar_orcring_wie()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_wie_15_00");	//Co by to m�lo b�t?
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_01");	//Nev�m p�esn�. N�jak� sk�et� trofej by nebyla k zahozen�.
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_02");	//T�eba odznak od v�dce sk�et� nebo n�co takov�ho. Prapor, prsten, nebo tak n�co.
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_03");	//S ni��m men��m tady prorazit nejde. To je z�ejm�.
	Log_CreateTopic(TOPIC_DAR_BRINGORCELITERING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DAR_BRINGORCELITERING,LOG_RUNNING);
	b_logentry(TOPIC_DAR_BRINGORCELITERING,"Dar se chce st�t pohlav�rem �oldn���, a k tomu pot�ebuje n�jakou sk�et� trofej. Praporec, n�ramen�k, prsten nebo n�co takov�ho.");
	MIS_DAR_BRINGORCELITERING = LOG_RUNNING;
	Info_ClearChoices(dia_dar_orcring);
};

func void dia_dar_orcring_no()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_no_15_00");	//To m� neznepokojuje.
	AI_Output(self,other,"DIA_Dar_ORCRING_no_03_01");	//(na�tvan�) Samoz�ejm�, �e ne. To by m� ohromilo.
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
	AI_Output(self,other,"DIA_Dar_FIGHTAGAINSTPALOVER_03_00");	//Jasn�, v�m, �e Lee nebude �pln� nad�enej, kdy� se v tom s tebou budu zase anga�ovat.
	AI_Output(self,other,"DIA_Dar_FIGHTAGAINSTPALOVER_03_01");	//Nechci si tu nikoho znep��telit, tak na ten nesmysl prost� zapome�me, jo?
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};


instance DIA_DAR_BRINGORCELITERING(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_bringorcelitering_condition;
	information = dia_dar_bringorcelitering_info;
	description = "M�m tu sk�et� trofej, jak jsi cht�l.";
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
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_15_00");	//M�m tu sk�et� trofej, jak jsi cht�l.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_03_01");	//Cos mi to p�inesl?
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_15_02");	//Prsten sk�et�ho vojev�dce.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_03_03");	//F�ha, no kdy� je to tak... Co za to chce�?
	MIS_DAR_BRINGORCELITERING = LOG_SUCCESS;
	Info_ClearChoices(dia_dar_bringorcelitering);
	Info_AddChoice(dia_dar_bringorcelitering,"Co mi m��e� nab�dnout?",dia_dar_bringorcelitering_was);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(dia_dar_bringorcelitering,"Dej mi n�jak� zlato.",dia_dar_bringorcelitering_geld);
	};
};

func void dia_dar_bringorcelitering_geld()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_15_00");	//Dej mi n�jak� zlato.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_01");	//T�eba 600 zla��k�?
		AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_15_02");	//Kolik �e?
	};
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_03");	//No dob�e, d�m ti za to 1200 zla��k�.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_04");	//Bu� ber, nebo si ten prsten nech.
	};
	Info_ClearChoices(dia_dar_bringorcelitering);
	Info_AddChoice(dia_dar_bringorcelitering,"To nesta��.",dia_dar_bringorcelitering_geld_no);
	Info_AddChoice(dia_dar_bringorcelitering,"Dojedn�no - tady je.",dia_dar_bringorcelitering_geld_ok);
};

func void dia_dar_bringorcelitering_geld_ok()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_ok_15_00");	//Dojedn�no - tady je.
	b_giveinvitems(other,self,itri_orcelitering,1);
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_ok_03_01");	//D�ky, u� se nem��u do�kat, co na to �eknou ostatn�.
	CreateInvItems(self,itmi_gold,1200);
	b_giveinvitems(self,other,itmi_gold,1200);
	b_giveplayerxp(XP_DAR_BRINGORCELITERING);
	Info_ClearChoices(dia_dar_bringorcelitering);
};

func void dia_dar_bringorcelitering_geld_no()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_no_15_00");	//To nesta��.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_no_03_01");	//A j� zase mysl�m, �e je to n�jak moc. Bez ur�ky, tahle z�le�itost se mi zd� n�jak podez�el�.
	Info_ClearChoices(dia_dar_bringorcelitering);
};

func void dia_dar_bringorcelitering_was()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_was_15_00");	//Co mi m��e� nab�dnout?
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_03_01");	//Bu� si vezmi pen�ze, nebo tenhle amulet, kter� jsem... no, �ekn�me �e jsem jej p�ed �asem n�jak z�skal.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_03_02");	//Zvy�uje obratnost, s�m jsem to vyzkou�el.
	Info_ClearChoices(dia_dar_bringorcelitering);
	Info_AddChoice(dia_dar_bringorcelitering,"Dej mi n�jak� zlato.",dia_dar_bringorcelitering_geld);
	Info_AddChoice(dia_dar_bringorcelitering,"Dej mi ten amulet.",dia_dar_bringorcelitering_was_am);
};

func void dia_dar_bringorcelitering_was_am()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_was_am_15_00");	//Dej mi ten amulet.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_am_03_01");	//Jas�a�ka, jen si ho u�ij. A te� naval ten prsten.
	b_giveinvitems(other,self,itri_orcelitering,1);
	CreateInvItems(self,itam_dex_01,1);
	b_giveinvitems(self,other,itam_dex_01,1);
	b_giveplayerxp(XP_DAR_BRINGORCELITERING);
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_am_03_02");	//T�ilo m�.
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

