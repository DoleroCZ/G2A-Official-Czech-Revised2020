
instance DIA_PEDRO_EXIT(C_INFO)
{
	npc = nov_600_pedro;
	nr = 999;
	condition = dia_pedro_exit_condition;
	information = dia_pedro_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pedro_exit_condition()
{
	return TRUE;
};

func void dia_pedro_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PEDRO_WELCOME(C_INFO)
{
	npc = nov_600_pedro;
	nr = 1;
	condition = dia_pedro_welcome_condition;
	information = dia_pedro_welcome_info;
	important = TRUE;
};


func int dia_pedro_welcome_condition()
{
	return TRUE;
};

func void dia_pedro_welcome_info()
{
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_00");	//V�tej v Innosovu kl�te�e, cizin�e.
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_01");	//Jsem bratr Pedro, pon�en� slu�ebn�k Innose a str�ce br�ny do svat�ho kl�tera.
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_02");	//Co pot�ebuje�?
};


instance DIA_PEDRO_WURST(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_pedro_wurst_condition;
	information = dia_pedro_wurst_info;
	permanent = FALSE;
	description = "Tady m� klob�su, brat�e.";
};


func int dia_pedro_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_pedro_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Pedro_Wurst_15_00");	//Tady m� klob�su, brat�e.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_01");	//Je od tebe hezk�, �es na m� myslel. Ka�d� na m� v�t�inou zapomene.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_02");	//Mo�n� bys mi mohl d�t je�t� jednu.
	AI_Output(other,self,"DIA_Pedro_Wurst_15_03");	//Na to zapome�, pak bych jich nem�l dost.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_04");	//No co, jedna klob�ska - toho si nikdo nev�imne. N�co za to dostane� - v�m o m�st�, kde rostou ohniv� kop�ivy.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_05");	//Kdy� je donese� Neorasovi, ur�it� ti d� kl�� od knihovny. Co na to ��k�?
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
	Info_ClearChoices(dia_pedro_wurst);
	Info_AddChoice(dia_pedro_wurst,"Fajn, tady m� dal�� klob�su.",dia_pedro_wurst_ja);
	Info_AddChoice(dia_pedro_wurst,"Ne, na to zapome�.",dia_pedro_wurst_nein);
};

func void dia_pedro_wurst_ja()
{
	AI_Output(other,self,"DIA_Pedro_Wurst_JA_15_00");	//Fajn, tady m� dal�� klob�su.
	AI_Output(self,other,"DIA_Pedro_Wurst_JA_09_01");	//Tak. N�kolik ohniv�ch kop�iv roste nalevo a napravo od m�stku na druh�m b�ehu.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	Info_ClearChoices(dia_pedro_wurst);
};

func void dia_pedro_wurst_nein()
{
	AI_Output(other,self,"DIA_Pedro_Wurst_NEIN_15_00");	//Ne, na to zapome�.
	AI_Output(self,other,"DIA_Pedro_Wurst_NEIN_09_01");	//Chce� dob�e vych�zet s Goraxem, co? S nov�mi novici to je v�dycky stejn�.
	Info_ClearChoices(dia_pedro_wurst);
};


instance DIA_PEDRO_EINLASS(C_INFO)
{
	npc = nov_600_pedro;
	condition = dia_pedro_einlass_condition;
	information = dia_pedro_einlass_info;
	permanent = FALSE;
	description = "Chci vstoupit do kl�tera.";
};


func int dia_pedro_einlass_condition()
{
	if(Npc_KnowsInfo(hero,dia_pedro_welcome))
	{
		return TRUE;
	};
};

func void dia_pedro_einlass_info()
{
	AI_Output(other,self,"DIA_Pedro_EINLASS_15_00");	//Chci vstoupit do kl�tera.
	AI_Output(self,other,"DIA_Pedro_EINLASS_09_01");	//Do kl�tera mohou vstoupit jen slu�ebn�ci Innosovi.
	AI_Output(self,other,"DIA_Pedro_EINLASS_09_02");	//Jestli se chce� pomodlit k Innosovi, m��e� si naj�t n�jakou svatyni u cesty. Na modlitby tam je dostate�n� klid.
};


instance DIA_PEDRO_TEMPEL(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_pedro_tempel_condition;
	information = dia_pedro_tempel_info;
	permanent = FALSE;
	description = "Co mus�m ud�lat, aby m� p�ijali do kl�tera?";
};


