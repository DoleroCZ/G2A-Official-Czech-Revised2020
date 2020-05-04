
instance DIA_JESPER_EXIT(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 999;
	condition = dia_jesper_exit_condition;
	information = dia_jesper_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jesper_exit_condition()
{
	return TRUE;
};

func void dia_jesper_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JESPER_PICKPOCKET(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 900;
	condition = dia_jesper_pickpocket_condition;
	information = dia_jesper_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_jesper_pickpocket_condition()
{
	return c_beklauen(80,180);
};

func void dia_jesper_pickpocket_info()
{
	Info_ClearChoices(dia_jesper_pickpocket);
	Info_AddChoice(dia_jesper_pickpocket,DIALOG_BACK,dia_jesper_pickpocket_back);
	Info_AddChoice(dia_jesper_pickpocket,DIALOG_PICKPOCKET,dia_jesper_pickpocket_doit);
};

func void dia_jesper_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jesper_pickpocket);
};

func void dia_jesper_pickpocket_back()
{
	Info_ClearChoices(dia_jesper_pickpocket);
};


instance DIA_JESPER_HALLO(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 1;
	condition = dia_jesper_hallo_condition;
	information = dia_jesper_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jesper_hallo_condition()
{
	return TRUE;
};

func void dia_jesper_hallo_info()
{
	AI_Output(self,other,"DIA_Jesper_Hallo_09_00");	//Hej, co tam dole dìláš? Tady není nic pro tebe.
	AI_Output(self,other,"DIA_Jesper_Hallo_09_01");	//Tak ven s tím, co tady dìláš?
	Info_ClearChoices(dia_jesper_hallo);
	Info_AddChoice(dia_jesper_hallo,"Pøišel jsem tì zabít.",dia_jesper_hallo_kill);
	Info_AddChoice(dia_jesper_hallo,"Jen jsem se tu chtìl trochu rozhlídnout.",dia_jesper_hallo_nurso);
	if(ATTILA_KEY == TRUE)
	{
		Info_AddChoice(dia_jesper_hallo,"Attila mi dal klíè...",dia_jesper_hallo_willkommen);
	}
	else
	{
		Info_AddChoice(dia_jesper_hallo,"Attilu u jsem oddìlal...",dia_jesper_hallo_umgelegt);
	};
	DG_GEFUNDEN = TRUE;
};

func void dia_jesper_hallo_kill()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Kill_15_00");	//Pøišel jsem tì zabít.
	AI_Output(self,other,"DIA_Jesper_Hallo_Kill_09_01");	//To je ale skvìlı nápad. Na to jsi pøišel úplnì sám, co? No co. Zkrátíme to.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	b_attack(self,other,AR_NONE,1);
};

func void dia_jesper_hallo_nurso()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_NurSo_15_00");	//Jen jsem se tu chtìl trochu rozhlídnout.
	AI_Output(self,other,"DIA_Jesper_Hallo_NurSo_09_01");	//Tady není nic k vidìní. Šlapeš po moc nebezpeènı pùdì, rozumíš?
	AI_Output(self,other,"DIA_Jesper_Hallo_NurSo_09_02");	//Take nech svoji zbraò, kde je, a øekni mi, proè jsi tady.
};

func void dia_jesper_hallo_willkommen()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Willkommen_15_00");	//Attila mi dal klíè. Proto jsem tady. Tak co ode mì chceš?
	AI_Output(self,other,"DIA_Jesper_Hallo_Willkommen_09_01");	//To bys chtìl vìdìt? Klídek.
	AI_Output(self,other,"DIA_Jesper_Hallo_Willkommen_09_02");	//Bì se podívat na Cassiu. Jsi oèekáván.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void dia_jesper_hallo_umgelegt()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Umgelegt_15_00");	//Sejmul jsem Attilu. Mìl u sebe klíè od stok.
	AI_Output(self,other,"DIA_Jesper_Hallo_Umgelegt_09_01");	//(nevìøícnì) TY jsi zabil Attilu?! (opovrlivì) No co, stejnì to byl jen prašivej pes.
	AI_Output(self,other,"DIA_Jesper_Hallo_Umgelegt_09_02");	//Ale nìco ti øeknu. Jestli mì napadneš, zabiju tì.
	Info_ClearChoices(dia_jesper_hallo);
	Info_AddChoice(dia_jesper_hallo,"Co tady dìláš...",dia_jesper_hallo_was);
	Info_AddChoice(dia_jesper_hallo,"Vezmi mì ke svému vùdci.",dia_jesper_hallo_anfuehrer);
};

