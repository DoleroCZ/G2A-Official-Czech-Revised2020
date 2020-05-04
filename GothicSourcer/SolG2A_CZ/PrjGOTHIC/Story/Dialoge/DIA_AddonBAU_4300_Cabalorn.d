
func int c_bragobanditsdead()
{
	if((Npc_IsDead(ambusher_1013) || (BDT_1013_AWAY == TRUE)) && Npc_IsDead(ambusher_1014) && Npc_IsDead(ambusher_1015))
	{
		return TRUE;
	};
};


instance DIA_ADDON_CAVALORN_EXIT(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 999;
	condition = dia_addon_cavalorn_exit_condition;
	information = dia_addon_cavalorn_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_cavalorn_exit_condition()
{
	return TRUE;
};

func void dia_addon_cavalorn_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CAVALORN_PICKPOCKET(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 900;
	condition = dia_addon_cavalorn_pickpocket_condition;
	information = dia_addon_cavalorn_pickpocket_info;
	permanent = TRUE;
	description = "(Tyto ��py se daj� snadno �t�pnout)";
};


func int dia_addon_cavalorn_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (25 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_pickpocket_info()
{
	Info_ClearChoices(dia_addon_cavalorn_pickpocket);
	Info_AddChoice(dia_addon_cavalorn_pickpocket,DIALOG_BACK,dia_addon_cavalorn_pickpocket_back);
	Info_AddChoice(dia_addon_cavalorn_pickpocket,DIALOG_PICKPOCKET,dia_addon_cavalorn_pickpocket_doit);
};

func void dia_addon_cavalorn_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 25)
	{
		b_giveinvitems(self,other,itrw_arrow,44);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		Info_ClearChoices(dia_addon_cavalorn_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_addon_cavalorn_pickpocket_back()
{
	Info_ClearChoices(dia_addon_cavalorn_pickpocket);
};


instance DIA_ADDON_CAVALORN_MEETINGISRUNNING(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_meetingisrunning_condition;
	information = dia_addon_cavalorn_meetingisrunning_info;
	important = TRUE;
	permanent = TRUE;
};


var int dia_addon_cavalorn_meetingisrunning_onetime;

func int dia_addon_cavalorn_meetingisrunning_condition()
{
	if(Npc_IsInState(self,zs_talk) && (RANGERMEETINGRUNNING == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_meetingisrunning_info()
{
	if(DIA_ADDON_CAVALORN_MEETINGISRUNNING_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_MeetingIsRunning_08_00");	//V�tej v 'Kruhu' p��teli.
		DIA_ADDON_CAVALORN_MEETINGISRUNNING_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_08_01");	//Vatras mi dal jinej �kol.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CAVALORN_HALLO(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_hallo_condition;
	information = dia_addon_cavalorn_hallo_info;
	description = "Probl�my?";
};


func int dia_addon_cavalorn_hallo_condition()
{
	return TRUE;
};

func void dia_addon_cavalorn_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_15_00");	//Probl�my?
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_08_01");	//Zatracen�. Nev�d�l jsem, kde se schov�vaj. Dostal jsi jednoho a za chv�li budou zp�tky.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_08_02");	//(uli�nicky) Moment. J� t� zn�m. Ty jsi ten chl�pek, kter� u m� st�le �ebral v kolonii ��py.
	Info_ClearChoices(dia_addon_cavalorn_hallo);
	Info_AddChoice(dia_addon_cavalorn_hallo,"Jmenuje� se Cavalorn, �e?",dia_addon_cavalorn_hallo_ja);
	Info_AddChoice(dia_addon_cavalorn_hallo,"T�ko si vzpom�n�m.",dia_addon_cavalorn_hallo_weissnicht);
};

func void dia_addon_cavalorn_hallo_weissnicht()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_weissNicht_15_00");	//T�ko si vzpom�n�m.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_weissNicht_08_01");	//No tak! U�il jsem t� lukost�elbu a pl�en� v m� chatr�i bl�zko Star�ho t�bora. U� ti sv�t�?
};

func void dia_addon_cavalorn_hallo_ja()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Ja_15_00");	//Jmenuje� se Cavalorn, �e?
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Ja_08_01");	//�. Vid�m, �e jsi na m� nezapomn�l po tom v�em, ��m jsme pro�li v t� zatracen� kolonii.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Ja_08_02");	//Kam jinak jde�?
	Info_ClearChoices(dia_addon_cavalorn_hallo);
	Info_AddChoice(dia_addon_cavalorn_hallo,"Nem�m ��dn� ur�it� c�l.",dia_addon_cavalorn_hallo_keinziel);
	Info_AddChoice(dia_addon_cavalorn_hallo,"Zp�tky do Hornick�ho �dol�. ",dia_addon_cavalorn_hallo_bauern);
	if(mil_310_stadtwache.aivar[AIV_PASSGATE] == FALSE)
	{
		Info_AddChoice(dia_addon_cavalorn_hallo,"Do m�sta.",dia_addon_cavalorn_hallo_stadt);
	};
};

func void dia_addon_cavalorn_hallo_stadt()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Stadt_15_00");	//Do m�sta.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_01");	//(sm�je se) To vid�m. Do m�sta.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_02");	//M��e� se dostat do probl�m� s m�stskou str��. Nenechaj� kdekoho proj�t po tom, co bylo tohle m�sto zamo�eno bandity.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_03");	//Jeden z t�ch star�ch Sekt��� z Hornick�ho �dol� p�i�el p�ed n�kolika dny. �ekl, �e se dostane do Khorinisu a ven kdy chce.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_04");	//Vydal se do �dol� pod tou velkou v��. N�kde tam bl�zko vodop�du mus� b�t cesta.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_05");	//Mo�n� by sis s n�m m�l promluvit.
	Info_ClearChoices(dia_addon_cavalorn_hallo);
};