func int dia_pedro_tempel_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_einlass) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pedro_tempel_info()
{
	AI_Output(other,self,"DIA_Pedro_TEMPEL_15_00");	//Co mus�m ud�lat, aby m� p�ijali do kl�tera?
	if(other.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_01");	//P��stup do kl�tera ti je zapov�zen - svou cestu sis ji� zvolil.
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_02");	//Pokud chce� vstoupit do Bratrstva Innosova, mus� se nau�it a dodr�ovat pravidla kl�tera.
		AI_Output(self,other,"DIA_ADDON_Pedro_TEMPEL_09_03");	//Nav�c ��dame po ka�d�m nov�m novici d�rek Innosovi.
		AI_Output(self,other,"DIA_ADDON_Pedro_TEMPEL_09_04");	//Ovci a 1000 zla��k�.
		AI_Output(other,self,"DIA_Pedro_TEMPEL_15_04");	//To je spousta zlata.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_05");	//Je to na znamen� toho, �e za��n� nov� �ivot jako Innos�v slu�ebn�k. Kdy� t� kl�ter p�ijme, budou ti v�echny tvoje p�edchoz� h��chy odpu�t�ny.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_06");	//Ale rozmysli si to - jakmile se jednou stane� Innosov�m slu�ebn�kem, nem��e� to vz�t zp�t.
		SC_KNOWSKLOSTERTRIBUT = TRUE;
		Log_CreateTopic(TOPIC_KLOSTER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_KLOSTER,LOG_RUNNING);
		b_logentry(TOPIC_KLOSTER,"Chci-li se st�t novicem v Innosov� kl�te�e, pot�ebuji ovci a velkou ��stku pen�z.");
	};
};


instance DIA_ADDON_PEDRO_STATUETTE(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_addon_pedro_statuette_condition;
	information = dia_addon_pedro_statuette_info;
	permanent = FALSE;
	description = "M�m tady tuhle so�ku...";
};


func int dia_addon_pedro_statuette_condition()
{
	if(Npc_HasItems(other,itmi_lostinnosstatue_daron) && (MIS_ADDON_DARON_GETSTATUE == LOG_RUNNING) && Npc_KnowsInfo(other,dia_pedro_rules) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_addon_pedro_statuette_info()
{
	AI_Output(other,self,"DIA_Addon_Pedro_Statuette_15_00");	//M�m tady tuhle so�ku. M�m dojem, �e ji postr�daj� v kl�te�e.
	AI_Output(other,self,"DIA_Addon_Pedro_Statuette_15_01");	//M��u te� proj�t?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Addon_Pedro_Statuette_09_02");	//Tak�e, za tohoto stavu v�c� u� ti nic nebr�n� st�t se novicem.
		Log_CreateTopic(TOPIC_ADDON_RANGERHELPKDF,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPKDF,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_RANGERHELPKDF,"Novic Pedro m� pustil do kl�tera, proto�e jsem m�l tu chyb�j�c� so�ku. M�l bych ji doru�it n�komu v kl�te�e.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Pedro_Statuette_09_03");	//Boj�m se ale, �e dokonce i s t�mto vz�cn�m skvostem t� nem��u p�ijmout.
		AI_Output(self,other,"DIA_Addon_Pedro_Statuette_09_04");	//U� jsi se rozhodl pro jinou cestu. Cesta do kl�tera pro tebe z�st�v� uzav�ena.
	};
};


instance DIA_ADDON_PEDRO_STATUETTE_ABGEBEN(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_addon_pedro_statuette_abgeben_condition;
	information = dia_addon_pedro_statuette_abgeben_info;
	permanent = FALSE;
	description = "M��u ti tu so�ku tady nechat?";
};


func int dia_addon_pedro_statuette_abgeben_condition()
{
	if(Npc_HasItems(other,itmi_lostinnosstatue_daron) && Npc_KnowsInfo(other,dia_addon_pedro_statuette) && (hero.guild != GIL_NONE) && (hero.guild != GIL_NOV) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_addon_pedro_statuette_abgeben_info()
{
	AI_Output(other,self,"DIA_Addon_Pedro_Statuette_Abgeben_15_00");	//M��u ti tu so�ku tady nechat?
	AI_Output(self,other,"DIA_Addon_Pedro_Statuette_Abgeben_09_01");	//Samoz�ejm�, okam�it� se o ni postar�m. D�ky za tv�j nesobeck� skutek.
	MIS_ADDON_DARON_GETSTATUE = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_REPORTLOSTINNOSSTATUE2DARON);
};


instance DIA_PEDRO_RULES(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_pedro_rules_condition;
	information = dia_pedro_rules_info;
	permanent = FALSE;
	description = "Podle jak�ch pravidel �ijete?";
};


func int dia_pedro_rules_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_tempel))
	{
		return TRUE;
	};
};