func void dia_jesper_hallo_was()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Was_15_00");	//Co dìláš v tıhle tmavı vlhkı díøe?
	AI_Output(self,other,"DIA_Jesper_Hallo_Was_09_01");	//(zavrèí) Bydlím tady. Ještì jedna pitomá otázka a nadìlám ti z kùe ozdobnı tøásnièky.
};

func void dia_jesper_hallo_anfuehrer()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Anfuehrer_15_00");	//Vezmi mì ke svému vùdci.
	AI_Output(self,other,"DIA_Jesper_Hallo_Anfuehrer_09_01");	//(oplzlı smích) HA - mùj vùdce? Jsem si jist, e s tebou Cassia bude chtít mluvit.
	AI_Output(self,other,"DIA_Jesper_Hallo_Anfuehrer_09_02");	//Pokraèuj - a ádnı srandièky.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_JESPER_BEZAHLEN(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 1;
	condition = dia_jesper_bezahlen_condition;
	information = dia_jesper_bezahlen_info;
	permanent = TRUE;
	description = "Mùeš mì nìèemu nauèit?";
};


func int dia_jesper_bezahlen_condition()
{
	if((JOIN_THIEFS == TRUE) && (JESPER_TEACHSNEAK == FALSE) && Npc_KnowsInfo(other,dia_cassia_lernen) && (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE))
	{
		return TRUE;
	};
};

func void dia_jesper_bezahlen_info()
{
	AI_Output(other,self,"DIA_Jesper_Bezahlen_15_00");	//Mùeš mì nìèemu nauèit?
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Jesper_Bezahlen_09_01");	//Jasnì, ukáu ti, jak se plíit - pro tebe zadarmo.
		JESPER_TEACHSNEAK = TRUE;
		Info_ClearChoices(dia_jesper_bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_Bezahlen_09_02");	//Chceš se nauèit, jak se pohybovat tak, aby tì nikdo neslyšel? Bude tì to stát 100 zlatıch.
		b_say_gold(self,other,JESPER_COST);
		Info_ClearChoices(dia_jesper_bezahlen);
		Info_AddChoice(dia_jesper_bezahlen,"Moná pozdìji... (ZPÌT)",dia_jesper_bezahlen_spaeter);
		Info_AddChoice(dia_jesper_bezahlen,"Fajn, chci se nauèit plíení (zaplatit 100 zlaákù).",dia_jesper_bezahlen_okay);
	};
};

func void dia_jesper_bezahlen_spaeter()
{
	Info_ClearChoices(dia_jesper_bezahlen);
};

func void dia_jesper_bezahlen_okay()
{
	AI_Output(other,self,"DIA_Jesper_Bezahlen_Okay_15_00");	//Dobrá, chci se nauèit plíit.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(other,self,"DIA_Jesper_Bezahlen_Okay_15_01");	//Tady je zlato.
		AI_Output(self,other,"DIA_Jesper_Bezahlen_Okay_09_02");	//Tak mi øekni, a budeš pøipraven.
		JESPER_TEACHSNEAK = TRUE;
		Info_ClearChoices(dia_jesper_bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_Bezahlen_Okay_09_03");	//Bez zlata se nemùeš nauèit nic.
		Info_ClearChoices(dia_jesper_bezahlen);
	};
};


instance DIA_JESPER_SCHLEICHEN(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 10;
	condition = dia_jesper_schleichen_condition;
	information = dia_jesper_schleichen_info;
	permanent = TRUE;
	description = "Nauè mì umìní plíení.";
};


var int dia_jesper_schleichen_permanent;