func void dia_addon_cavalorn_hallo_bauern()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Bauern_15_00");	//Zp�tky do Hornick�ho �dol�.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Bauern_08_01");	//(p�ekvapen�) Opravdu? Hmm. R�d bych, m��u t� n�sledovat, ale mus�m si je�t� vyjasnit p�r v�c�.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Bauern_08_02");	//Pokud se dostane� do Hornick�ho �dol� - mohl bys zjistit jestli m� chatr� je�t� stoj�? R�d bych se tam jednoho dne vr�til.
	MIS_ADDON_CAVALORN_THEHUT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_CAVALORNTHEHUT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_CAVALORNTHEHUT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_CAVALORNTHEHUT,"Lovec Cavalorn m� po��dal, abych se v p��pad�, �e se dostanu do hornick�ho �dol�, pod�val, jestli je�t� stoj� jeho loveck� chata, le��c� severn� od b�val�ho Star�ho t�bora.");
	Info_ClearChoices(dia_addon_cavalorn_hallo);
};

func void dia_addon_cavalorn_hallo_keinziel()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_keinZiel_15_00");	//Nem�m ��dn� ur�it� c�l.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_keinZiel_08_01");	//Nechce� mi to ��ct - spr�vn�? ��dn� probl�m.
	Info_ClearChoices(dia_addon_cavalorn_hallo);
};


instance DIA_ADDON_CAVALORN_BEUTEL(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_beutel_condition;
	information = dia_addon_cavalorn_beutel_info;
	description = "Byl jsem v tv� chatr�i v Hornick�m �dol�.";
};


func int dia_addon_cavalorn_beutel_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_hallo) && (Npc_HasItems(other,itse_addon_cavalornsbeutel) || (SC_OPENEDCAVALORNSBEUTEL == TRUE)))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_beutel_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_00");	//Byl jsem v tv� chatr�i v Hornick�m �dol�.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_01");	//Tak�e to st�le stoj�.
	if(MIS_ADDON_CAVALORN_THEHUT == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_02");	//Ano. A tak� v�m, co jsi tam cht�l.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_03");	//Na�el jsi to?
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_04");	//Pokud mysl� tv�j s��ek s hrudkami rudy ... ano, m�m ho.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_05");	//Jsi starej li��k, v� o tom.
	if(MIS_ADDON_CAVALORN_THEHUT == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_06");	//Co dal��ho chce� z t� star� chatr�e. Nic tam nezbylo.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_07");	//M� to s sebou? D�m ti za to 100 zla��k�.
	TOPIC_END_CAVALORNTHEHUT = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_addon_cavalorn_beutel);
	if(Npc_HasItems(other,itse_addon_cavalornsbeutel))
	{
		Info_AddChoice(dia_addon_cavalorn_beutel,"Jasn�.",dia_addon_cavalorn_beutel_ja);
	}
	else if(Npc_HasItems(other,itmi_nugget))
	{
		Info_AddChoice(dia_addon_cavalorn_beutel,"Ne, ale m�m tady tuhle hroudu rudy.",dia_addon_cavalorn_beutel_jaerz);
	};
	Info_AddChoice(dia_addon_cavalorn_beutel,"Ne.",dia_addon_cavalorn_beutel_no);
};

