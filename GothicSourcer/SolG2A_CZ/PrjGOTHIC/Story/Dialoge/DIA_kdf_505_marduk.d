
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
	description = "Jakou práci tu vykonáváš?";
};


func int dia_marduk_job_condition()
{
	return TRUE;
};

func void dia_marduk_job_info()
{
	AI_Output(other,self,"DIA_Marduk_JOB_15_00");	//Jakou práci tu vykonáváš?
	AI_Output(self,other,"DIA_Marduk_JOB_05_01");	//Pøipravuji paladiny na boj proti Zlu
};


instance DIA_MARDUK_ARBEIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 3;
	condition = dia_marduk_arbeit_condition;
	information = dia_marduk_arbeit_info;
	permanent = FALSE;
	description = "Mohu pro tebe nìco udìlat, mistøe?";
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
	AI_Output(other,self,"DIA_Marduk_Arbeit_15_00");	//Mohu pro tebe nìco udìlat, mistøe?
	AI_Output(self,other,"DIA_Marduk_Arbeit_05_01");	//Pro mì? Ne, nepotøebuji tvou pomoc. Radìji se modli za blaho Innosových váleèníkù, kteøí se vydali do Hornického údolí.
	MIS_MARDUKBETEN = LOG_RUNNING;
	b_startotherroutine(sergio,"WAIT");
	Log_CreateTopic(TOPIC_MARDUKBETEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MARDUKBETEN,LOG_RUNNING);
	b_logentry(TOPIC_MARDUKBETEN,"Mistr Marduk pro mì nemá žádné úkoly. Prý se mám radši pomodlit za paladiny.");
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
	AI_Output(self,other,"DIA_Marduk_Gebetet_05_01");	//Dobøe jsi uèinil. Nyní si bìž opìt po své práci.
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
	AI_Output(self,other,"DIA_Marduk_Evil_05_01");	//Zlo je všude. Je to moc Beliara, Innosova vìèného protivníka.
	AI_Output(self,other,"DIA_Marduk_Evil_05_02");	//Je to všezastírající temnota snažící se navždy zhasnout Innosovo svìtlo.
	AI_Output(self,other,"DIA_Marduk_Evil_05_03");	//Beliar je Pán Temnot, Nenávisti a Nièení.
	AI_Output(self,other,"DIA_Marduk_Evil_05_04");	//Jen ti z nás, jejichž srdce plane Innosových Svatým ohnìm, mohou do svìta vnést blažené Innosovo svìtlo a zahubit temnotu.
};


instance DIA_MARDUK_PAL(C_INFO)
{
	npc = kdf_505_marduk;
	condition = dia_marduk_pal_condition;
	information = dia_marduk_pal_info;
	permanent = FALSE;
	description = "Tady v klášteøe ale žijí jen mágové a novicové.";
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
	AI_Output(other,self,"DIA_Marduk_Pal_15_00");	//Tady v klášteøe ale žijí jen mágové a novicové.
	AI_Output(self,other,"DIA_Marduk_Pal_05_01");	//Pøesnì tak. Na rozdíl od našeho spoleèenství, které uctívá Innosovo uèení...
	AI_Output(self,other,"DIA_Marduk_Pal_05_02");	//... paladinové vzdávají nejvyšší hold velkým skutkùm našeho Pána.
	AI_Output(self,other,"DIA_Marduk_Pal_05_03");	//My jsme Innosovými zástupci, ale paladinové jsou jeho váleèníky, kteøí vyrážejí v jeho jménì do bitev a šíøí jeho slávu.
};


instance DIA_MARDUK_BEFORETEACH(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 3;
	condition = dia_marduk_beforeteach_condition;
	information = dia_marduk_beforeteach_info;
	permanent = FALSE;
	description = "Mohl bys mì nìco nauèit?";
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
	AI_Output(other,self,"DIA_Marduk_BEFORETEACH_15_00");	//Mohl bys mì nìco nauèit?
	AI_Output(self,other,"DIA_Marduk_BEFORETEACH_05_01");	//Jsem odborník na magii ledu a bouøe. Mohu tì nauèit jejich síle.
	if(other.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Marduk_BEFORETEACH_05_02");	//Uèím však jen mágy.
	};
};