func void dia_pedro_rules_info()
{
	AI_Output(other,self,"DIA_Pedro_Rules_15_00");	//Podle jak�ch pravidel �ijete?
	AI_Output(self,other,"DIA_Pedro_Rules_09_01");	//Innos je b�h pravdy a ��du, tak�e NIKDY nesm� zalhat nebo sp�chat n�jak� zlo�in.
	AI_Output(self,other,"DIA_Pedro_Rules_09_02");	//Pokud se proh�e�� proti sv�mu bratru nebo ukradne� n�co z na�ich v�c�, zaplat� za to.
	AI_Output(self,other,"DIA_Pedro_Rules_09_03");	//Innos je tak� b�h vl�dy a ohn�.
	AI_Output(self,other,"DIA_Pedro_Rules_09_04");	//Jako�to novic mus� prokazovat POSLU�NOST a �CTU v�em ohniv�m m�g�m.
	AI_Output(other,self,"DIA_Pedro_Rules_15_05");	//Aha.
	AI_Output(self,other,"DIA_Pedro_Rules_09_06");	//D�le je POVINNOST� novice vykon�vat v kl�te�e v�echny pr�ce pro dobro na�eho spole�enstv�.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_Rules_09_07");	//Pokud jsi p�ipraven se t�mito pravidly ��dit a m� dar pro Innose, r�di t� p�ijmeme do kl�tera jako novice.
	};
};


instance DIA_PEDRO_AUFNAHME(C_INFO)
{
	npc = nov_600_pedro;
	condition = dia_pedro_aufnahme_condition;
	information = dia_pedro_aufnahme_info;
	permanent = TRUE;
	description = "Chci se st�t novicem.";
};


var int dia_pedro_aufnahme_noperm;