func void dia_addon_cavalorn_beutel_back()
{
	Info_ClearChoices(dia_addon_cavalorn_beutel);
	AI_Output(self,other,"DIA_Addon_Cavalorn_back_08_00");	//Douf�m, �e to brzy dostanu zp�t.
};

func void dia_addon_cavalorn_beutel_jaerz()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_jaerz_15_00");	//Ne, ale m�m tady tuhle hroudu rudy.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_jaerz_08_01");	//Taky dob�e.
	Info_ClearChoices(dia_addon_cavalorn_beutel);
	Info_AddChoice(dia_addon_cavalorn_beutel,DIALOG_BACK,dia_addon_cavalorn_beutel_back);
	Info_AddChoice(dia_addon_cavalorn_beutel,"Tak jako tak, pro� jsi si to nevzal?",dia_addon_cavalorn_beutel_why);
};

func void dia_addon_cavalorn_beutel_ja()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_ja_15_00");	//Jasn�.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_ja_08_01");	//Super.
	Info_ClearChoices(dia_addon_cavalorn_beutel);
	Info_AddChoice(dia_addon_cavalorn_beutel,DIALOG_BACK,dia_addon_cavalorn_beutel_back);
	Info_AddChoice(dia_addon_cavalorn_beutel,"Tak jako tak, pro� jsi si to nevzal?",dia_addon_cavalorn_beutel_why);
};

func void dia_addon_cavalorn_beutel_no()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_no_15_00");	//Ne.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_no_08_01");	//Tak se vra� pro tu v�c ZNOVU. P�es ve�ker� �sil� pro to asi budu muset do toho zatracen�ho �dol� s�m.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_no_15_02");	//Jsem tak dot�en.
	Info_ClearChoices(dia_addon_cavalorn_beutel);
	Info_AddChoice(dia_addon_cavalorn_beutel,DIALOG_BACK,dia_addon_cavalorn_beutel_back);
	Info_AddChoice(dia_addon_cavalorn_beutel,"Tak jako tak, pro� jsi si to nevzal?",dia_addon_cavalorn_beutel_why);
};

func void dia_addon_cavalorn_beutel_why()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_why_15_00");	//Tak jako tak, pro� jsi si to nevzal?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_01");	//Kdo si mohl myslet, �e ruda je tady v Khorinisu tak cenn�?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_02");	//V kolonii jsi nedostal za takovouhle hrudku rudy ani m�sto na span�.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_03");	//V p��stavu ti t�me� rozbijou hlavu, pokud zjit�, �e m� u sebe rudu.
};


instance DIA_ADDON_CAVALORN_ERZGEBEN(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_erzgeben_condition;
	information = dia_addon_cavalorn_erzgeben_info;
	description = "Dej mi 100 zla��k�, pak ti vr�t�m rudu.";
};


func int dia_addon_cavalorn_erzgeben_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_beutel) && (Npc_HasItems(other,itse_addon_cavalornsbeutel) || Npc_HasItems(other,itmi_nugget)))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_erzgeben_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_ErzGeben_15_00");	//Dej mi 100 zla��k�, pak ti vr�t�m rudu.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ErzGeben_08_01");	//Ujedn�no. Tady m�.
	CreateInvItems(self,itmi_gold,100);
	b_giveinvitems(self,other,itmi_gold,100);
	if(b_giveinvitems(other,self,itse_addon_cavalornsbeutel,1) == FALSE)
	{
		b_giveinvitems(other,self,itmi_nugget,1);
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_ErzGeben_08_02");	//Jsi opravdov� p��tel. D�kuji ti.
	MIS_ADDON_CAVALORN_THEHUT = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_CAVALORNSBEUTEL);
};


instance DIA_ADDON_CAVALORN_WASMACHSTDU(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_wasmachstdu_condition;
	information = dia_addon_cavalorn_wasmachstdu_info;
	description = "Co tady d�l�?";
};


func int dia_addon_cavalorn_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_hallo) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WASMACHSTDU_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WASMACHSTDU_08_01");	//Uv�zl jsem. Kdyby to nebylo t�ch zatracen�m bandit�, asi bych tu nebyl.
};


instance DIA_ADDON_CAVALORN_BANDITEN(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 10;
	condition = dia_addon_cavalorn_banditen_condition;
	information = dia_addon_cavalorn_banditen_info;
	description = "Co banditi?";
};


