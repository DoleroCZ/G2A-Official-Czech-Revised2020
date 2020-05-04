
instance DIA_MARDUK_KAP1_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap1_exit_condition;
	information = dia_marduk_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_marduk_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_JOB(C_INFO)
{
	npc = kdf_505_marduk;
	condition = dia_marduk_job_condition;
	information = dia_marduk_job_info;
	permanent = FALSE;
	description = "Jakou pr�ci tu vykon�v�?";
};


func int dia_marduk_job_condition()
{
	return TRUE;
};

func void dia_marduk_job_info()
{
	AI_Output(other,self,"DIA_Marduk_JOB_15_00");	//Jakou pr�ci tu vykon�v�?
	AI_Output(self,other,"DIA_Marduk_JOB_05_01");	//P�ipravuji paladiny na boj proti Zlu
};


instance DIA_MARDUK_ARBEIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 3;
	condition = dia_marduk_arbeit_condition;
	information = dia_marduk_arbeit_info;
	permanent = FALSE;
	description = "Mohu pro tebe n�co ud�lat, mist�e?";
};


func int dia_marduk_arbeit_condition()
{
	if(MIS_KLOSTERARBEIT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_marduk_arbeit_info()
{
	AI_Output(other,self,"DIA_Marduk_Arbeit_15_00");	//Mohu pro tebe n�co ud�lat, mist�e?
	AI_Output(self,other,"DIA_Marduk_Arbeit_05_01");	//Pro m�? Ne, nepot�ebuji tvou pomoc. Rad�ji se modli za blaho Innosov�ch v�le�n�k�, kte�� se vydali do Hornick�ho �dol�.
	MIS_MARDUKBETEN = LOG_RUNNING;
	b_startotherroutine(sergio,"WAIT");
	Log_CreateTopic(TOPIC_MARDUKBETEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MARDUKBETEN,LOG_RUNNING);
	b_logentry(TOPIC_MARDUKBETEN,"Mistr Marduk pro m� nem� ��dn� �koly. Pr� se m�m rad�i pomodlit za paladiny.");
};


instance DIA_MARDUK_GEBETET(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 3;
	condition = dia_marduk_gebetet_condition;
	information = dia_marduk_gebetet_info;
	permanent = FALSE;
	description = "Pomodlil jsem se za paladiny.";
};


func int dia_marduk_gebetet_condition()
{
	if((MIS_MARDUKBETEN == LOG_RUNNING) && Npc_KnowsInfo(other,pc_prayshrine_paladine))
	{
		return TRUE;
	};
};

func void dia_marduk_gebetet_info()
{
	AI_Output(other,self,"DIA_Marduk_Gebetet_15_00");	//Pomodlil jsem se za paladiny.
	AI_Output(self,other,"DIA_Marduk_Gebetet_05_01");	//Dob�e jsi u�inil. Nyn� si b� op�t po sv� pr�ci.
	MIS_MARDUKBETEN = LOG_SUCCESS;
	b_giveplayerxp(XP_MARDUKBETEN);
	b_startotherroutine(sergio,"START");
};


instance DIA_MARDUK_EVIL(C_INFO)
{
	npc = kdf_505_marduk;
	condition = dia_marduk_evil_condition;
	information = dia_marduk_evil_info;
	permanent = TRUE;
	description = "Co je to 'Zlo'?";
};


func int dia_marduk_evil_condition()
{
	if(Npc_KnowsInfo(hero,dia_marduk_job))
	{
		return TRUE;
	};
};

func void dia_marduk_evil_info()
{
	AI_Output(other,self,"DIA_Marduk_Evil_15_00");	//Co je to 'Zlo'?
	AI_Output(self,other,"DIA_Marduk_Evil_05_01");	//Zlo je v�ude. Je to moc Beliara, Innosova v��n�ho protivn�ka.
	AI_Output(self,other,"DIA_Marduk_Evil_05_02");	//Je to v�ezast�raj�c� temnota sna��c� se nav�dy zhasnout Innosovo sv�tlo.
	AI_Output(self,other,"DIA_Marduk_Evil_05_03");	//Beliar je P�n Temnot, Nen�visti a Ni�en�.
	AI_Output(self,other,"DIA_Marduk_Evil_05_04");	//Jen ti z n�s, jejich� srdce plane Innosov�ch Svat�m ohn�m, mohou do sv�ta vn�st bla�en� Innosovo sv�tlo a zahubit temnotu.
};


instance DIA_MARDUK_PAL(C_INFO)
{
	npc = kdf_505_marduk;
	condition = dia_marduk_pal_condition;
	information = dia_marduk_pal_info;
	permanent = FALSE;
	description = "Tady v kl�te�e ale �ij� jen m�gov� a novicov�.";
};


func int dia_marduk_pal_condition()
{
	if(Npc_KnowsInfo(hero,dia_marduk_job))
	{
		return TRUE;
	};
};

func void dia_marduk_pal_info()
{
	AI_Output(other,self,"DIA_Marduk_Pal_15_00");	//Tady v kl�te�e ale �ij� jen m�gov� a novicov�.
	AI_Output(self,other,"DIA_Marduk_Pal_05_01");	//P�esn� tak. Na rozd�l od na�eho spole�enstv�, kter� uct�v� Innosovo u�en�...
	AI_Output(self,other,"DIA_Marduk_Pal_05_02");	//... paladinov� vzd�vaj� nejvy��� hold velk�m skutk�m na�eho P�na.
	AI_Output(self,other,"DIA_Marduk_Pal_05_03");	//My jsme Innosov�mi z�stupci, ale paladinov� jsou jeho v�le�n�ky, kte�� vyr�ej� v jeho jm�n� do bitev a ���� jeho sl�vu.
};


instance DIA_MARDUK_BEFORETEACH(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 3;
	condition = dia_marduk_beforeteach_condition;
	information = dia_marduk_beforeteach_info;
	permanent = FALSE;
	description = "Mohl bys m� n�co nau�it?";
};


func int dia_marduk_beforeteach_condition()
{
	if(Npc_KnowsInfo(hero,dia_marduk_job))
	{
		return TRUE;
	};
};

func void dia_marduk_beforeteach_info()
{
	AI_Output(other,self,"DIA_Marduk_BEFORETEACH_15_00");	//Mohl bys m� n�co nau�it?
	AI_Output(self,other,"DIA_Marduk_BEFORETEACH_05_01");	//Jsem odborn�k na magii ledu a bou�e. Mohu t� nau�it jejich s�le.
	if(other.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Marduk_BEFORETEACH_05_02");	//U��m v�ak jen m�gy.
	};
};


instance DIA_MARDUK_TEACH(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 10;
	condition = dia_marduk_teach_condition;
	information = dia_marduk_teach_info;
	permanent = TRUE;
	description = "U� m�. (vytvo�it runy).";
};


func int dia_marduk_teach_condition()
{
	if(Npc_KnowsInfo(hero,dia_marduk_beforeteach) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_marduk_teach_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Marduk_TEACH_15_00");	//U� m�.
	Info_ClearChoices(dia_marduk_teach);
	Info_AddChoice(dia_marduk_teach,DIALOG_BACK,dia_marduk_teach_back);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_ZAP] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_ZAP,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ZAP)),dia_marduk_teach_zap);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_ICEBOLT] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_ICEBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEBOLT)),dia_marduk_teach_icebolt);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_ICECUBE] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_ICECUBE,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICECUBE)),dia_marduk_teach_icecube);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_CHARGEZAP] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_CHARGEZAP,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_CHARGEZAP)),dia_marduk_teach_thunderball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_LIGHTNINGFLASH] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_LIGHTNINGFLASH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHTNINGFLASH)),dia_marduk_teach_lightningflash);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_ICEWAVE] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_ICEWAVE,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEWAVE)),dia_marduk_teach_icewave);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Marduk_TEACH_05_01");	//V tuto chv�li t� u�it nemohu.
		Info_ClearChoices(dia_marduk_teach);
	};
};