instance DIA_MARDUK_TEACH(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 10;
	condition = dia_marduk_teach_condition;
	information = dia_marduk_teach_info;
	permanent = TRUE;
	description = "Uè mì. (vytvoøit runy).";
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
	AI_Output(other,self,"DIA_Marduk_TEACH_15_00");	//Uè mì.
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
		AI_Output(self,other,"DIA_Marduk_TEACH_05_01");	//V tuto chvíli tì uèit nemohu.
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
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_00");	//Vítej, synu.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_01");	//Odkdy jsi jedním z paladinù?
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_02");	//Odkud jsi pøišel?
	};
	Info_ClearChoices(dia_marduk_kap3_hello);
	Info_AddChoice(dia_marduk_kap3_hello,"Do toho ti nic není.",dia_marduk_kap3_hello_notyourconcern);
	if(hero.guild == GIL_PAL)
	{
		Info_AddChoice(dia_marduk_kap3_hello,"Teprve chvíli.",dia_marduk_kap3_hello_soon);
	};
	if(hero.guild == GIL_DJG)
	{
		Info_AddChoice(dia_marduk_kap3_hello,"Pøišel jsem z farem.",dia_marduk_kap3_hello_djg);
	};
};

func void dia_marduk_kap3_hello_notyourconcern()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_NotYourConcern_15_00");	//Do toho ti nic není.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_01");	//(káravì) Paladin by mìl být za všech okolností zdvoøilý a slušný. Tvým úkolem je chránit ty, kteøí se nemohou chránit sami.
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_02");	//(káravì) Je to privilegium a mìl bys být vdìèný, že ti Innos nabízí tuto možnost. Zamysli se nad tím!
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_03");	//(rozzlobenì) Bývaly èasy, kdy lùza nemìla povolen vstup do našeho svatého kláštera. Jsi dùkazem, že ty èasy bývaly lepší.
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_04");	//(varovnì) Varuji tì, nic tady nezkoušej, jinak budeš okamžitì potrestán. Na nìjakou zbyteènou mírnost si nepotrpíme.
	};
	Info_ClearChoices(dia_marduk_kap3_hello);
};

func void dia_marduk_kap3_hello_soon()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_Soon_15_00");	//Teprve chvíli.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Soon_05_01");	//V tom pøípadì tì vítám. V téhle bitvì budeme potøebovat každého muže, jenž má dost odvahy postavit se Zlu.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Soon_05_02");	//Osud nás všech leží v rukou lidí, jako jsi ty. Nech ti Innos dá vždy tolik odvahy, kolik budeš potøebovat.
	Info_ClearChoices(dia_marduk_kap3_hello);
};

func void dia_marduk_kap3_hello_djg()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_DJG_15_00");	//Pøišel jsem z farem.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_DJG_05_01");	//V tom pøípadì mi pohostinnost velí tì pøivítat. Doufám, že toho nebudu litovat.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_DJG_05_02");	//Nesnaž se zneužít svého postavení hosta, nebo budeš mít velké problémy.
	Info_ClearChoices(dia_marduk_kap3_hello);
};


instance DIA_MARDUK_TRAINPALS(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 32;
	condition = dia_marduk_trainpals_condition;
	information = dia_marduk_trainpals_info;
	permanent = TRUE;
	description = "Co mì mùžeš nauèit?";
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
	AI_Output(other,self,"DIA_Marduk_TrainPals_15_00");	//Co mì mùžeš nauèit?
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_01");	//Samozøejmì, že tì nemohu uèit ve zpùsobech vedení boje.
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_02");	//Ale mohu ti pøiblížit Innosovu podstatu a jeho dary.
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_03");	//Kromì toho je mým úkolem pøipravit tì na rituál posvìcení meèe.
	AI_Output(other,self,"DIA_Marduk_TrainPals_15_04");	//A magie?
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_05");	//Zde uèíme pouze naše druhy magie. Kouzlùm paladinù se musíš nauèit ve mìstì.
	Info_ClearChoices(dia_marduk_trainpals);
	Info_AddChoice(dia_marduk_trainpals,"Možná pozdìji.",dia_marduk_trainpals_later);
	Info_AddChoice(dia_marduk_trainpals,"Co tím myslíš?",dia_marduk_trainpals_meaning);
	Info_AddChoice(dia_marduk_trainpals,"Co je posvìcení meèe?",dia_marduk_trainpals_blessing);
};

