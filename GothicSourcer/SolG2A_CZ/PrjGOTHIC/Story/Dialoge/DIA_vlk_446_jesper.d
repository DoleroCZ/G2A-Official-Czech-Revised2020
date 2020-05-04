
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
	AI_Output(self,other,"DIA_Jesper_Hallo_09_00");	//Hej, co tam dole d�l�? Tady nen� nic pro tebe.
	AI_Output(self,other,"DIA_Jesper_Hallo_09_01");	//Tak ven s t�m, co tady d�l�?
	Info_ClearChoices(dia_jesper_hallo);
	Info_AddChoice(dia_jesper_hallo,"P�i�el jsem t� zab�t.",dia_jesper_hallo_kill);
	Info_AddChoice(dia_jesper_hallo,"Jen jsem se tu cht�l trochu rozhl�dnout.",dia_jesper_hallo_nurso);
	if(ATTILA_KEY == TRUE)
	{
		Info_AddChoice(dia_jesper_hallo,"Attila mi dal kl��...",dia_jesper_hallo_willkommen);
	}
	else
	{
		Info_AddChoice(dia_jesper_hallo,"Attilu u� jsem odd�lal...",dia_jesper_hallo_umgelegt);
	};
	DG_GEFUNDEN = TRUE;
};

func void dia_jesper_hallo_kill()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Kill_15_00");	//P�i�el jsem t� zab�t.
	AI_Output(self,other,"DIA_Jesper_Hallo_Kill_09_01");	//To je ale skv�l� n�pad. Na to jsi p�i�el �pln� s�m, co? No co. Zkr�t�me to.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	b_attack(self,other,AR_NONE,1);
};

func void dia_jesper_hallo_nurso()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_NurSo_15_00");	//Jen jsem se tu cht�l trochu rozhl�dnout.
	AI_Output(self,other,"DIA_Jesper_Hallo_NurSo_09_01");	//Tady nen� nic k vid�n�. �lape� po moc nebezpe�n� p�d�, rozum�?
	AI_Output(self,other,"DIA_Jesper_Hallo_NurSo_09_02");	//Tak�e nech svoji zbra�, kde je, a �ekni mi, pro� jsi tady.
};

func void dia_jesper_hallo_willkommen()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Willkommen_15_00");	//Attila mi dal kl��. Proto jsem tady. Tak co ode m� chce�?
	AI_Output(self,other,"DIA_Jesper_Hallo_Willkommen_09_01");	//To bys cht�l v�d�t? Kl�dek.
	AI_Output(self,other,"DIA_Jesper_Hallo_Willkommen_09_02");	//B� se pod�vat na Cassiu. Jsi o�ek�v�n.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void dia_jesper_hallo_umgelegt()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Umgelegt_15_00");	//Sejmul jsem Attilu. M�l u sebe kl�� od stok.
	AI_Output(self,other,"DIA_Jesper_Hallo_Umgelegt_09_01");	//(nev���cn�) TY jsi zabil Attilu?! (opovr�liv�) No co, stejn� to byl jen pra�ivej pes.
	AI_Output(self,other,"DIA_Jesper_Hallo_Umgelegt_09_02");	//Ale n�co ti �eknu. Jestli m� napadne�, zabiju t�.
	Info_ClearChoices(dia_jesper_hallo);
	Info_AddChoice(dia_jesper_hallo,"Co tady d�l�...",dia_jesper_hallo_was);
	Info_AddChoice(dia_jesper_hallo,"Vezmi m� ke sv�mu v�dci.",dia_jesper_hallo_anfuehrer);
};

func void dia_jesper_hallo_was()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Was_15_00");	//Co d�l� v t�hle tmav� vlhk� d��e?
	AI_Output(self,other,"DIA_Jesper_Hallo_Was_09_01");	//(zavr��) Bydl�m tady. Je�t� jedna pitom� ot�zka a nad�l�m ti z k��e ozdobn� t��sni�ky.
};

func void dia_jesper_hallo_anfuehrer()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Anfuehrer_15_00");	//Vezmi m� ke sv�mu v�dci.
	AI_Output(self,other,"DIA_Jesper_Hallo_Anfuehrer_09_01");	//(oplzl� sm�ch) HA - m�j v�dce? Jsem si jist, �e s tebou Cassia bude cht�t mluvit.
	AI_Output(self,other,"DIA_Jesper_Hallo_Anfuehrer_09_02");	//Pokra�uj - a ��dn� srandi�ky.
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
	description = "M��e� m� n��emu nau�it?";
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
	AI_Output(other,self,"DIA_Jesper_Bezahlen_15_00");	//M��e� m� n��emu nau�it?
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Jesper_Bezahlen_09_01");	//Jasn�, uk�u ti, jak se pl�it - pro tebe zadarmo.
		JESPER_TEACHSNEAK = TRUE;
		Info_ClearChoices(dia_jesper_bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_Bezahlen_09_02");	//Chce� se nau�it, jak se pohybovat tak, aby t� nikdo nesly�el? Bude t� to st�t 100 zlat�ch.
		b_say_gold(self,other,JESPER_COST);
		Info_ClearChoices(dia_jesper_bezahlen);
		Info_AddChoice(dia_jesper_bezahlen,"Mo�n� pozd�ji... (ZP�T)",dia_jesper_bezahlen_spaeter);
		Info_AddChoice(dia_jesper_bezahlen,"Fajn, chci se nau�it pl�en� (zaplatit 100 zla��k�).",dia_jesper_bezahlen_okay);
	};
};