func void dia_marduk_teach_back()
{
	Info_ClearChoices(dia_marduk_teach);
};

func void dia_marduk_teach_zap()
{
	b_teachplayertalentrunes(self,other,SPL_ZAP);
};

func void dia_marduk_teach_icebolt()
{
	b_teachplayertalentrunes(self,other,SPL_ICEBOLT);
};

func void dia_marduk_teach_lightningflash()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTNINGFLASH);
};

func void dia_marduk_teach_icecube()
{
	b_teachplayertalentrunes(self,other,SPL_ICECUBE);
};

func void dia_marduk_teach_thunderball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEZAP);
};

func void dia_marduk_teach_icewave()
{
	b_teachplayertalentrunes(self,other,SPL_ICEWAVE);
};


instance DIA_MARDUK_KAP2_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap2_exit_condition;
	information = dia_marduk_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_marduk_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_KAP3_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap3_exit_condition;
	information = dia_marduk_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_marduk_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_KAP3_HELLO(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 30;
	condition = dia_marduk_kap3_hello_condition;
	information = dia_marduk_kap3_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_marduk_kap3_hello_condition()
{
	if((KAPITEL == 3) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_marduk_kap3_hello_info()
{
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_00");	//V�tej, synu.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_01");	//Odkdy jsi jedn�m z paladin�?
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_02");	//Odkud jsi p�i�el?
	};
	Info_ClearChoices(dia_marduk_kap3_hello);
	Info_AddChoice(dia_marduk_kap3_hello,"Do toho ti nic nen�.",dia_marduk_kap3_hello_notyourconcern);
	if(hero.guild == GIL_PAL)
	{
		Info_AddChoice(dia_marduk_kap3_hello,"Teprve chv�li.",dia_marduk_kap3_hello_soon);
	};
	if(hero.guild == GIL_DJG)
	{
		Info_AddChoice(dia_marduk_kap3_hello,"P�i�el jsem z farem.",dia_marduk_kap3_hello_djg);
	};
};

func void dia_marduk_kap3_hello_notyourconcern()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_NotYourConcern_15_00");	//Do toho ti nic nen�.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_01");	//(k�rav�) Paladin by m�l b�t za v�ech okolnost� zdvo�il� a slu�n�. Tv�m �kolem je chr�nit ty, kte�� se nemohou chr�nit sami.
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_02");	//(k�rav�) Je to privilegium a m�l bys b�t vd��n�, �e ti Innos nab�z� tuto mo�nost. Zamysli se nad t�m!
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_03");	//(rozzloben�) B�valy �asy, kdy l�za nem�la povolen vstup do na�eho svat�ho kl�tera. Jsi d�kazem, �e ty �asy b�valy lep��.
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_04");	//(varovn�) Varuji t�, nic tady nezkou�ej, jinak bude� okam�it� potrest�n. Na n�jakou zbyte�nou m�rnost si nepotrp�me.
	};
	Info_ClearChoices(dia_marduk_kap3_hello);
};