func int dia_jesper_schleichen_condition()
{
	if((JESPER_TEACHSNEAK == TRUE) && (DIA_JESPER_SCHLEICHEN_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_jesper_schleichen_info()
{
	AI_Output(other,self,"DIA_Jesper_Schleichen_15_00");	//Nauè mì umìní plíení.
	if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_01");	//Plíení je pro kadého zlodìje nepostradatelné. Pøedevším kdy si potøebuješ prohlédnout dùm nìkoho jiného.
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_02");	//Prostì tam nemùeš dupat jak stádo slonù. Vìtšina lidí má velmi lehkı spánek.
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_03");	//Jedinì kdy se plííš, tak tì nikdo neuslyší - a mùeš nerušenì pracovat.
		DIA_JESPER_SCHLEICHEN_PERMANENT = TRUE;
	};
};


instance DIA_JESPER_KILLER(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 2;
	condition = dia_jesper_killer_condition;
	information = dia_jesper_killer_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jesper_killer_condition()
{
	if(Npc_IsDead(cassia) || Npc_IsDead(ramirez))
	{
		return TRUE;
	};
};

func void dia_jesper_killer_info()
{
	if(Npc_IsDead(cassia) && Npc_IsDead(ramirez))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_00");	//Zabil jsi mé pøátele. Proè jsi to udìlal, ty vrahu?
		AI_Output(self,other,"DIA_Jesper_Killer_09_01");	//Pošlu tì pøímo na návštìvu za Beliarem.
	}
	else if(Npc_IsDead(cassia))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_02");	//Zabil jsi Cassiu, ty špinavej vrahu. Ale na mì si nepøijdeš!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else if(Npc_IsDead(ramirez))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_03");	//Udìlal jsem pro Ramireze víc práce a vydìlal víc penìz, ne ty kdy uvidíš.
		AI_Output(self,other,"DIA_Jesper_Killer_09_04");	//A tys ho jen tak zabil, ty prašivej pse! Je èas vyrovnat úèty!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};


instance DIA_JESPER_BOGEN(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 10;
	condition = dia_jesper_bogen_condition;
	information = dia_jesper_bogen_info;
	permanent = FALSE;
	description = "Hele, co víš o Bosperovì luku?";
};


func int dia_jesper_bogen_condition()
{
	if((Npc_HasItems(other,itrw_bow_l_03_mis) < 1) && (MIS_BOSPER_BOGEN == LOG_RUNNING) && (JOIN_THIEFS == TRUE))
	{
		return TRUE;
	};
};

func void dia_jesper_bogen_info()
{
	AI_Output(other,self,"DIA_Jesper_Bogen_15_00");	//Hele, co víš o Bosperovì luku?
	AI_Output(self,other,"DIA_Jesper_Bogen_09_01");	//Myslíš ten luk od šípaøe? Jo, mám ho nìkde zahrabanej nahoøe v truhle.
	AI_Output(self,other,"DIA_Jesper_Bogen_09_02");	//Ale pobíhá tam kolem spousta krys. Mùeš si pro nìj dojít, jestli ti ty potvory nevadìj.
	AI_Output(self,other,"DIA_Jesper_Bogen_09_03");	//Ó, samozøejmì je ta truhla zamèená. Musíš se do ní vloupat. (chechtá se) S trochou štìstí ti budou tvoje šperháky staèit.
	Wld_InsertNpc(giant_rat,"NW_CITY_KANAL_ROOM_01_01");
	Wld_InsertNpc(giant_rat,"NW_CITY_KANAL_ROOM_01_02");
	Wld_InsertNpc(giant_rat,"NW_CITY_KANAL_ROOM_01_03");
};


instance DIA_JESPER_TUER(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 10;
	condition = dia_jesper_tuer_condition;
	information = dia_jesper_tuer_info;
	permanent = FALSE;
	description = "Co je za tìmi zamèenımi dveømi?";
};


func int dia_jesper_tuer_condition()
{
	if((MIS_CASSIARING == LOG_SUCCESS) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_jesper_tuer_info()
{
	AI_Output(other,self,"DIA_Jesper_Tuer_15_00");	//Co je za tìmi zamèenımi dveømi?
	AI_Output(self,other,"DIA_Jesper_Tuer_09_01");	//(chechtá se) Je za nima ta truhla - truhla mistra zámeèníka.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_02");	//Opatøil ji tak neuvìøitelnì sloitım zámkem, e ji ještì nikdo nedokázal otevøít.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_03");	//Bohuel byl zatèen - hodili ho skrz bariéru, kde asi vypustil duši.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_04");	//Ale jestli se chceš pokusit tu truhlu otevøít, tady je klíè od pokoje.
	b_giveinvitems(self,other,itke_fingers,1);
};


instance DIA_JESPER_TRUHE(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 10;
	condition = dia_jesper_truhe_condition;
	information = dia_jesper_truhe_info;
	permanent = FALSE;
	description = "Podaøilo se mi tu truhlu otevøít.";
};


func int dia_jesper_truhe_condition()
{
	if((Mob_HasItems("MOB_FINGERS",itmi_gold) < 300) || (Mob_HasItems("MOB_FINGERS",itmi_silvercup) < 5) || (Mob_HasItems("MOB_FINGERS",itmi_goldcup) < 1) || (Mob_HasItems("MOB_FINGERS",itam_strg_01) < 1) || (Mob_HasItems("MOB_FINGERS",itpo_perm_dex) < 1))
	{
		return TRUE;
	};
};

func void dia_jesper_truhe_info()
{
	AI_Output(other,self,"DIA_Jesper_Truhe_15_00");	//Podaøilo se mi tu truhlu otevøít.
	AI_Output(self,other,"DIA_Jesper_Truhe_09_01");	//To není moné! Tak se zdá, e máme nového mistra zámeèníka.
	AI_Output(self,other,"DIA_Jesper_Truhe_09_02");	//K takovému vıkonu ti musím pogratulovat.
	b_giveplayerxp(XP_JESPERTRUHE);
};