func int dia_addon_cavalorn_banditen_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_wasmachstdu) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_banditen_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Banditen_15_00");	//Co banditi?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_01");	//Zaspal jsi snad cel� minul� t�den?
	AI_Output(other,self,"DIA_Addon_Cavalorn_Banditen_15_02");	//Ehm ...
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_03");	//Mluv�m o t� hav�ti z trestaneck� kolonie - rozl�zaj� se po krajin�, drancuj� a vra�d�.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_04");	//(povzdech) Jsem r�d, �e m� nechali na�ivu. Jednou ned�v�m pozor a oni m� pra�t� zezadu do hlavy.
	if(c_bragobanditsdead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_05");	//Nenapad� m� ��dn� zp�sob, jak dostat moje v�ci zp�t.
	};
};


instance DIA_ADDON_CAVALORN_ARTEFAKT(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_artefakt_condition;
	information = dia_addon_cavalorn_artefakt_info;
	description = "Ty jsi byl okraden bandity?";
};


func int dia_addon_cavalorn_artefakt_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_banditen) && (MIS_ADDON_CAVALORN_KILLBRAGO != LOG_SUCCESS) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0) && (MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_artefakt_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_ARTEFAKT_15_00");	//Ty jsi byl okraden bandity?
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_01");	//(zachmu�en�) Jo. Srazili m� a nechali jako j�dlo pro gobliny.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_02");	//Byly tam zatracen� d�le�it� v�ci. Dopis a v�echny moje pen�ze. Prost� to mus�m dostat zp�t.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_03");	//Nicm�n�, bez podpory tam nejdu. Ta zbab�l� tlupa krimin�ln�k� ...
};


instance DIA_ADDON_CAVALORN_HELFEN(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_helfen_condition;
	information = dia_addon_cavalorn_helfen_info;
	description = "M��u ti pomoci s bandity?";
};


func int dia_addon_cavalorn_helfen_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_artefakt) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0) && (MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS) && (c_bragobanditsdead() == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_helfen_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HELFEN_15_00");	//M��u ti pomoci s bandity?
	if((Npc_HasEquippedArmor(other) == FALSE) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_01");	//(uli�nicky) Mo�n�. Ale z tv�ho ztr�pen�ho zjevu ti m��u ��ct, �e jsi nedr�el opravdov� me� cel� t�dny.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_02");	//Dobr�. Pravd�podobn� nem�m jinou volbu ne� p�ijmout tvoji nab�dku. Nem�m moc �asu.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_03");	//Tak�e poslouchej. Dole po tehle cest� je jedna z t�ch �pinav�ch d�r v zemi, ve kter�ch se banditi r�di schov�vaj�.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_04");	//Ti krimin�ln�ci tady, jsou ti, kte�� mi ukradli moje v�ci.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_05");	//�ekni mi a� bude� p�ipraven a p�jdem na tu pak�.
	MIS_ADDON_CAVALORN_KILLBRAGO = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_KILLBRAGO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KILLBRAGO,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KILLBRAGO,"Cavalorn byl okraden bandity o velmi d�le�it� v�ci. Odm�t� s nimi bojovat s�m a tak m� po��dal o pomoc.");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_ADDON_CAVALORN_AUSRUESTUNG(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_ausruestung_condition;
	information = dia_addon_cavalorn_ausruestung_info;
	description = "Pot�ebuju lep�� vybaven�.";
};