func void dia_marduk_kap3_hello_soon()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_Soon_15_00");	//Teprve chv�li.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Soon_05_01");	//V tom p��pad� t� v�t�m. V t�hle bitv� budeme pot�ebovat ka�d�ho mu�e, jen� m� dost odvahy postavit se Zlu.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Soon_05_02");	//Osud n�s v�ech le�� v rukou lid�, jako jsi ty. Nech� ti Innos d� v�dy tolik odvahy, kolik bude� pot�ebovat.
	Info_ClearChoices(dia_marduk_kap3_hello);
};

func void dia_marduk_kap3_hello_djg()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_DJG_15_00");	//P�i�el jsem z farem.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_DJG_05_01");	//V tom p��pad� mi pohostinnost vel� t� p�iv�tat. Douf�m, �e toho nebudu litovat.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_DJG_05_02");	//Nesna� se zneu��t sv�ho postaven� hosta, nebo bude� m�t velk� probl�my.
	Info_ClearChoices(dia_marduk_kap3_hello);
};


instance DIA_MARDUK_TRAINPALS(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 32;
	condition = dia_marduk_trainpals_condition;
	information = dia_marduk_trainpals_info;
	permanent = TRUE;
	description = "Co m� m��e� nau�it?";
};


var int marduk_trainpals_permanent;

