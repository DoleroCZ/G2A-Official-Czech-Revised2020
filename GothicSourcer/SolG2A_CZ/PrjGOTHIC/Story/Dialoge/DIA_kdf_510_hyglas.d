
instance DIA_HYGLAS_KAP1_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap1_exit_condition;
	information = dia_hyglas_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_FEUER(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_feuer_condition;
	information = dia_hyglas_feuer_info;
	permanent = FALSE;
	description = "Požaduji Zkoušku ohnì.";
};


func int dia_hyglas_feuer_condition()
{
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == TRUE) && (Npc_KnowsInfo(other,dia_pyrokar_fire) == FALSE))
	{
		return TRUE;
	};
};

func void dia_hyglas_feuer_info()
{
	AI_Output(other,self,"DIA_Hyglas_Feuer_15_00");	//Požaduji Zkoušku ohnì.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_01");	//Zkouška ohnì pochází ze starých èasù a už velice dlouho jí nikdo nepodstoupil.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_02");	//Co požaduješ, je velice nebezpeèné. Radìji si to ještì rozmysli.
};


instance DIA_HYGLAS_HALLO(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_hallo_condition;
	information = dia_hyglas_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hyglas_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_hyglas_hallo_info()
{
	AI_Output(self,other,"DIA_Hyglas_Hallo_14_00");	//Jsem mistr Hyglas, Strážce ohnì a Opatrovník vìdomostí.
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_01");	//Takže mistr Parlan ti dal svolení ke studiu svitkù.
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_02");	//Tudíž pøesnì to bys teï mìl dìlat. Studovat, abys ve svatých knihách našel osvícení.
	};
};


instance DIA_HYGLAS_JOB(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_job_condition;
	information = dia_hyglas_job_info;
	permanent = FALSE;
	description = "Co studuješ ty, mistøe?";
};


func int dia_hyglas_job_condition()
{
	return TRUE;
};

func void dia_hyglas_job_info()
{
	AI_Output(other,self,"DIA_Hyglas_JOB_15_00");	//Co studuješ ty, mistøe?
	AI_Output(self,other,"DIA_Hyglas_JOB_14_01");	//Mùj výzkum se zamìøuje na oheò - Innosovu sílu.
	AI_Output(self,other,"DIA_Hyglas_JOB_14_02");	//Je to jeho dar a zároveò mocná zbraò - a já vytváøím runy, které obsahují jeho moc.
	if(other.guild == GIL_NOV)
	{
		AI_Output(other,self,"DIA_Hyglas_JOB_15_03");	//Velmi pouèné. Mohl bys mì to nauèit?
		AI_Output(self,other,"DIA_Hyglas_JOB_14_04");	//Je to Innos, kdo dává dar magie. Jen jeho služebníkùm, ohnivým mágùm, je pøáno vládnout jeho mocí.
	};
};


instance DIA_HYGLAS_CONTEST(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 9;
	condition = dia_hyglas_contest_condition;
	information = dia_hyglas_contest_info;
	permanent = FALSE;
	description = "Požádal jsem o Zkoušku ohnì. Ulthar mi dal za úkol vytvoøit runu ohnivého šípu.";
};


func int dia_hyglas_contest_condition()
{
	if(MIS_RUNE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hyglas_contest_info()
{
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_00");	//Požádal jsem o Zkoušku ohnì. Ulthar mi dal za úkol vytvoøit runu ohnivého šípu.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_01");	//A teï po mnì chceš, abych tì nauèil pøíslušnou formuli?
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_02");	//Neznám nikoho jiného, kdo by to dokázal.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_03");	//Hmm...
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_04");	//Dobrá, nauèím tì tu formuli. Ale nejdøív budeš muset najít všechny potøebné ingredience.
	b_logentry(TOPIC_RUNE,"Pokud si obstarám pøíslušné ingredience, nauèí mì Hyglas zaklínadlo pro runu ohnivého šípu.");
};


instance DIA_HYGLAS_FIREBOLT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 9;
	condition = dia_hyglas_firebolt_condition;
	information = dia_hyglas_firebolt_info;
	permanent = FALSE;
	description = "Jaké ingredience potøebuji na vytvoøení runy ohnivého šípu?";
};


func int dia_hyglas_firebolt_condition()
{
	if(Npc_KnowsInfo(hero,dia_hyglas_contest) && (MIS_RUNE == LOG_RUNNING) && (PLAYER_TALENT_RUNES[SPL_FIREBOLT] == FALSE))
	{
		return TRUE;
	};
};