func int dia_addon_cavalorn_ausruestung_condition()
{
	if((MIS_ADDON_CAVALORN_KILLBRAGO != 0) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_ausruestung_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_00");	//Pot�ebuju lep�� vybaven�.
	if(c_bragobanditsdead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_01");	//Ty prasata m� toho moc nenechali.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_02");	//M��u ti d�t vl�� n��. Sta�� to?
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_03");	//N�� sta��.
	CreateInvItems(self,itmw_addon_knife01,1);
	b_giveinvitems(self,other,itmw_addon_knife01,1);
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_04");	//Ale co n�jak� lektvary?
	AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_05");	//Zbyly mi dva l��iv� lektvary. M� z�jem?
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_06");	//Jasn�. Vezmu si je.
	CreateInvItems(self,itpo_health_01,2);
	b_giveinvitems(self,other,itpo_health_01,2);
};


instance DIA_ADDON_CAVALORN_LETSKILLBANDITS(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_letskillbandits_condition;
	information = dia_addon_cavalorn_letskillbandits_info;
	description = "Poj�me zab�t ty fl�ka�e.";
};


func int dia_addon_cavalorn_letskillbandits_condition()
{
	if((MIS_ADDON_CAVALORN_KILLBRAGO == LOG_RUNNING) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0) && (MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS) && (c_bragobanditsdead() == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_letskillbandits_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_LETSKILLBANDITS_15_00");	//Poj�me zab�t ty fl�ka�e.
	AI_Output(self,other,"DIA_Addon_Cavalorn_LETSKILLBANDITS_08_01");	//Dobr�. Prost� mi hl�dej z�da, jasn�?
	AI_Output(self,other,"DIA_Addon_Cavalorn_LETSKILLBANDITS_08_02");	//To maj� za to sprost� p�epaden�.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"KillBandits");
	if(BDT_1013_AWAY == FALSE)
	{
		ambusher_1013.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
	ambusher_1014.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	ambusher_1015.aivar[AIV_ENEMYOVERRIDE] = FALSE;
};

func void b_addon_cavalorn_vatrasbrief()
{
	if(MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_00");	//Na posledn� chv�li m��u svoje posl�n� dokon�it. U� jsem ztratil moc �asu.
		AI_Output(other,self,"DIA_Addon_Cavalorn_VatrasBrief_15_01");	//Jak� rozkaz?
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_02");	//(pro sebe) Oh. Ano. Mus�m se dostat do m�sta a pozd�ji ...
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_03");	//(povzdech) Jenom nev�m, jak to splnit v�as.
		AI_Output(other,self,"DIA_Addon_Cavalorn_VatrasBrief_15_04");	//A co j�?
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_05");	//(p�em��l�) Hmm. Pro� ne. Ty m��e� doru�it dopis do m�sta.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_06");	//To m� d� trochu �asu, abych se mohl pod�vat po sv�m vybaven�.
	if(MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_07");	//Jeden z bandit� by m�l m�t dopis v kapse.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_08");	//Dones to Vatrasovi, m�govi Vody ve m�st�. Zastihne� ho v Adanosov� chr�mu, kde cel� den k�e.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_09");	//�ekni mu, �e jsem to nezvl�dl v�as.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_10");	//A kdy� se zept�, kde jsem - �ekni mu, �e m���m na m�sto setk�n�.
		b_logentry(TOPIC_ADDON_KDW,"M�ga Vody Vatrase m��u naj�t v p��stavn�m m�st� Khorinis. D�l� k�z�n� v Adanosov� chr�mu.");
	};
	if((Npc_HasEquippedArmor(other) == FALSE) && (hero.guild == GIL_NONE) && (MIL_310_SCHONMALREINGELASSEN == FALSE) && (MIL_333_SCHONMALREINGELASSEN == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_11");	//A je�t� jedna v�c: Kup si n�jak� vhodn� od�v od farm��e.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_12");	//Jinak si budou myslet, �e jsi bandita. Tady m� trochu pen�z.
		CreateInvItems(self,itmi_gold,50);
		b_giveinvitems(self,other,itmi_gold,50);
	};
	MIS_ADDON_CAVALORN_KILLBRAGO = LOG_SUCCESS;
	if(MIS_ADDON_CAVALORN_LETTER2VATRAS == 0)
	{
		MIS_ADDON_CAVALORN_LETTER2VATRAS = LOG_RUNNING;
	};
	Npc_ExchangeRoutine(self,"Start");
	b_giveplayerxp(XP_ADDON_CAVALORN_KILLBRAGO);
	Log_CreateTopic(TOPIC_ADDON_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KDW,LOG_RUNNING);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


instance DIA_ADDON_CAVALORN_BRAGOKILLED(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_bragokilled_condition;
	information = dia_addon_cavalorn_bragokilled_info;
	important = TRUE;
};


func int dia_addon_cavalorn_bragokilled_condition()
{
	if((Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_LEFT") < 500) && (MIS_ADDON_CAVALORN_KILLBRAGO == LOG_RUNNING) && (c_bragobanditsdead() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_bragokilled_info()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_BragoKilled_08_00");	//Tak je to odbyt�. Hehe. Nem�li si se mnou hr�t.
	b_addon_cavalorn_vatrasbrief();
};


instance DIA_ADDON_CAVALORN_PCKILLEDBRAGO(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_pckilledbrago_condition;
	information = dia_addon_cavalorn_pckilledbrago_info;
	description = "Banditi jsou usma�en�.";
};


func int dia_addon_cavalorn_pckilledbrago_condition()
{
	if((MIS_ADDON_CAVALORN_KILLBRAGO == 0) && Npc_KnowsInfo(other,dia_addon_cavalorn_banditen) && (c_bragobanditsdead() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_pckilledbrago_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_PCKilledBrago_15_00");	//Banditi jsou usma�en�
	b_addon_cavalorn_vatrasbrief();
};


instance DIA_ADDON_CAVALORN_JUNGS(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 2;
	condition = dia_addon_cavalorn_jungs_condition;
	information = dia_addon_cavalorn_jungs_info;
	description = "Zaj�mav� brn�n�, co nos�. U� nepat�� ke St�n�m?";
};


func int dia_addon_cavalorn_jungs_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_jungs_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_JUNGS_15_00");	//Zaj�mav� brn�n�, co nos�. U� nepat�� ke St�n�m?
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_01");	//St�nov�? Ti u� neexistuj� po tom, co padla bari�ra.
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_02");	//V moment�, kdy� jsme mohli opustit Hornick� �dol�, nebyl ��dn� d�vod lp�t na tom.
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_03");	//Te� pracuji pro m�gy Vody. Pat��m do 'Kruhu vody'.
	SC_KNOWSRANGER = TRUE;
	Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Cavalorn mi �ekl o tajn� gild�, do kter� s�m pat��. O takzvan�m 'Kruhu vody'.");
	CAVALORN_RANGERHINT = TRUE;
};


instance DIA_ADDON_CAVALORN_RING(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_ring_condition;
	information = dia_addon_cavalorn_ring_info;
	permanent = FALSE;
	description = "�ekni mi v�ce o 'Kruhu Vody'.";
};


func int dia_addon_cavalorn_ring_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_jungs))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_ring_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ring_15_00");	//�ekni mi v�ce o 'Kruhu Vody'.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_01");	//Nem�m povolen� se o tom s tebou bavit.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_02");	//V�echno co m��u ud�lat, je poslat t� za Vatrasem. Je z�stupcem m�g� Vody v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_03");	//Bude nejlep��, kdy� si s n�m promluv�. �ekni mu, �e jsem t� poslal.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_04");	//Mo�n�, �e t� p�ijme do Kruhu. Zoufale pot�ebujeme dobr� lidi ...
	b_logentry(TOPIC_ADDON_RINGOFWATER,"M�g Vody Vatras m� m��e p��jmout do 'Kruhu vody'. M�m se u n�j zastavit a ��ct, �e m� pos�l� Cavalorn.");
};


instance DIA_ADDON_CAVALORN_FEINDE(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 6;
	condition = dia_addon_cavalorn_feinde_condition;
	information = dia_addon_cavalorn_feinde_info;
	permanent = FALSE;
	description = "Nebyl jsi ty a va�i lid� nep��telmi m�g� Vody?.";
};


func int dia_addon_cavalorn_feinde_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_jungs))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_feinde_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Feinde_15_00");	//Nebyl jsi ty a va�i lid� nep��tel� m�g� Vody?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_01");	//Ta debiln� minulost skon�ila. U� nen� ��dn� "Nov�" nebo "Star�" t�bor.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_02");	//Te� - proto�e u� nen� ��dn� trestaneck� kolonie, ka�d� je zodpov�dn� s�m za sebe.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_03");	//Mnoho z b�val�ch trestanc� je ale po��d je�t� st�h�no.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_04");	//M�gov� Vody byli schopn� pro m� sehnat odpu�t�n� - tak�e se m��u te� voln� pohybovat.
};