func int dia_marduk_trainpals_condition()
{
	if((hero.guild == GIL_PAL) && (MARDUK_TRAINPALS_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_marduk_trainpals_info()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_15_00");	//Co m� m��e� nau�it?
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_01");	//Samoz�ejm�, �e t� nemohu u�it ve zp�sobech veden� boje.
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_02");	//Ale mohu ti p�ibl�it Innosovu podstatu a jeho dary.
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_03");	//Krom� toho je m�m �kolem p�ipravit t� na ritu�l posv�cen� me�e.
	AI_Output(other,self,"DIA_Marduk_TrainPals_15_04");	//A magie?
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_05");	//Zde u��me pouze na�e druhy magie. Kouzl�m paladin� se mus� nau�it ve m�st�.
	Info_ClearChoices(dia_marduk_trainpals);
	Info_AddChoice(dia_marduk_trainpals,"Mo�n� pozd�ji.",dia_marduk_trainpals_later);
	Info_AddChoice(dia_marduk_trainpals,"Co t�m mysl�?",dia_marduk_trainpals_meaning);
	Info_AddChoice(dia_marduk_trainpals,"Co je posv�cen� me�e?",dia_marduk_trainpals_blessing);
};

func void dia_marduk_trainpals_later()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Later_15_00");	//Mo�n� pozd�ji.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Later_05_01");	//Jsi zde kdykoliv srde�n� v�t�n.
	Info_ClearChoices(dia_marduk_trainpals);
};

func void dia_marduk_trainpals_meaning()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Meaning_15_00");	//Co t�m mysl�?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_01");	//Kdy� musel Innos opustit n� sv�t, zanechal lidstvu ��st sv� svat� s�ly.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_02");	//Jen m�lo lidem je povoleno pou��vat jeho moc a dohl�et jeho jm�nem na spravedlnost.
	AI_Output(other,self,"DIA_Marduk_TrainPals_Meaning_15_03");	//A co mi chce� p�ibl�it?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_04");	//Mohu t� nasm�rovat na spr�vnou cestu, abys rozeznal Innosovu podstatu a n�sledoval jej.
};

func void dia_marduk_trainpals_blessing()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Blessing_15_00");	//Co je posv�cen� me�e?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_01");	//Posv�cen� me�e je jeden z nejsvat�j��ch ritu�l� v�ech paladin�.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_02");	//B�hem ceremonie proud� skrz �epel paladinova me�e Innosova s�la a d�v� zbrani netu�enou moc.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_03");	//Takto posv�cen� me� je paladinov�m nejcenn�j��m majetkem a bude jej prov�zet cel�m �ivotem.
	MARDUK_TRAINPALS_PERMANENT = TRUE;
};


instance DIA_MARDUK_SWORDBLESSING(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 33;
	condition = dia_marduk_swordblessing_condition;
	information = dia_marduk_swordblessing_info;
	permanent = TRUE;
	description = "Chci posv�tit sv�j me�.";
};


func int dia_marduk_swordblessing_condition()
{
	if(MARDUK_TRAINPALS_PERMANENT == TRUE)
	{
		return TRUE;
	};
};