func void dia_hyglas_firebolt_info()
{
	AI_Output(other,self,"DIA_Hyglas_FIREBOLT_15_00");	//Jaké ingredience potøebuji na vytvoøení runy ohnivého šípu?
	AI_Output(self,other,"DIA_Hyglas_FIREBOLT_14_01");	//Pøeèti si to - je to tam v tìch knihách.
};


instance DIA_HYGLAS_TALENT_FIREBOLT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 990;
	condition = dia_hyglas_talent_firebolt_condition;
	information = dia_hyglas_talent_firebolt_info;
	permanent = TRUE;
	description = "Nauè mì vytvoøit runu OHNIVÉHO ŠÍPU.";
};


func int dia_hyglas_talent_firebolt_condition()
{
	if(Npc_KnowsInfo(hero,dia_hyglas_contest) && (PLAYER_TALENT_RUNES[SPL_FIREBOLT] == FALSE) && (Npc_HasItems(other,itmi_runeblank) >= 1) && (Npc_HasItems(other,itsc_firebolt) >= 1) && (Npc_HasItems(other,itmi_sulfur) >= 1))
	{
		return TRUE;
	};
};

func void dia_hyglas_talent_firebolt_info()
{
	AI_Output(other,self,"DIA_Hyglas_TALENT_FIREBOLT_15_00");	//Nauè mì vytvoøit runu OHNIVÉHO ŠÍPU.
	if(b_teachplayertalentrunes(self,other,SPL_FIREBOLT))
	{
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_01");	//Pokud chceš sestavit runu ohnivého šípu, musíš na runovém stole spojit síru s runovým kamenem.
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_02");	//Síla ze svitku s kouzlem ohnivého šípu vplyne do runy a ty získáš Innosùv nástroj.
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_03");	//Takže jakmile budeš mít všechny potøebné vìci, pøistup k runovému stolu a vytvoø svou runu.
	};
};


instance DIA_HYGLAS_BLANK_RUNE(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 9;
	condition = dia_hyglas_blank_rune_condition;
	information = dia_hyglas_blank_rune_info;
	permanent = FALSE;
	description = "Kde bych mohl najít runový kámen?";
};


func int dia_hyglas_blank_rune_condition()
{
	if(Npc_KnowsInfo(hero,dia_hyglas_firebolt) && (MIS_RUNE == LOG_RUNNING) && (Npc_HasItems(other,itmi_runeblank) < 1) && (PLAYER_TALENT_RUNES[SPL_FIREBOLT] == FALSE))
	{
		return TRUE;
	};
};

func void dia_hyglas_blank_rune_info()
{
	AI_Output(other,self,"DIA_Hyglas_BLANK_RUNE_15_00");	//Kde bych mohl najít runový kámen?
	AI_Output(self,other,"DIA_Hyglas_BLANK_RUNE_14_01");	//Hele, jsi to ty, kdo požádal o Zkoušku ohnì, ne já. Najít jej je souèástí zkoušky.
};


instance DIA_HYGLAS_GOTRUNE(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_gotrune_condition;
	information = dia_hyglas_gotrune_info;
	permanent = FALSE;
	description = "Vytvoøil jsem tu runu.";
};


func int dia_hyglas_gotrune_condition()
{
	if((Npc_KnowsInfo(hero,dia_ulthar_success) == FALSE) && (Npc_HasItems(hero,itru_firebolt) >= 1) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_hyglas_gotrune_info()
{
	AI_Output(other,self,"DIA_Hyglas_GOTRUNE_15_00");	//Vytvoøil jsem tu runu.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_01");	//Inu dobrá. Zdá se, že v této èásti zkoušky jsi obstál. Konec koncù to nebylo až tak tìžké.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_02");	//Jdi tedy za Utharem a ukaž mu své dílo.
	b_logentry(TOPIC_RUNE,"Vytvoøil jsem runu ohnivého šípu.");
};


instance DIA_HYGLAS_TEACH(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 15;
	condition = dia_hyglas_teach_condition;
	information = dia_hyglas_teach_info;
	permanent = TRUE;
	description = "Uè mì.";
};


func int dia_hyglas_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_hyglas_teach_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Hyglas_TEACH_15_00");	//Uè mì.
	Info_ClearChoices(dia_hyglas_teach);
	Info_AddChoice(dia_hyglas_teach,DIALOG_BACK,dia_hyglas_teach_back);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_INSTANTFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_INSTANTFIREBALL)),dia_hyglas_teach_instantfireball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_FIRESTORM] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_FIRESTORM,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIRESTORM)),dia_hyglas_teach_firestorm);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_CHARGEFIREBALL] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_CHARGEFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_CHARGEFIREBALL)),dia_hyglas_teach_chargefireball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_PYROKINESIS] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_PYROKINESIS,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PYROKINESIS)),dia_hyglas_teach_pyrokinesis);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6) && (PLAYER_TALENT_RUNES[SPL_FIRERAIN] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_FIRERAIN,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIRERAIN)),dia_hyglas_teach_firerain);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		b_say(self,other,"$NOLEARNOVERPERSONALMAX");
		Info_ClearChoices(dia_hyglas_teach);
	};
};