instance DIA_ADDON_CAVALORN_KDWTASK(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 6;
	condition = dia_addon_cavalorn_kdwtask_condition;
	information = dia_addon_cavalorn_kdwtask_info;
	permanent = FALSE;
	description = "Co d�laj� m�gov� Vody te�?";
};


func int dia_addon_cavalorn_kdwtask_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_jungs) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_kdwtask_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_KdWTask_15_00");	//Co d�laj� m�gov� Vody te�?
	AI_Output(self,other,"DIA_Addon_Cavalorn_KdWTask_08_01");	//Jdou po n��em velk�m. Je to o nezn�m� ��sti ostrova.
	AI_Output(other,self,"DIA_Addon_Cavalorn_KdWTask_15_02");	//Nezn�m� ��st? Kde m��e b�t?
	AI_Output(self,other,"DIA_Addon_Cavalorn_KdWTask_08_03");	//Nem��u ti ��ct v�c. Promluv si s Vatrasem v Khorinisu.
};


instance DIA_ADDON_CAVALORN_BROUGHTLETTER(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_broughtletter_condition;
	information = dia_addon_cavalorn_broughtletter_info;
	description = "Dal jsem Vatrasovi tv�j dopis.";
};


func int dia_addon_cavalorn_broughtletter_condition()
{
	if((MIS_ADDON_CAVALORN_LETTER2VATRAS == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_addon_cavalorn_jungs))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_broughtletter_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_BroughtLetter_15_00");	//Dal jsem Vatrasovi tv�j dopis.
	AI_Output(self,other,"DIA_Addon_Cavalorn_BroughtLetter_08_01");	//Neo�ek�val jsem od tebe nic jin�ho. D�kuju ti.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_CAVALORN_ORNAMENT(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 2;
	condition = dia_addon_cavalorn_ornament_condition;
	information = dia_addon_cavalorn_ornament_info;
	description = "Hled� n�co?";
};