func void dia_marduk_swordblessing_info()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_15_00");	//Chci posv�tit sv�j me�.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_01");	//Pokud jsi rozhodnut podniknout tento krok, bude� nejprve pot�ebovat magick� me�.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_02");	//S n�m bys m�l zaj�t do kaple a modlit se tam.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_03");	//B�hem modliteb - a po uv�liv�m daru na�emu P�nu Innosovi - bys m�l Innose po��dat o p��ze� a veden� v bitv� proti Zlu.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_04");	//Pokud ti bude Innos p��zniv� naklon�n, bude od t� chv�le tv�j me� posv�cen� na��m P�nem.
	Info_ClearChoices(dia_marduk_swordblessing);
	Info_AddChoice(dia_marduk_swordblessing,DIALOG_BACK,dia_marduk_swordblessing_back);
	Info_AddChoice(dia_marduk_swordblessing,"Jak� forma daru to m� b�t?",dia_marduk_swordblessing_donation);
	Info_AddChoice(dia_marduk_swordblessing,"Kde mohu sehnat magick� me�?",dia_marduk_swordblessing_oreblade);
};

func void dia_marduk_swordblessing_back()
{
	Info_ClearChoices(dia_marduk_swordblessing);
};

func void dia_marduk_swordblessing_donation()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_Donation_15_00");	//Jak� forma daru to m� b�t?
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_Donation_05_01");	//Inu, s p�ihl�dnut�m k milosti, kter� na tebe bude vlo�ena, vypad� obnos 5000 zlat�ch velice p�im��en�.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_Donation_05_02");	//M��e� ov�em klidn� v�novat i v�c.
};

func void dia_marduk_swordblessing_oreblade()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_OreBlade_15_00");	//Kde mohu sehnat magick� me�?
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_01");	//Zkus se zeptat ve m�st� kov��e Harada.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_02");	//Pokud jsou paladinov� na ostrov�, dod�v� jim magick� me�e.
	if(Npc_IsDead(harad) == TRUE)
	{
		AI_Output(other,self,"DIA_Marduk_SwordBlessing_OreBlade_15_03");	//Harad je mrtv�.
		AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_04");	//To je mi l�to, v tom p��pad� si bude� muset po�kat, a� se s ostatn�mi paladiny vr�t� na pevninu.
	};
};


instance DIA_MARDUK_KAP3_PERM(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 39;
	condition = dia_marduk_kap3_perm_condition;
	information = dia_marduk_kap3_perm_info;
	permanent = TRUE;
	description = "Co je nov�ho?";
};


func int dia_marduk_kap3_perm_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_marduk_kap3_perm_info()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_15_00");	//Co je nov�ho?
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_01");	//Ano, nep��teli se poda�ilo nasadit do na�ich posv�tn�ch prostor zr�dce.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_02");	//Ukradl Innosovo oko, jeden z na�ich nejd�le�it�j��ch artefakt�. A to je jenom vrcholek ledovce.
	};
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_04");	//(znepokojen�) Nep��tel se o�ividn� dostal do m�sta.
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_15_05");	//Co mysl�?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_06");	//Na ulici byl zavra�d�n jeden z paladin�, Lothar.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_07");	//(rozzloben�) Za bo��ho dne! Za�lo to u� p��li� daleko, ale ob�v�m se, �e to je jen za��tek.
	Info_ClearChoices(dia_marduk_kap3_perm);
	Info_AddChoice(dia_marduk_kap3_perm,DIALOG_BACK,dia_marduk_kap3_perm_back);
	Info_AddChoice(dia_marduk_kap3_perm,"Co se bude d�t te�?",dia_marduk_kap3_perm_andnow);
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		Info_AddChoice(dia_marduk_kap3_perm,"Bennet je nevinn�.",dia_marduk_kap3_perm_bennetisnotguilty);
	}
	else
	{
		Info_AddChoice(dia_marduk_kap3_perm,"U� byl ten vrah chycen?",dia_marduk_kap3_perm_murderer);
	};
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		Info_AddChoice(dia_marduk_kap3_perm,"Kam ten zlod�j �el?",dia_marduk_kap3_perm_thief);
	};
};