func void dia_marduk_trainpals_later()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Later_15_00");	//Možná pozdìji.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Later_05_01");	//Jsi zde kdykoliv srdeènì vítán.
	Info_ClearChoices(dia_marduk_trainpals);
};

func void dia_marduk_trainpals_meaning()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Meaning_15_00");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_01");	//Když musel Innos opustit náš svìt, zanechal lidstvu èást své svaté síly.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_02");	//Jen málo lidem je povoleno používat jeho moc a dohlížet jeho jménem na spravedlnost.
	AI_Output(other,self,"DIA_Marduk_TrainPals_Meaning_15_03");	//A co mi chceš pøiblížit?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_04");	//Mohu tì nasmìrovat na správnou cestu, abys rozeznal Innosovu podstatu a následoval jej.
};

func void dia_marduk_trainpals_blessing()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Blessing_15_00");	//Co je posvìcení meèe?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_01");	//Posvìcení meèe je jeden z nejsvatìjších rituálù všech paladinù.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_02");	//Bìhem ceremonie proudí skrz èepel paladinova meèe Innosova síla a dává zbrani netušenou moc.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_03");	//Takto posvìcený meè je paladinovým nejcennìjším majetkem a bude jej provázet celým životem.
	MARDUK_TRAINPALS_PERMANENT = TRUE;
};


instance DIA_MARDUK_SWORDBLESSING(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 33;
	condition = dia_marduk_swordblessing_condition;
	information = dia_marduk_swordblessing_info;
	permanent = TRUE;
	description = "Chci posvìtit svùj meè.";
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
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_15_00");	//Chci posvìtit svùj meè.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_01");	//Pokud jsi rozhodnut podniknout tento krok, budeš nejprve potøebovat magický meè.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_02");	//S ním bys mìl zajít do kaple a modlit se tam.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_03");	//Bìhem modliteb - a po uvážlivém daru našemu Pánu Innosovi - bys mìl Innose požádat o pøízeò a vedení v bitvì proti Zlu.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_04");	//Pokud ti bude Innos pøíznivì naklonìn, bude od té chvíle tvùj meè posvìcený naším Pánem.
	Info_ClearChoices(dia_marduk_swordblessing);
	Info_AddChoice(dia_marduk_swordblessing,DIALOG_BACK,dia_marduk_swordblessing_back);
	Info_AddChoice(dia_marduk_swordblessing,"Jaká forma daru to má být?",dia_marduk_swordblessing_donation);
	Info_AddChoice(dia_marduk_swordblessing,"Kde mohu sehnat magický meè?",dia_marduk_swordblessing_oreblade);
};

func void dia_marduk_swordblessing_back()
{
	Info_ClearChoices(dia_marduk_swordblessing);
};

func void dia_marduk_swordblessing_donation()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_Donation_15_00");	//Jaká forma daru to má být?
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_Donation_05_01");	//Inu, s pøihlédnutím k milosti, která na tebe bude vložena, vypadá obnos 5000 zlatých velice pøimìøenì.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_Donation_05_02");	//Mùžeš ovšem klidnì vìnovat i víc.
};

func void dia_marduk_swordblessing_oreblade()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_OreBlade_15_00");	//Kde mohu sehnat magický meè?
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_01");	//Zkus se zeptat ve mìstì kováøe Harada.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_02");	//Pokud jsou paladinové na ostrovì, dodává jim magické meèe.
	if(Npc_IsDead(harad) == TRUE)
	{
		AI_Output(other,self,"DIA_Marduk_SwordBlessing_OreBlade_15_03");	//Harad je mrtvý.
		AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_04");	//To je mi líto, v tom pøípadì si budeš muset poèkat, až se s ostatními paladiny vrátíš na pevninu.
	};
};


