
instance DIA_OPOLOS_KAP1_EXIT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 999;
	condition = dia_opolos_kap1_exit_condition;
	information = dia_opolos_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_opolos_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_opolos_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_HELLO(C_INFO)
{
	npc = nov_605_opolos;
	nr = 1;
	condition = dia_opolos_hello_condition;
	information = dia_opolos_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_opolos_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_opolos_hello_info()
{
	AI_Output(self,other,"DIA_Opolos_Hello_12_00");	//Ahoj, ty mus� b�t ten nov� chlap�k.
	AI_Output(self,other,"DIA_Opolos_Hello_12_01");	//Jsem Opolos. Star�m se tady o ovce.
};


instance DIA_OPOLOS_WURST(C_INFO)
{
	npc = nov_605_opolos;
	nr = 2;
	condition = dia_opolos_wurst_condition;
	information = dia_opolos_wurst_info;
	permanent = FALSE;
	description = "M�m tu pro tebe skopovou klob�su.";
};


func int dia_opolos_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_opolos_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Opolos_Wurst_15_00");	//M�m tu pro tebe skopovou klob�su.
	AI_Output(self,other,"DIA_Opolos_Wurst_12_01");	//No �lov��e, to je skv�l�! Kone�n� dal�� v�born� skopov� klob�sa.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_OPOLOS_HOWLONG(C_INFO)
{
	npc = nov_605_opolos;
	nr = 1;
	condition = dia_opolos_howlong_condition;
	information = dia_opolos_howlong_info;
	permanent = FALSE;
	description = "Jak dlouho u� jsi v kl�te�e?";
};


func int dia_opolos_howlong_condition()
{
	if(Npc_KnowsInfo(hero,dia_opolos_hello))
	{
		return TRUE;
	};
};

func void dia_opolos_howlong_info()
{
	AI_Output(other,self,"DIA_Opolos_HowLong_15_00");	//Jak dlouho u� jsi v kl�te�e?
	AI_Output(self,other,"DIA_Opolos_HowLong_12_01");	//Jsem tady t�i roky. Ale zat�m jsem v�bec nestudoval, i kdy� bych r�d.
	AI_Output(other,self,"DIA_Opolos_HowLong_15_02");	//Pro� ne?
	AI_Output(self,other,"DIA_Opolos_HowLong_12_03");	//Moj� prac� je starat se o ovce - ne studovat spisy.
	AI_Output(self,other,"DIA_Opolos_HowLong_12_04");	//Dokud m� mistr Parlan neuvoln� z t�hle slu�by, nem��u studovat v knihovn�.
	MIS_HELPOPOLOS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_OPOLOSSTUDY,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OPOLOSSTUDY,LOG_RUNNING);
	b_logentry(TOPIC_OPOLOSSTUDY,"Opolos hl�d� ovce, ale r�d by si prostudoval i spisky v knihovn�.");
};


instance DIA_OPOLOS_MONASTERY(C_INFO)
{
	npc = nov_605_opolos;
	nr = 3;
	condition = dia_opolos_monastery_condition;
	information = dia_opolos_monastery_info;
	permanent = FALSE;
	description = "Jak se m�m tady v kl�te�e chovat?";
};