func void dia_marduk_kap3_perm_back()
{
	Info_ClearChoices(dia_marduk_kap3_perm);
};

func void dia_marduk_kap3_perm_andnow()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_AndNow_15_00");	//Co se bude d�t te�?
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_01");	//Budeme zlod�je pron�sledovat, jedno jak daleko. Chyt�me ho a postar�me se, aby jej stihl odpov�daj�c� trest.
		AI_Output(other,self,"DIA_Marduk_Kap3_PERM_AndNow_15_02");	//Na to ale budeme nejprve muset zjistit, kdo t�m zlod�jem je.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_03");	//Brzy na to p�ijdeme. A a� u� n�m to bude trvat jakkoliv dlouho, najdeme ho.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_04");	//To p��sah�m u Innose.
	}
	else
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_05");	//Vra�da, nav�c vra�da paladina, je jeden z nejhor��ch mo�n�ch zlo�in�.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_06");	//Vrah bude bezpochyby odsouzen k smrti.
	};
};

func void dia_marduk_kap3_perm_bennetisnotguilty()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_00");	//Bennet je nevinen. Ten sv�dek lhal.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_01");	//Jak to v�?
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_02");	//Na�el jsem d�kaz.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_03");	//N�kdy m�m pocit, �e na�imi nejv�t��mi nep��teli jsou zrada a hami�nost.
};

func void dia_marduk_kap3_perm_murderer()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_Murderer_15_00");	//U� byl ten vrah chycen?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_Murderer_05_01");	//Na�t�st� ano. Byl to jeden z t�ch hrdlo�ez� z Onarovy farmy.
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_Murderer_15_02");	//Kdo?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_Murderer_05_03");	//Nev�m, jak se jmenuje. Mezi t�mi �old�ky je ale jist� p�r takov�ch, od nich� by t� takov� skutek nep�ekvapil.
};

func void dia_marduk_kap3_perm_thief()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_thief_15_00");	//Kam ten zlod�j �el?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_thief_05_01");	//To nev�m, odb�hl sm�rem k br�n�, jako by byl posedl�, a pak zmizel.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_thief_05_02");	//Ale a� u� se schov� kamkoliv, a� si zaleze pod jak�koliv k�men, Innos�v vztek jej sraz� a sp�l� jeho �ernou du�i.
};


instance DIA_MARDUK_KAP4_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap4_exit_condition;
	information = dia_marduk_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_marduk_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_KAP4U5_PERM(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 49;
	condition = dia_marduk_kap4u5_perm_condition;
	information = dia_marduk_kap4u5_perm_info;
	permanent = TRUE;
	description = "Co je nov�ho?";
};


func int dia_marduk_kap4u5_perm_condition()
{
	if((KAPITEL == 4) || (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_marduk_kap4u5_perm_info()
{
	AI_Output(other,self,"DIA_Marduk_Kap4U5_PERM_15_00");	//Co je nov�ho?
	AI_Output(self,other,"DIA_Marduk_Kap4U5_PERM_05_01");	//Ne, bohu�el ne, situace je st�le velice kritick�.
};


instance DIA_MARDUK_KAP5_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap5_exit_condition;
	information = dia_marduk_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_marduk_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_PICKPOCKET(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 900;
	condition = dia_marduk_pickpocket_condition;
	information = dia_marduk_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_marduk_pickpocket_condition()
{
	return c_beklauen(36,40);
};

func void dia_marduk_pickpocket_info()
{
	Info_ClearChoices(dia_marduk_pickpocket);
	Info_AddChoice(dia_marduk_pickpocket,DIALOG_BACK,dia_marduk_pickpocket_back);
	Info_AddChoice(dia_marduk_pickpocket,DIALOG_PICKPOCKET,dia_marduk_pickpocket_doit);
};

func void dia_marduk_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_marduk_pickpocket);
};

func void dia_marduk_pickpocket_back()
{
	Info_ClearChoices(dia_marduk_pickpocket);
};