func void dia_hyglas_teach_back()
{
	Info_ClearChoices(dia_hyglas_teach);
};

func void dia_hyglas_teach_instantfireball()
{
	b_teachplayertalentrunes(self,other,SPL_INSTANTFIREBALL);
};

func void dia_hyglas_teach_chargefireball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEFIREBALL);
};

func void dia_hyglas_teach_pyrokinesis()
{
	b_teachplayertalentrunes(self,other,SPL_PYROKINESIS);
};

func void dia_hyglas_teach_firestorm()
{
	b_teachplayertalentrunes(self,other,SPL_FIRESTORM);
};

func void dia_hyglas_teach_firerain()
{
	b_teachplayertalentrunes(self,other,SPL_FIRERAIN);
};


instance DIA_HYGLAS_KAP2_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap2_exit_condition;
	information = dia_hyglas_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_KAP3_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap3_exit_condition;
	information = dia_hyglas_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_BRINGBOOK(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 38;
	condition = dia_hyglas_bringbook_condition;
	information = dia_hyglas_bringbook_info;
	permanent = FALSE;
	description = "Co je nového?";
};


func int dia_hyglas_bringbook_condition()
{
	if((KAPITEL >= 3) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_hyglas_bringbook_info()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_00");	//Co je nového?
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_01");	//Hm, ano. Asi sis už všiml tìch postav s èernými rouchy.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_02");	//Setkal jsem se s nimi.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_03");	//To nás pøivádí k jádru vìci. V tuhle chvíli jsme svìdky velice vzácné hvìzdné konstelace.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_04");	//Abych byl pøesnìjší, znamení Vola je v pøesné korelaci se znamením Váleèníka. Pøedpokládám, že víš, co to znamená.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_05");	//Hmm. No, abych byl upøímný...
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_06");	//Ano, dobrá, chápu. No, nemùžu ti teï vysvìtlovat všechno, ale každopádnì to pøedznamenává velké zmìny. A já nemám zmìny rád.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_07");	//Proto chci, abys mi z mìsta pøinesl jednu knihu. Jmenuje se "Posvátná moc hvìzd". Možná ji budeš muset chvilku hledat, ale jsem si jist, že ji nakonec objevíš.
	Info_ClearChoices(dia_hyglas_bringbook);
	Info_AddChoice(dia_hyglas_bringbook,"Najdi si tu knihu sám.",dia_hyglas_bringbook_getityourself);
	Info_AddChoice(dia_hyglas_bringbook,"Co z toho budu mít?",dia_hyglas_bringbook_getforit);
	Info_AddChoice(dia_hyglas_bringbook,"Uvidím, jestli se mi ji podaøí najít.",dia_hyglas_bringbook_yes);
};

func void dia_hyglas_bringbook_getityourself()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetItYourself_15_00");	//Najdi si tu knihu sám.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_01");	//Jak se opovažuješ se mnou mluvit tímto tónem? Tvoje chování postrádá úctu, kterou mi jsi povinován.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_02");	//Bìž mi z oèí a pøemýšlej o svém chování.
	MIS_HYGLASBRINGBOOK = LOG_OBSOLETE;
	Info_ClearChoices(dia_hyglas_bringbook);
};

func void dia_hyglas_bringbook_getforit()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_00");	//Co z toho budu mít?
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_01");	//Co tím myslíš?
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_02");	//Rád bych vìdìl, co dostanu za to, když ti tu knihu pøinesu.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_03");	//Nic. Co bys myslel, že dostaneš? Pokud máš èas dìlat mi ve mìstì poslíèka, je pøímo tvou povinností mi pomoci.
	Info_ClearChoices(dia_hyglas_bringbook);
};