func void dia_jesper_bezahlen_spaeter()
{
	Info_ClearChoices(dia_jesper_bezahlen);
};

func void dia_jesper_bezahlen_okay()
{
	AI_Output(other,self,"DIA_Jesper_Bezahlen_Okay_15_00");	//Dobr�, chci se nau�it pl�it.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(other,self,"DIA_Jesper_Bezahlen_Okay_15_01");	//Tady je zlato.
		AI_Output(self,other,"DIA_Jesper_Bezahlen_Okay_09_02");	//Tak mi �ekni, a� bude� p�ipraven.
		JESPER_TEACHSNEAK = TRUE;
		Info_ClearChoices(dia_jesper_bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_Bezahlen_Okay_09_03");	//Bez zlata se nem��e� nau�it nic.
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
	description = "Nau� m� um�n� pl�en�.";
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
	AI_Output(other,self,"DIA_Jesper_Schleichen_15_00");	//Nau� m� um�n� pl�en�.
	if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_01");	//Pl�en� je pro ka�d�ho zlod�je nepostradateln�. P�edev��m kdy� si pot�ebuje� prohl�dnout d�m n�koho jin�ho.
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_02");	//Prost� tam nem��e� dupat jak st�do slon�. V�t�ina lid� m� velmi lehk� sp�nek.
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_03");	//Jedin� kdy� se pl��, tak t� nikdo neusly�� - a m��e� neru�en� pracovat.
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
		AI_Output(self,other,"DIA_Jesper_Killer_09_00");	//Zabil jsi m� p��tele. Pro� jsi to ud�lal, ty vrahu?
		AI_Output(self,other,"DIA_Jesper_Killer_09_01");	//Po�lu t� p��mo na n�v�t�vu za Beliarem.
	}
	else if(Npc_IsDead(cassia))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_02");	//Zabil jsi Cassiu, ty �pinavej vrahu. Ale na m� si nep�ijde�!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else if(Npc_IsDead(ramirez))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_03");	//Ud�lal jsem pro Ramireze v�c pr�ce a vyd�lal v�c pen�z, ne� ty kdy uvid�.
		AI_Output(self,other,"DIA_Jesper_Killer_09_04");	//A tys ho jen tak zabil, ty pra�ivej pse! Je �as vyrovnat ��ty!
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
	description = "Hele, co v� o Bosperov� luku?";
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
	AI_Output(other,self,"DIA_Jesper_Bogen_15_00");	//Hele, co v� o Bosperov� luku?
	AI_Output(self,other,"DIA_Jesper_Bogen_09_01");	//Mysl� ten luk od ��pa�e? Jo, m�m ho n�kde zahrabanej naho�e v truhle.
	AI_Output(self,other,"DIA_Jesper_Bogen_09_02");	//Ale pob�h� tam kolem spousta krys. M��e� si pro n�j doj�t, jestli ti ty potvory nevad�j.
	AI_Output(self,other,"DIA_Jesper_Bogen_09_03");	//�, samoz�ejm� je ta truhla zam�en�. Mus� se do n� vloupat. (checht� se) S trochou �t�st� ti budou tvoje �perh�ky sta�it.
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
	description = "Co je za t�mi zam�en�mi dve�mi?";
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
	AI_Output(other,self,"DIA_Jesper_Tuer_15_00");	//Co je za t�mi zam�en�mi dve�mi?
	AI_Output(self,other,"DIA_Jesper_Tuer_09_01");	//(checht� se) Je za nima ta truhla - truhla mistra z�me�n�ka.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_02");	//Opat�il ji tak neuv��iteln� slo�it�m z�mkem, �e ji je�t� nikdo nedok�zal otev��t.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_03");	//Bohu�el byl zat�en - hodili ho skrz bari�ru, kde asi vypustil du�i.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_04");	//Ale jestli se chce� pokusit tu truhlu otev��t, tady je kl�� od pokoje.
	b_giveinvitems(self,other,itke_fingers,1);
};


instance DIA_JESPER_TRUHE(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 10;
	condition = dia_jesper_truhe_condition;
	information = dia_jesper_truhe_info;
	permanent = FALSE;
	description = "Poda�ilo se mi tu truhlu otev��t.";
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
	AI_Output(other,self,"DIA_Jesper_Truhe_15_00");	//Poda�ilo se mi tu truhlu otev��t.
	AI_Output(self,other,"DIA_Jesper_Truhe_09_01");	//To nen� mo�n�! Tak se zd�, �e m�me nov�ho mistra z�me�n�ka.
	AI_Output(self,other,"DIA_Jesper_Truhe_09_02");	//K takov�mu v�konu ti mus�m pogratulovat.
	b_giveplayerxp(XP_JESPERTRUHE);
};