func int dia_opolos_monastery_condition()
{
	if(Npc_KnowsInfo(hero,dia_opolos_hello) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_opolos_monastery_info()
{
	AI_Output(other,self,"DIA_Opolos_Monastery_15_00");	//Jak se m�m tady v kl�te�e chovat?
	AI_Output(self,other,"DIA_Opolos_Monastery_12_01");	//Nikdy nel�i m�g�m. Neproh�e� se proti bratrovi ze spole�enstva.
	AI_Output(self,other,"DIA_Opolos_Monastery_12_02");	//Respektuj majetek spole�enstva. Pokud tato pravidla poru��, bude� se zodpov�dat mistru Parlanovi.
	AI_Output(self,other,"DIA_Opolos_Monastery_12_03");	//Krom� toho bych t� m�l varovat, aby ses m�l na pozoru p�ed Agonem. Kdy� nebude� dost opatrn�, skon�� jako Babo.
};


instance DIA_OPOLOS_BEIBRINGEN(C_INFO)
{
	npc = nov_605_opolos;
	nr = 3;
	condition = dia_opolos_beibringen_condition;
	information = dia_opolos_beibringen_info;
	permanent = FALSE;
	description = "Mohl bys m� n�co nau�it?";
};


func int dia_opolos_beibringen_condition()
{
	if(Npc_KnowsInfo(hero,dia_opolos_hello) && ((other.guild == GIL_NOV) || (other.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_opolos_beibringen_info()
{
	AI_Output(other,self,"DIA_Opolos_beibringen_15_00");	//Mohl bys m� n�co nau�it?
	AI_Output(self,other,"DIA_Opolos_beibringen_12_01");	//Jasn�, kdysi jsem b�val docela dobr� rv��. M��u ti uk�zat, jak pos�lit pa�e.
	AI_Output(self,other,"DIA_Opolos_beibringen_12_02");	//Ale j� bych se r�d nau�il n�co o lektvarech, hlavn� o t�ch magick�ch.
	AI_Output(other,self,"DIA_Opolos_beibringen_15_03");	//Jak bych ti s t�m jen mohl pomoci?
	AI_Output(self,other,"DIA_Opolos_beibringen_12_04");	//No, kdybys pracoval pro Neorase, ur�it� by se ti naskytla p��le�itost 'vyp�j�it' si na chv�li jeden z jeho recept�.
	AI_Output(self,other,"DIA_Opolos_beibringen_12_05");	//Kdy� mi ho p�inese�, abych se na n�j mohl pod�vat, n�co t� ur�it� nau��m.
	Log_CreateTopic(TOPIC_OPOLOSREZEPT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OPOLOSREZEPT,LOG_RUNNING);
	b_logentry(TOPIC_OPOLOSREZEPT,"Opolos chce letmo nahl�dnout do receptu na lektvary many. Kdy� budu pracovat pro Neorase, mo�n� bych si mohl n�jak� takov� spisek p�j�it.");
};


instance DIA_OPOLOS_REZEPT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 3;
	condition = dia_opolos_rezept_condition;
	information = dia_opolos_rezept_info;
	permanent = TRUE;
	description = "O tom receptu...";
};


var int dia_opolos_rezept_permanent;

func int dia_opolos_rezept_condition()
{
	if(Npc_KnowsInfo(hero,dia_opolos_beibringen) && (other.guild == GIL_NOV) && (DIA_OPOLOS_REZEPT_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_opolos_rezept_info()
{
	if(Npc_HasItems(other,itwr_manarezept) >= 1)
	{
		AI_Output(other,self,"DIA_Opolos_rezept_15_00");	//M�m ten recept, kter� jsi cht�l.
		AI_Output(self,other,"DIA_Opolos_rezept_12_01");	//Dobr�, p�j� mi ho, a� si ho p�e�tu.
		b_usefakescroll();
		AI_Output(self,other,"DIA_Opolos_rezept_12_02");	//Aha... hm... ano... jo takhle... dobr�, dobr�...
		b_usefakescroll();
		AI_Output(self,other,"DIA_Opolos_rezept_12_03");	//Tak a je to. Pokud chce�, m��u t� n�co nau�it.
		DIA_OPOLOS_REZEPT_PERMANENT = TRUE;
		OPOLOS_TEACHSTR = TRUE;
		OPOLOS_REZEPT = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
		Log_CreateTopic(TOPIC_KLOSTERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_KLOSTERTEACHER,"S Opolovou pomoc� se mohu st�t siln�j��m.");
	}
	else if(MIS_NEORASREZEPT == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Opolos_rezept_15_04");	//U� jsem ten recept vr�til Neorasovi.
		AI_Output(self,other,"DIA_Opolos_rezept_12_05");	//A dopr... Asi se tady nic nenau��m. Ale co. Stejn� ti n�co uk�u.
		OPOLOS_REZEPT = LOG_FAILED;
		DIA_OPOLOS_REZEPT_PERMANENT = TRUE;
		OPOLOS_TEACHSTR = TRUE;
		Log_CreateTopic(TOPIC_KLOSTERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_KLOSTERTEACHER,"S Opolovou pomoc� se mohu st�t siln�j��m.");
	}
	else
	{
		AI_Output(other,self,"DIA_Opolos_rezept_15_06");	//K tomu se dostanu pozd�ji.
	};
};


instance DIA_OPOLOS_TEACH_STR(C_INFO)
{
	npc = nov_605_opolos;
	nr = 99;
	condition = dia_opolos_teach_str_condition;
	information = dia_opolos_teach_str_info;
	permanent = TRUE;
	description = "Cht�l bych se st�t siln�j��m.";
};


func int dia_opolos_teach_str_condition()
{
	if(((hero.guild == GIL_KDF) || (hero.guild == GIL_NOV)) && (OPOLOS_TEACHSTR == TRUE))
	{
		return TRUE;
	};
};

func void dia_opolos_teach_str_info()
{
	AI_Output(other,self,"DIA_Opolos_TEACH_STR_15_00");	//Cht�l bych se st�t siln�j��m.
	Info_ClearChoices(dia_opolos_teach_str);
	Info_AddChoice(dia_opolos_teach_str,DIALOG_BACK,dia_opolos_teach_str_back);
	Info_AddChoice(dia_opolos_teach_str,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_opolos_teach_str_1);
	Info_AddChoice(dia_opolos_teach_str,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_opolos_teach_str_5);
};

func void dia_opolos_teach_str_back()
{
	if(other.attribute[ATR_STRENGTH] >= T_MED)
	{
		AI_Output(self,other,"DIA_Opolos_TEACH_STR_12_00");	//U� te� jsi dost siln�. T�ko bych t� nau�il n�co nov�ho.
	};
	Info_ClearChoices(dia_opolos_teach_str);
};

func void dia_opolos_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(dia_opolos_teach_str);
	Info_AddChoice(dia_opolos_teach_str,DIALOG_BACK,dia_opolos_teach_str_back);
	Info_AddChoice(dia_opolos_teach_str,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_opolos_teach_str_1);
	Info_AddChoice(dia_opolos_teach_str,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_opolos_teach_str_5);
};

func void dia_opolos_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(dia_opolos_teach_str);
	Info_AddChoice(dia_opolos_teach_str,DIALOG_BACK,dia_opolos_teach_str_back);
	Info_AddChoice(dia_opolos_teach_str,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_opolos_teach_str_1);
	Info_AddChoice(dia_opolos_teach_str,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_opolos_teach_str_5);
};


instance DIA_OPOLOS_AGON(C_INFO)
{
	npc = nov_605_opolos;
	nr = 4;
	condition = dia_opolos_agon_condition;
	information = dia_opolos_agon_info;
	permanent = FALSE;
	description = "Kdo jsou Agon a Babo?";
};


func int dia_opolos_agon_condition()
{
	if(Npc_KnowsInfo(other,dia_opolos_monastery) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_opolos_agon_info()
{
	AI_Output(other,self,"DIA_Opolos_Agon_15_00");	//Kdo jsou Agon a Babo?
	AI_Output(self,other,"DIA_Opolos_Agon_12_01");	//Agon se star� o bylinkovou zahradu. Je tak� novic, ale chov� se, jako by byl s�m Vyvolen�.
	AI_Output(self,other,"DIA_Opolos_Agon_12_02");	//Babo p�i�el do kl�tera kr�tce p�ed tebou. Zpo��tku pom�hal Agonovi v zahrad�.
	AI_Output(self,other,"DIA_Opolos_Agon_12_03");	//Ale museli se asi n�jak poprat a od t� doby Babo jen zamet� dv�r.
	AI_Output(other,self,"DIA_Opolos_Agon_15_04");	//V�, co se stalo?
	AI_Output(self,other,"DIA_Opolos_Agon_12_05");	//Ne tak docela p�esn�. Na to se bude� muset zeptat jich. Ale Agonovo slovo m� v�t�� v�hu ne� kohokoliv z novic�, proto�e je synovec m�stodr��c�ho.
};


instance DIA_OPOLOS_LIESEL(C_INFO)
{
	npc = nov_605_opolos;
	nr = 2;
	condition = dia_opolos_liesel_condition;
	information = dia_opolos_liesel_info;
	permanent = TRUE;
	description = "Pod�vej, p�ivedl jsem Betsy. M��u ji nechat u tebe?";
};


func int dia_opolos_liesel_condition()
{
	if((other.guild == GIL_NOV) && (LIESEL_GIVEAWAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_opolos_liesel_info()
{
	AI_Output(other,self,"DIA_Opolos_LIESEL_15_00");	//Pod�vej, p�ivedl jsem Betsy. M��u ji nechat u tebe?
	Npc_PerceiveAll(self);
	if(Wld_DetectNpc(self,follow_sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 800))
	{
		other.aivar[AIV_PARTYMEMBER] = FALSE;
		other.aivar[AIV_TAPOSITION] = TRUE;
		other.wp = "FP_ROAM_MONASTERY_04";
		other.start_aistate = zs_mm_allscheduler;
		LIESEL_GIVEAWAY = TRUE;
		AI_Output(self,hero,"DIA_Opolos_LIESEL_12_01");	//Ano, samoz�ejm�. Hezk� zv���tko. Dob�e se o ni postar�m.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Opolos_Add_15_00");	//Hm... zd� se, �e jsem to �patn� zalo�il. Vr�t�m se pozd�ji.
	};
};


instance DIA_OPOLOS_BIBLOTHEK(C_INFO)
{
	npc = nov_605_opolos;
	nr = 98;
	condition = dia_opolos_biblothek_condition;
	information = dia_opolos_biblothek_info;
	permanent = TRUE;
	description = "Co se t��e knihovny...";
};


func int dia_opolos_biblothek_condition()
{
	if((other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_opolos_howlong))
	{
		return TRUE;
	};
};

func void dia_opolos_biblothek_info()
{
	AI_Output(other,self,"DIA_Opolos_Biblothek_15_00");	//Co se t��e knihovny...
	if(PARLAN_ERLAUBNIS == FALSE)
	{
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_01");	//Je to ta zam�en� m�stnost nalevo, vedle vrat.
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_02");	//Ale kl�� dostane� a� ve chv�li, kdy mistr Parlan dojde k n�zoru, �e m��e� studovat.
	}
	else
	{
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_03");	//Ty m� v�c �t�st� ne� rozumu! M� kl�� ke knihovn�, a p�itom jsi tady jenom takovou chvilku.
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_04");	//Vyu�ij t� p��le�itosti a u� se ze star�ch spis�!
	};
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_HELLOAGAIN(C_INFO)
{
	npc = nov_605_opolos;
	nr = 2;
	condition = dia_opolos_helloagain_condition;
	information = dia_opolos_helloagain_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_opolos_helloagain_condition()
{
	if((other.guild == GIL_KDF) && (MIS_HELPOPOLOS == LOG_SUCCESS) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_opolos_helloagain_info()
{
	AI_Output(self,other,"DIA_Opolos_HelloAgain_12_00");	//Ahoj. D�kuji, �es mi pomohl. Pokus�m se z t�hle �ance vyt�it co nejv�c a nau�it se tolik, co jen p�jde.
	AI_Output(self,other,"DIA_Opolos_HelloAgain_12_01");	//Ale ur�it� nem� �as jen tak kl�bosit s oby�ejn�m novicem, mist�e.
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_HOWISIT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 3;
	condition = dia_opolos_howisit_condition;
	information = dia_opolos_howisit_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_opolos_howisit_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_opolos_howisit_info()
{
	AI_Output(other,self,"DIA_Opolos_HowIsIt_15_00");	//Jak se vede?
	if(MIS_HELPOPOLOS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Opolos_HowIsIt_12_01");	//V�born�. Od chv�le, co mohu studovat, je v�echno vynikaj�c�.
	}
	else
	{
		AI_Output(self,other,"DIA_Opolos_HowIsIt_12_02");	//Poslu�n� pln�m v�echny zadan� �koly, mist�e.
		AI_Output(self,other,"DIA_Opolos_HowIsIt_12_03");	//Ka�d� den p�ede mne Innos klade nov� v�zvy. Budu nad�le pracovat na vlastn�m zdokonalov�n�.
	};
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_KAP2_EXIT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 999;
	condition = dia_opolos_kap2_exit_condition;
	information = dia_opolos_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_opolos_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_opolos_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_KAP3_EXIT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 999;
	condition = dia_opolos_kap3_exit_condition;
	information = dia_opolos_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_opolos_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_opolos_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_KAP3_PERM(C_INFO)
{
	npc = nov_605_opolos;
	nr = 39;
	condition = dia_opolos_kap3_perm_condition;
	information = dia_opolos_kap3_perm_info;
	permanent = TRUE;
	description = "Jak je ove�k�m?";
};


func int dia_opolos_kap3_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_opolos_kap3_perm_info()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_15_00");	//Jak je ove�k�m?
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_12_01");	//Jak by jim asi tak bylo? Stoj� tady a p�e�vykuj� tr�vu.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_12_02");	//Rad�i bych v�d�l, co se d�je venku. Zd� se, �e m�gov� jsou n�jak p�ehnan� nerv�zn�.
	Info_ClearChoices(dia_opolos_kap3_perm);
	Info_AddChoice(dia_opolos_kap3_perm,DIALOG_BACK,dia_opolos_kap3_perm_back);
	Info_AddChoice(dia_opolos_kap3_perm,"V Hornick�m �dol� jsou draci. Spole�n� s arm�dou sk�et� obl�haj� kr�lovsk� jednotky.",dia_opolos_kap3_perm_dragons);
	Info_AddChoice(dia_opolos_kap3_perm,"Po krajin� se potuluj� divn� lid� v �ern�ch r�b�ch.",dia_opolos_kap3_perm_dmt);
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		Info_AddChoice(dia_opolos_kap3_perm,"Pedro n�s zradil.",dia_opolos_kap3_perm_pedro);
	};
};

func void dia_opolos_kap3_perm_back()
{
	Info_ClearChoices(dia_opolos_kap3_perm);
};


var int opolos_dragons;

func void dia_opolos_kap3_perm_dragons()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DRAGONS_15_00");	//V Hornick�m �dol� jsou draci. Spole�n� s arm�dou sk�et� obl�haj� kr�lovsk� jednotky.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DRAGONS_12_01");	//Draci? V�dycky jsem si myslel, �e existuj� jenom ve stra�ideln�ch p��b�z�ch.
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DRAGONS_15_02");	//Jsou tam, v�� mi.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DRAGONS_12_03");	//Ale kr�lov�t� paladini si s nimi snad porad�, ne?
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DRAGONS_15_04");	//Uvid�me.
	if(OPOLOS_DRAGONS == FALSE)
	{
		b_giveplayerxp(XP_AMBIENT);
		OPOLOS_DRAGONS = TRUE;
	};
};


var int opolos_dmt;

func void dia_opolos_kap3_perm_dmt()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DMT_15_00");	//Po krajin� se potuluj� divn� lid� v �ern�ch r�b�ch.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DMT_12_01");	//Jak to mysl�? Jac� divn� lid�?
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DMT_15_02");	//Nikdo nev�, odkud p�i�li. Nos� dlouh� �ern� pl�t� a tv��e maj� zakryt�.
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DMT_15_03");	//Vypad� to na n�jak� druh m�g�. P�inejmen��m jsou schopni provozovat magii.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DMT_12_04");	//To zn� nep��jemn�, ale jsem si jist�, �e Nejvy��� rada tenhle probl�m vy�e��.
	if(OPOLOS_DMT == FALSE)
	{
		b_giveplayerxp(XP_AMBIENT);
		OPOLOS_DMT = TRUE;
	};
};


var int opolos_pedro;

func void dia_opolos_kap3_perm_pedro()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_PEDRO_15_00");	//Pedro n�s zradil.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_PEDRO_12_01");	//Sly�el jsem o tom, ale nev�d�l jsem, �e o tom tak� v�. Proto jsem nic ne��kal.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_PEDRO_12_02");	//Nep��tel je siln�j�� ne� my. Chci ��ct - dok�eme ho porazit?
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_PEDRO_15_03");	//Je�t� nejsme mrtv�.
	if(OPOLOS_PEDRO == FALSE)
	{
		b_giveplayerxp(XP_AMBIENT);
		OPOLOS_PEDRO = TRUE;
	};
};


instance DIA_OPOLOS_KAP4_EXIT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 999;
	condition = dia_opolos_kap4_exit_condition;
	information = dia_opolos_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_opolos_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_opolos_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_KAP5_EXIT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 999;
	condition = dia_opolos_kap5_exit_condition;
	information = dia_opolos_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_opolos_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_opolos_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_PICKPOCKET(C_INFO)
{
	npc = nov_605_opolos;
	nr = 900;
	condition = dia_opolos_pickpocket_condition;
	information = dia_opolos_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_opolos_pickpocket_condition()
{
	return c_beklauen(54,70);
};

func void dia_opolos_pickpocket_info()
{
	Info_ClearChoices(dia_opolos_pickpocket);
	Info_AddChoice(dia_opolos_pickpocket,DIALOG_BACK,dia_opolos_pickpocket_back);
	Info_AddChoice(dia_opolos_pickpocket,DIALOG_PICKPOCKET,dia_opolos_pickpocket_doit);
};

func void dia_opolos_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_opolos_pickpocket);
};

func void dia_opolos_pickpocket_back()
{
	Info_ClearChoices(dia_opolos_pickpocket);
};