func int dia_addon_cavalorn_ornament_condition()
{
	if((MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_cavalorn_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_ornament_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_00");	//Hled� n�co?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_01");	//Tak z�ejm�? Ano, poslali m� m�gov� Vody, abych na�el ornamenty.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_02");	//To je n�hoda. Dostal jsem ten sam� �kol od Nefaria.
	if(SC_KNOWSRANGER == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_03");	//Ty tedy pat�� do 'Kruhu vody'?
		if(SC_ISRANGER == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_04");	//Ano.
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_05");	//Zat�m ne, ale pracuji na tom.
		};
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_06");	//To je dob�e. Pak to nemus�m d�lat s�m.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_07");	//U� jsi na�el ornament?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_08");	//Na�el jsem m�sto, kde pravd�podobn� jeden najdeme.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_09");	//Tyhle kamenn� kruhy m��ou b�t jedny z t�ch staven�, kter� Nefarius popisoval.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_10");	//Te� pot�ebujeme jen naj�t mechanismus.
};


instance DIA_ADDON_CAVALORN_TRIGGERED(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_triggered_condition;
	information = dia_addon_cavalorn_triggered_info;
	description = "Aktivoval jsem mechanizmus. Nic se ale nestalo.";
};


func int dia_addon_cavalorn_triggered_condition()
{
	if((MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_cavalorn_ornament) && (ORNAMENT_SWITCHED_FARM == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_triggered_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_15_00");	//Aktivoval jsem mechanizmus. Nic se ale nestalo.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_01");	//Potom m�li Lobartovi roln�ci pravdu.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_02");	//�ekli, �e n�kdo jin� se potloukal okolo t�ch kamen�.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_03");	//Najednou se objevil kamenn� str�ce a za�to�il na n�.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_04");	//Farm��i zavolali pro domobranu, voj�ci domobrany paladiny, kte�� p�i�li a zni�ili to monstrum.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_05");	//U� jsem prohledal cel� okol�. Jestli tady byl oranment, maj� ho te� paladinov�.
	Info_ClearChoices(dia_addon_cavalorn_triggered);
	Info_AddChoice(dia_addon_cavalorn_triggered,"Pak se jeden z n�s mus� dostat do horn� ��sti m�sta.",dia_addon_cavalorn_triggered_pal);
	Info_AddChoice(dia_addon_cavalorn_triggered,"Pak za nimi zajdu a z�sk�m ornament.",dia_addon_cavalorn_triggered_oback);
};

func void b_cavalorn_triggered_wohin()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_Wohin_08_00");	//P�jdu te� do m�sta. Setk�me se u Vatrase.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Stadt");
	Log_CreateTopic(TOPIC_ADDON_ORNAMENT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_ORNAMENT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_ORNAMENT,"Jeden ze ztracen�ch ornament� maj� paladinov� ve m�st�.");
	MIS_ADDON_CAVALORN_GETORNAMENTFROMPAL = LOG_RUNNING;
	self.flags = 0;
};

func void dia_addon_cavalorn_triggered_oback()
{
	AI_UnequipArmor(self);
	CreateInvItems(self,itar_bau_l,1);
	Npc_RemoveInvItems(self,itar_ranger_addon,Npc_HasItems(self,itar_ranger_addon));
	Npc_RemoveInvItems(self,itar_fake_ranger,Npc_HasItems(self,itar_fake_ranger));
	AI_EquipBestArmor(self);
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_OBack_15_00");	//Pak za nimi zajdu a z�sk�m ornament.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_OBack_08_01");	//Dob�e.
	b_cavalorn_triggered_wohin();
};