instance DIA_MARDUK_KAP3_PERM(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 39;
	condition = dia_marduk_kap3_perm_condition;
	information = dia_marduk_kap3_perm_info;
	permanent = TRUE;
	description = "Co je nového?";
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
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_15_00");	//Co je nového?
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_01");	//Ano, nepøíteli se podaøilo nasadit do našich posvátných prostor zrádce.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_02");	//Ukradl Innosovo oko, jeden z našich nejdùležitìjších artefaktù. A to je jenom vrcholek ledovce.
	};
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_04");	//(znepokojenì) Nepøítel se oèividnì dostal do mìsta.
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_15_05");	//Co myslíš?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_06");	//Na ulici byl zavraždìn jeden z paladinù, Lothar.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_07");	//(rozzlobenì) Za božího dne! Zašlo to už pøíliš daleko, ale obávám se, že to je jen zaèátek.
	Info_ClearChoices(dia_marduk_kap3_perm);
	Info_AddChoice(dia_marduk_kap3_perm,DIALOG_BACK,dia_marduk_kap3_perm_back);
	Info_AddChoice(dia_marduk_kap3_perm,"Co se bude dít teï?",dia_marduk_kap3_perm_andnow);
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		Info_AddChoice(dia_marduk_kap3_perm,"Bennet je nevinný.",dia_marduk_kap3_perm_bennetisnotguilty);
	}
	else
	{
		Info_AddChoice(dia_marduk_kap3_perm,"Už byl ten vrah chycen?",dia_marduk_kap3_perm_murderer);
	};
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		Info_AddChoice(dia_marduk_kap3_perm,"Kam ten zlodìj šel?",dia_marduk_kap3_perm_thief);
	};
};

func void dia_marduk_kap3_perm_back()
{
	Info_ClearChoices(dia_marduk_kap3_perm);
};

func void dia_marduk_kap3_perm_andnow()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_AndNow_15_00");	//Co se bude dít teï?
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_01");	//Budeme zlodìje pronásledovat, jedno jak daleko. Chytíme ho a postaráme se, aby jej stihl odpovídající trest.
		AI_Output(other,self,"DIA_Marduk_Kap3_PERM_AndNow_15_02");	//Na to ale budeme nejprve muset zjistit, kdo tím zlodìjem je.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_03");	//Brzy na to pøijdeme. A a už nám to bude trvat jakkoliv dlouho, najdeme ho.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_04");	//To pøísahám u Innose.
	}
	else
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_05");	//Vražda, navíc vražda paladina, je jeden z nejhorších možných zloèinù.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_06");	//Vrah bude bezpochyby odsouzen k smrti.
	};
};

func void dia_marduk_kap3_perm_bennetisnotguilty()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_00");	//Bennet je nevinen. Ten svìdek lhal.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_01");	//Jak to víš?
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_02");	//Našel jsem dùkaz.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_03");	//Nìkdy mám pocit, že našimi nejvìtšími nepøáteli jsou zrada a hamižnost.
};

func void dia_marduk_kap3_perm_murderer()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_Murderer_15_00");	//Už byl ten vrah chycen?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_Murderer_05_01");	//Naštìstí ano. Byl to jeden z tìch hrdloøezù z Onarovy farmy.
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_Murderer_15_02");	//Kdo?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_Murderer_05_03");	//Nevím, jak se jmenuje. Mezi tìmi žoldáky je ale jistì pár takových, od nichž by tì takový skutek nepøekvapil.
};

func void dia_marduk_kap3_perm_thief()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_thief_15_00");	//Kam ten zlodìj šel?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_thief_05_01");	//To nevím, odbìhl smìrem k bránì, jako by byl posedlý, a pak zmizel.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_thief_05_02");	//Ale a už se schová kamkoliv, a si zaleze pod jakýkoliv kámen, Innosùv vztek jej srazí a spálí jeho èernou duši.
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
	description = "Co je nového?";
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
	AI_Output(other,self,"DIA_Marduk_Kap4U5_PERM_15_00");	//Co je nového?
	AI_Output(self,other,"DIA_Marduk_Kap4U5_PERM_05_01");	//Ne, bohužel ne, situace je stále velice kritická.
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