func void dia_hyglas_bringbook_yes()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_Yes_15_00");	//Uvidím, jestli se mi ji podaøí najít.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_01");	//To je správné - získám tak trochu èasu navíc, abych se mohl poohlédnout také po nìèem jiném.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_02");	//Ale a ti to netrvá moc dlouhou. Obávám se, že nemáme èasu nazbyt.
	MIS_HYGLASBRINGBOOK = LOG_RUNNING;
	Info_ClearChoices(dia_hyglas_bringbook);
	Log_CreateTopic(TOPIC_HYGLASBRINGBOOK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HYGLASBRINGBOOK,LOG_RUNNING);
	b_logentry(TOPIC_HYGLASBRINGBOOK,"Hyglas mì požádal, zda bych mu nenašel knihu 'Božská moc hvìzd'. Zkusím se po ní podívat u mìstských obchodníkù.");
};


instance DIA_HYGLAS_HAVEBOOK(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 38;
	condition = dia_hyglas_havebook_condition;
	information = dia_hyglas_havebook_info;
	permanent = FALSE;
	description = "Mám pro tebe tu knihu.";
};


func int dia_hyglas_havebook_condition()
{
	if(Npc_KnowsInfo(other,dia_hyglas_bringbook) && (Npc_HasItems(other,itwr_astronomy_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_hyglas_havebook_info()
{
	AI_Output(other,self,"DIA_Hyglas_HaveBook_15_00");	//Mám pro tebe tu knihu.
	if(MIS_HYGLASBRINGBOOK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_01");	//Výbornì, dej mi ji.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_02");	//Takže sis to nakonec pøece jen rozmyslel. Velmi dobøe. Tak kde ji máš?
	};
	b_giveinvitems(other,self,itwr_astronomy_mis,1);
	MIS_HYGLASBRINGBOOK = LOG_SUCCESS;
	b_giveplayerxp(XP_HYGLASBRINGBOOK);
	AI_Output(self,other,"DIA_Hyglas_HaveBook_14_03");	//Mùžeš jít. Já pùjdu studovat.
};


instance DIA_HYGLAS_KAP4_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap4_exit_condition;
	information = dia_hyglas_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_KAP4_PERM(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 49;
	condition = dia_hyglas_kap4_perm_condition;
	information = dia_hyglas_kap4_perm_info;
	permanent = TRUE;
	description = "Už jsi na nìco pøišel?";
};


func int dia_hyglas_kap4_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_hyglas_bringbook))
	{
		return TRUE;
	};
};

func void dia_hyglas_kap4_perm_info()
{
	AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_00");	//Už jsi na nìco pøišel?
	if(MIS_HYGLASBRINGBOOK == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_01");	//No, nemohu si být úplnì jistý, ale zdá se, že souèasná konstelace hvìzd poukazuje na mnohá nebezpeèí.
		AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_02");	//Co za nebezpeèí?
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_03");	//Inu, vypadá to, že struktura mezi svìty je velice slabá. K vytvoøení díry do této struktury je teï zapotøebí jen zlomek síly, co obvykle.
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_04");	//Takovéto portály pak mohou používat démoni ke vstupu do našeho svìta, aniž by museli èelit nìjakému odporu.
		HYGLAS_SENDSTOKARRAS = TRUE;
	}
	else if(MIS_HYGLASBRINGBOOK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_05");	//Ne, stále èekám na tu knihu.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_06");	//Øekl jsem ti, že stále provádím výzkum, ale samozøejmì by mi to trvalo mnohem déle, kdybych nemìl potøebný materiál.
	};
};


instance DIA_HYGLAS_KAP5_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap5_exit_condition;
	information = dia_hyglas_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_PICKPOCKET(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 900;
	condition = dia_hyglas_pickpocket_condition;
	information = dia_hyglas_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_hyglas_pickpocket_condition()
{
	return c_beklauen(73,200);
};

func void dia_hyglas_pickpocket_info()
{
	Info_ClearChoices(dia_hyglas_pickpocket);
	Info_AddChoice(dia_hyglas_pickpocket,DIALOG_BACK,dia_hyglas_pickpocket_back);
	Info_AddChoice(dia_hyglas_pickpocket,DIALOG_PICKPOCKET,dia_hyglas_pickpocket_doit);
};

func void dia_hyglas_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hyglas_pickpocket);
};

func void dia_hyglas_pickpocket_back()
{
	Info_ClearChoices(dia_hyglas_pickpocket);
};