func void dia_addon_cavalorn_triggered_pal()
{
	AI_UnequipArmor(self);
	CreateInvItems(self,itar_bau_l,1);
	Npc_RemoveInvItems(self,itar_ranger_addon,Npc_HasItems(self,itar_ranger_addon));
	Npc_RemoveInvItems(self,itar_fake_ranger,Npc_HasItems(self,itar_fake_ranger));
	AI_EquipBestArmor(self);
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_Pal_15_00");	//Pak se jeden z n�s mus� dostat do horn� ��sti m�sta.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_Pal_08_01");	//J� na to nem�m �as. Mus� to ud�lat ty.
	b_cavalorn_triggered_wohin();
};


instance DIA_ADDON_CAVALORN_GOTORNAFROMHAGEN(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_gotornafromhagen_condition;
	information = dia_addon_cavalorn_gotornafromhagen_info;
	description = "Z�skal jsem chyb�j�c� ornament od Lorda Hagena.";
};


func int dia_addon_cavalorn_gotornafromhagen_condition()
{
	if(LORD_HAGEN_GOTORNAMENT == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_gotornafromhagen_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_GotOrnaFromHagen_15_00");	//Z�skal jsem chyb�j�c� ornament od Lorda Hagena.
	AI_Output(self,other,"DIA_Addon_Cavalorn_GotOrnaFromHagen_08_01");	//Vid�? J� v�d�l, �e ho paladinov� maj�.
	b_giveplayerxp(XP_AMBIENT);
	MIS_ADDON_CAVALORN_GETORNAMENTFROMPAL = LOG_SUCCESS;
};


instance DIA_ADDON_CAVALORN_WANNALEARN(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 7;
	condition = dia_addon_cavalorn_wannalearn_condition;
	information = dia_addon_cavalorn_wannalearn_info;
	permanent = FALSE;
	description = "M��e� m� n�co nau�it?";
};


func int dia_addon_cavalorn_wannalearn_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_hallo) && (c_bragobanditsdead() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_wannalearn_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WannaLearn_15_00");	//M��e� m� n�co nau�it?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_01");	//Jasn�. Zn�m to. Chlape - pron�sledovali t� za dobr�, co?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_02");	//Nic si nepamatuje�, �e?
	CAVALORN_ADDON_TEACHPLAYER = TRUE;
	Log_CreateTopic(TOPIC_OUTTEACHER,LOG_NOTE);
	b_logentry(TOPIC_OUTTEACHER,LOGTEXT_ADDON_CAVALORN_TEACH);
};


var int addon_cavalorn_merke_bow;
var int addon_cavalorn_merke_1h;

instance DIA_ADDON_CAVALORN_TEACH(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 8;
	condition = dia_addon_cavalorn_teach_condition;
	information = dia_addon_cavalorn_teach_info;
	permanent = TRUE;
	description = "Chci se nau�it tvoje schopnosti.";
};


func int dia_addon_cavalorn_teach_condition()
{
	if(CAVALORN_ADDON_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_teach_choices()
{
	Info_ClearChoices(dia_addon_cavalorn_teach);
	Info_AddChoice(dia_addon_cavalorn_teach,DIALOG_BACK,dia_addon_cavalorn_teach_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring("Pl�en�",b_getlearncosttalent(other,NPC_TALENT_SNEAK,1)),dia_addon_cavalorn_teach_sneak);
	};
	Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_addon_cavalorn_teach_bow_1);
	Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 5),dia_addon_cavalorn_teach_bow_5);
	Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_addon_cavalorn_teach_1h_1);
	Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,1) * 5),dia_addon_cavalorn_teach_1h_5);
};

func void dia_addon_cavalorn_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//Chci se nau�it tvoje schopnosti.
	AI_Output(self,other,"DIA_Addon_Cavalorn_TEACH_08_01");	//Jasn�, co chce� v�d�t?
	ADDON_CAVALORN_MERKE_BOW = other.hitchance[NPC_TALENT_BOW];
	ADDON_CAVALORN_MERKE_1H = other.hitchance[NPC_TALENT_1H];
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_sneak()
{
	if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Teach_Sneak_08_00");	//S lehk�m na�lapov�n�m, bude� m�t lep�� �anci se k nep��teli dostat nezpozorov�n.
	};
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_bow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,90);
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_bow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,90);
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,30);
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,30);
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_back()
{
	if((ADDON_CAVALORN_MERKE_BOW < other.hitchance[NPC_TALENT_BOW]) || (ADDON_CAVALORN_MERKE_1H < other.hitchance[NPC_TALENT_1H]))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Teach_BACK_08_00");	//Mnohem lep��. Zapomn�l jsi hodn�, ale dostaneme t� zp�t do formy.
	};
	Info_ClearChoices(dia_addon_cavalorn_teach);
};