func int dia_pedro_aufnahme_condition()
{
	if(Npc_KnowsInfo(hero,dia_pedro_rules) && (DIA_PEDRO_AUFNAHME_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void b_dia_pedro_aufnahme_choice()
{
	Info_ClearChoices(dia_pedro_aufnahme);
	Info_AddChoice(dia_pedro_aufnahme,"Je�t� si to nech�m proj�t hlavou.",dia_pedro_aufnahme_no);
	Info_AddChoice(dia_pedro_aufnahme,"Ano, chci zasv�tit sv�j �ivot slu�b� Innosovi.",dia_pedro_aufnahme_yes);
};

func void dia_pedro_aufnahme_info()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_15_00");	//Chci se st�t novicem.
	Npc_PerceiveAll(self);
	if(hero.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_AUFNAHME_09_01");	//Svou cestu sis ji� zvolil. Cesta magie ti je uzav�ena.
		DIA_PEDRO_AUFNAHME_NOPERM = TRUE;
	}
	else if(Npc_KnowsInfo(other,dia_addon_pedro_statuette))
	{
		AI_Output(self,other,"DIA_Addon_Pedro_AUFNAHME_09_02");	//Je to opravdu tvoje p��n�? Uv�dom si ale jednu v�c. V�echny ostatn� cesty pro tebe z�stanou nav�dy uzav�eny.
		b_dia_pedro_aufnahme_choice();
	}
	else if((hero.guild == GIL_NONE) && (Npc_HasItems(hero,itmi_gold) >= SUMME_KLOSTER) && Wld_DetectNpc(self,follow_sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 1000))
	{
		AI_Output(self,hero,"DIA_Pedro_AUFNAHME_09_03");	//Vid�m, �es p�inesl po�adovan� dar. Pokud opravdu chce�, m��e� se st�t novicem.
		AI_Output(self,hero,"DIA_Pedro_AUFNAHME_09_04");	//Ale pokud se tak rozhodne�, u� nen� cesty zp�t - zva� dob�e, zda je toto cesta, po n� tou��!
		b_dia_pedro_aufnahme_choice();
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_AUFNAHME_09_02");	//Nep�inesl jsi po�adovan� dar.
	};
};

func void dia_pedro_aufnahme_yes()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_YES_15_00");	//Ano, chci zasv�tit sv�j �ivot slu�b� Innosovi.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_01");	//V tom p��pad� v�tej, brat�e. D�m ti kl�� ke kl�tern� br�n�.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_02");	//Na d�kaz sv� svobodn� v�le s�m otev�i br�nu a projdi dovnit�.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_03");	//Nyn� jsi novic. Nos tento �at na znamen�, �e jsi te� �lenem bratrstva.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_04");	//A� bude� v kl�te�e, jdi za Parlanem. Od nyn�j�ka se bude starat o to, abys m�l, co pot�ebuje�.
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_YES_15_05");	//Budou te� m� proh�e�ky odpu�t�ny?
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_06");	//Je�t� ne. Promluv si s mistrem Parlanem. Po�ehn� ti a o�ist� t� od h��ch�.
	CreateInvItems(self,itke_innos_mis,1);
	b_giveinvitems(self,hero,itke_innos_mis,1);
	CreateInvItems(other,itar_nov_l,1);
	AI_EquipArmor(other,itar_nov_l);
	other.guild = GIL_NOV;
	Npc_SetTrueGuild(other,GIL_NOV);
	DIA_PEDRO_AUFNAHME_NOPERM = TRUE;
	NOV_AUFNAHME = TRUE;
	b_giveplayerxp(XP_AUFNAHMENOVIZE);
	if(Npc_KnowsInfo(other,dia_addon_pedro_statuette))
	{
		PEDRO_NOV_AUFNAHME_LOSTINNOSSTATUE_DARON = TRUE;
		LIESEL_GIVEAWAY = LOG_OBSOLETE;
	};
	Wld_AssignRoomToGuild("Kloster02",GIL_KDF);
	AI_StopProcessInfos(self);
};

func void dia_pedro_aufnahme_no()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_NO_15_00");	//Je�t� si to nech�m proj�t hlavou.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_NO_09_01");	//Vra� se, a� bude� p�ipraven.
	Info_ClearChoices(dia_pedro_aufnahme);
};


instance DIA_PEDRO_MONASTERY(C_INFO)
{
	npc = nov_600_pedro;
	nr = 90;
	condition = dia_pedro_monastery_condition;
	information = dia_pedro_monastery_info;
	permanent = TRUE;
	description = "Pov�z mi o �ivot� v kl�te�e.";
};


func int dia_pedro_monastery_condition()
{
	return TRUE;
};

func void dia_pedro_monastery_info()
{
	AI_Output(other,self,"DIA_Pedro_Monastery_15_00");	//Pov�z mi o �ivot� v kl�te�e.
	AI_Output(self,other,"DIA_Pedro_Monastery_09_01");	//�ijeme v kl�te�e, abychom slou�ili Innosovi. My novicov� vykon�v�me v�echny pr�ce a kdykoliv m��eme, studujeme posv�tn� knihy.
	AI_Output(self,other,"DIA_Pedro_Monastery_09_02");	//Na n�s dohl�ej� m�gov� a ti zase zkoumaj� um�n� magie.
};


instance DIA_PEDRO_PICKPOCKET(C_INFO)
{
	npc = nov_600_pedro;
	nr = 900;
	condition = dia_pedro_pickpocket_condition;
	information = dia_pedro_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_pedro_pickpocket_condition()
{
	return c_beklauen(45,60);
};

func void dia_pedro_pickpocket_info()
{
	Info_ClearChoices(dia_pedro_pickpocket);
	Info_AddChoice(dia_pedro_pickpocket,DIALOG_BACK,dia_pedro_pickpocket_back);
	Info_AddChoice(dia_pedro_pickpocket,DIALOG_PICKPOCKET,dia_pedro_pickpocket_doit);
};

func void dia_pedro_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_pedro_pickpocket);
};

func void dia_pedro_pickpocket_back()
{
	Info_ClearChoices(dia_pedro_pickpocket);
};

