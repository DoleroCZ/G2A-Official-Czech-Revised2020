
instance DIA_MALAK_EXIT(C_INFO)
{
	npc = bau_963_malak;
	nr = 999;
	condition = dia_malak_exit_condition;
	information = dia_malak_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_malak_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_malak_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALAK_HALLO(C_INFO)
{
	npc = bau_963_malak;
	nr = 3;
	condition = dia_malak_hallo_condition;
	information = dia_malak_hallo_info;
	description = "Je v�echno v po��dku?";
};


func int dia_malak_hallo_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_malak_hallo_info()
{
	AI_Output(other,self,"DIA_Malak_HALLO_15_00");	//Je v�echno v po��dku?
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Malak_HALLO_08_01");	//Dal�� n�den�k, co nev�, kam by se vrtnul? ��dn� probl�m. Promluv si s Bengarem, na��m farm��em.
	}
	else
	{
		AI_Output(self,other,"DIA_Malak_HALLO_08_02");	//Jasn�.
	};
};


instance DIA_MALAK_WASMACHSTDU(C_INFO)
{
	npc = bau_963_malak;
	nr = 4;
	condition = dia_malak_wasmachstdu_condition;
	information = dia_malak_wasmachstdu_info;
	description = "Co tady d�l�?";
};


func int dia_malak_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_malak_hallo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_malak_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Malak_WASMACHSTDU_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Malak_WASMACHSTDU_08_01");	//Jsem ov��k. Nen� to zrovna n�ro�n� pr�ce.
	AI_Output(self,other,"DIA_Malak_WASMACHSTDU_08_02");	//Ale te� si mus� d�vat po��dn� pozor. Zvl᚝, kdy� se dostane� bl�zko k pr�smyku.
};


instance DIA_MALAK_PASS(C_INFO)
{
	npc = bau_963_malak;
	nr = 5;
	condition = dia_malak_pass_condition;
	information = dia_malak_pass_info;
	description = "Co v� o tom pr�smyku?";
};


func int dia_malak_pass_condition()
{
	if(Npc_KnowsInfo(other,dia_malak_wasmachstdu) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_malak_pass_info()
{
	AI_Output(other,self,"DIA_Malak_PASS_15_00");	//Co v� o tom pr�smyku?
	AI_Output(self,other,"DIA_Malak_PASS_08_01");	//Nic moc. Jen to, �e vede do Hornick�ho �dol�, co je�t� p�ed p�r t�dny uzav�rala magick� bari�ra.
	AI_Output(self,other,"DIA_Malak_PASS_08_02");	//Ale jinak jedin� v�c, na kterou si my farm��i mus�me d�vat pozor, jsou karavany, co ka�d� m�s�c voz� do Hornick�ho �dol� v�echno mo�n�.
	AI_Output(self,other,"DIA_Malak_PASS_08_03");	//Ti hrdlo�ezov� n�m dok�ou po��dn� znep��jemnit �ivot.
};


instance DIA_MALAK_WOPASS(C_INFO)
{
	npc = bau_963_malak;
	nr = 6;
	condition = dia_malak_wopass_condition;
	information = dia_malak_wopass_info;
	description = "Kde najdu pr�smyk do Hornick�ho �dol�?";
};


func int dia_malak_wopass_condition()
{
	if(Npc_KnowsInfo(other,dia_malak_hallo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_malak_wopass_info()
{
	AI_Output(other,self,"DIA_Malak_WOPASS_15_00");	//Kde najdu pr�smyk do Hornick�ho �dol�?
	AI_Output(self,other,"DIA_Malak_WOPASS_08_01");	//Pobl� vodop�d� na druh� stran� n�horn�ch pastvin.
};


instance DIA_MALAK_MINENTAL(C_INFO)
{
	npc = bau_963_malak;
	nr = 7;
	condition = dia_malak_minental_condition;
	information = dia_malak_minental_info;
	description = "Co se pov�d� o Hornick�m �dol�?";
};


func int dia_malak_minental_condition()
{
	if(Npc_KnowsInfo(other,dia_malak_pass) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_malak_minental_info()
{
	AI_Output(other,self,"DIA_Malak_MINENTAL_15_00");	//Co se pov�d� o Hornick�m �dol�?
	AI_Output(self,other,"DIA_Malak_MINENTAL_08_01");	//V�echno mo�n�. N�kte�� z chlap� sly�eli v noci k�ik, n�kte�� vid�li podivn� sv�tla nad horami.
	AI_Output(self,other,"DIA_Malak_MINENTAL_08_02");	//Ale jestli to chce� v�d�t, tak to v�echno jsou jen babsk� pov�da�ky.
};


instance DIA_MALAK_WARSTDUSCHONDA(C_INFO)
{
	npc = bau_963_malak;
	nr = 8;
	condition = dia_malak_warstduschonda_condition;
	information = dia_malak_warstduschonda_info;
	description = "U� jsi n�kdy byl v Hornick�m �dol�?";
};


func int dia_malak_warstduschonda_condition()
{
	if(Npc_KnowsInfo(other,dia_malak_pass) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_malak_warstduschonda_info()
{
	AI_Output(other,self,"DIA_Malak_WARSTDUSCHONDA_15_00");	//U� jsi n�kdy byl v Hornick�m �dol�?
	AI_Output(self,other,"DIA_Malak_WARSTDUSCHONDA_08_01");	//Ne. Ale jednou za �as se k n�mu dostanu. To v�dycky vid�m ty dva paladiny, co stoj� u br�ny a dr�� str�.
	AI_Output(self,other,"DIA_Malak_WARSTDUSCHONDA_08_02");	//Vypad� to, jako by se uji��ovali, �e se z �dol� nic nedostane ven.
	AI_Output(self,other,"DIA_Malak_WARSTDUSCHONDA_08_03");	//Ale jinak je Hornick� �dol� vlastn� takov� p�irozen� v�zen�. Jakmile tam jedou vejde�, ven u� se nedostane�.
};


instance DIA_MALAK_PALADINE(C_INFO)
{
	npc = bau_963_malak;
	nr = 9;
	condition = dia_malak_paladine_condition;
	information = dia_malak_paladine_info;
	description = "R�d bych se dozv�d�l n�co o paladinech.";
};


func int dia_malak_paladine_condition()
{
	if(Npc_KnowsInfo(other,dia_malak_warstduschonda) && Npc_KnowsInfo(other,dia_malak_minental) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_malak_paladine_info()
{
	AI_Output(other,self,"DIA_Malak_PALADINE_15_00");	//�ekni mi v�c o t�ch paladinech. Jak dlouho u� tam jsou?
	AI_Output(self,other,"DIA_Malak_PALADINE_08_01");	//T�den, dva. Mysl�m. P�esn� to nev�m.
	AI_Output(self,other,"DIA_Malak_PALADINE_08_02");	//Ned�vno se jich tu potloukala cel� skupina a pak zmizeli v pr�smyku. Od t� doby u� jsem je nevid�l.
};


instance DIA_MALAK_KEINEFRAUEN(C_INFO)
{
	npc = bau_963_malak;
	nr = 10;
	condition = dia_malak_keinefrauen_condition;
	information = dia_malak_keinefrauen_info;
	description = "Nevid�l jsem tady ��dnou �enu.";
};


func int dia_malak_keinefrauen_condition()
{
	if(Npc_KnowsInfo(other,dia_malak_wasmachstdu) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_malak_keinefrauen_info()
{
	AI_Output(other,self,"DIA_Malak_KEINEFRAUEN_15_00");	//Nevid�l jsem tady ��dnou �enu.
	AI_Output(self,other,"DIA_Malak_KEINEFRAUEN_08_01");	//Tak to m� pravdu. Tohle je farma pro chlapy, abych tak �ekl. Hodn� pr�ce, �ekl bych.
};


instance DIA_MALAK_PERMKAP1(C_INFO)
{
	npc = bau_963_malak;
	nr = 11;
	condition = dia_malak_permkap1_condition;
	information = dia_malak_permkap1_info;
	permanent = TRUE;
	description = "S tou prac� to nep�eh�n�j.";
};


func int dia_malak_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_malak_hallo) && Npc_KnowsInfo(other,dia_malak_wasmachstdu) && Npc_KnowsInfo(other,dia_malak_pass) && Npc_KnowsInfo(other,dia_malak_minental) && Npc_KnowsInfo(other,dia_malak_warstduschonda) && Npc_KnowsInfo(other,dia_malak_paladine) && Npc_KnowsInfo(other,dia_malak_keinefrauen) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_malak_permkap1_info()
{
	AI_Output(other,self,"DIA_Malak_PERMKAP1_15_00");	//S tou prac� to nep�eh�n�j.
	AI_Output(self,other,"DIA_Malak_PERMKAP1_08_01");	//Pokus�m se.
	AI_StopProcessInfos(self);
};


instance DIA_MALAK_KAP3_EXIT(C_INFO)
{
	npc = bau_963_malak;
	nr = 999;
	condition = dia_malak_kap3_exit_condition;
	information = dia_malak_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_malak_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_malak_kap3_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_MALAK_FLEEFROMPASS(C_INFO)
{
	npc = bau_963_malak;
	nr = 30;
	condition = dia_malak_fleefrompass_condition;
	information = dia_malak_fleefrompass_info;
	description = "Co tady d�l�?";
};


func int dia_malak_fleefrompass_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_malak_fleefrompass_info()
{
	if((NPCOBSESSEDBYDMT_MALAK == FALSE) && (hero.guild == GIL_KDF))
	{
		b_npcobsessedbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Malak_FLEEFROMPASS_15_00");	//Co tady d�l�?
		AI_Output(self,other,"DIA_Malak_FLEEFROMPASS_08_01");	//Utekl jsem sem z Bengarovy farmy. Necht�lo se mi �ekat, a� m� rozs�pe n�kter� z t�ch nestv�r, co p�ich�zej� z pr�smyku.
		AI_Output(self,other,"DIA_Malak_FLEEFROMPASS_08_02");	//Nedok�e� si p�edstavit, co se za posledn�ch n�kolik dn� odtamtud v�echno vyvalilo.
		AI_Output(other,self,"DIA_Malak_FLEEFROMPASS_15_03");	//Ale dok�u.
		b_logentry(TOPIC_BENGARALLEIN,"Malak se usadil na jihu, nebo� se boj� nestv�r, kter� nahoru na pastviny p�ich�zej� z pr�smyku.");
		b_giveplayerxp(XP_FOUNDMALAKFLEEFROMPASS);
	};
};


instance DIA_MALAK_HEILUNG(C_INFO)
{
	npc = bau_963_malak;
	nr = 55;
	condition = dia_malak_heilung_condition;
	information = dia_malak_heilung_info;
	permanent = TRUE;
	description = "Pot�ebuje� pomoct.";
};


func int dia_malak_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_MALAK == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};


var int dia_malak_heilung_onetime;

func void dia_malak_heilung_info()
{
	AI_Output(other,self,"DIA_Malak_Heilung_15_00");	//Pot�ebuje� pomoct.
	if(DIA_MALAK_HEILUNG_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Malak_Heilung_08_01");	//(pla�tiv�) Jen bych cht�l j�t dom�. Vr�t�m se k Bengarovi. Douf�m, �e je je�t� na�ivu.
		b_npcclearobsessionbydmt(self);
		Npc_ExchangeRoutine(self,"Start");
		b_startotherroutine(bau_962_bauer,"Start");
		b_startotherroutine(bau_964_bauer,"Start");
		b_startotherroutine(bau_965_bauer,"Start");
		b_startotherroutine(bau_966_bauer,"Start");
		b_startotherroutine(bau_967_bauer,"Start");
		b_startotherroutine(bau_968_bauer,"Start");
		b_startotherroutine(bau_969_bauer,"Start");
		DIA_MALAK_HEILUNG_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Malak_Heilung_08_02");	//Nech m� na pokoji, m�gu. Porad�m si s�m.
		b_npcclearobsessionbydmt(self);
	};
};


instance DIA_MALAK_PERMCASTLE(C_INFO)
{
	npc = bau_963_malak;
	nr = 31;
	condition = dia_malak_permcastle_condition;
	information = dia_malak_permcastle_info;
	permanent = TRUE;
	description = "A co tady?";
};


func int dia_malak_permcastle_condition()
{
	if((Npc_GetDistToWP(self,"CASTLEMINE") < 4000) && (MIS_GETMALAKBACK != LOG_SUCCESS) && Npc_KnowsInfo(other,dia_malak_fleefrompass) && (NPCOBSESSEDBYDMT_MALAK == FALSE) && (hero.guild != GIL_KDF) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_malak_permcastle_info()
{
	AI_Output(other,self,"DIA_Malak_PERMCASTLE_15_00");	//A co tady?
	AI_Output(self,other,"DIA_Malak_PERMCASTLE_08_01");	//Tady m�m jen pot�e s bandity. Po��d lep�� ne� ty zr�dy.
};


instance DIA_MALAK_BACKTOBENGAR(C_INFO)
{
	npc = bau_963_malak;
	nr = 31;
	condition = dia_malak_backtobengar_condition;
	information = dia_malak_backtobengar_info;
	permanent = TRUE;
	description = "Bengar t� pot�ebuje.";
};


func int dia_malak_backtobengar_condition()
{
	if((MIS_GETMALAKBACK == LOG_RUNNING) && Npc_KnowsInfo(other,dia_malak_fleefrompass) && (Npc_IsDead(bengar) == FALSE) && (NPCOBSESSEDBYDMT_MALAK == FALSE) && (hero.guild != GIL_KDF) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_malak_backtobengar_info()
{
	AI_Output(other,self,"DIA_Malak_BACKTOBENGAR_15_00");	//Bengar t� pot�ebuje. Chce, aby ses vr�til na farmu.
	AI_Output(self,other,"DIA_Malak_BACKTOBENGAR_08_01");	//Nejsem bl�zen. Dokud nebude farma dob�e zabezpe�ena, nehodl�m odsud vystr�it nos!
	b_logentry(TOPIC_BENGARALLEIN,"Malak se nem�n� vr�tit na Bengar�v statek, dokud z�st�v� nechr�n�n�.");
	if(MIS_BENGARSHELPINGSLD == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Malak_BACKTOBENGAR_15_02");	//Najal jsem �old�ka. D�v� na farmu pozor.
		AI_Output(self,other,"DIA_Malak_BACKTOBENGAR_08_03");	//Tak to je samoz�ejm� jin�. Ale po�kat. Kdo toho chlap�ka plat�, he?
		AI_Output(other,self,"DIA_Malak_BACKTOBENGAR_15_04");	//To je m�j probl�m.
		AI_Output(self,other,"DIA_Malak_BACKTOBENGAR_08_05");	//(zv�dav�) Mmh. Asi neni �ance, �e bys mi to �ekl, co?
		Info_AddChoice(dia_malak_backtobengar,"Ne",dia_malak_backtobengar_los);
	};
};

func void dia_malak_backtobengar_los()
{
	AI_Output(other,self,"DIA_Malak_BACKTOBENGAR_los_15_00");	//Ne.
	AI_Output(self,other,"DIA_Malak_BACKTOBENGAR_los_08_01");	//Fajn. Tak se vr�t�m. Douf�m, �e ten chlap k n��emu bude.
	MIS_GETMALAKBACK = LOG_SUCCESS;
	b_giveplayerxp(XP_MALAK_BACKTOBENGAR);
	b_npcclearobsessionbydmt(self);
	Npc_ExchangeRoutine(self,"Start");
	b_startotherroutine(bau_962_bauer,"Start");
	b_startotherroutine(bau_964_bauer,"Start");
	b_startotherroutine(bau_965_bauer,"Start");
	b_startotherroutine(bau_966_bauer,"Start");
	b_startotherroutine(bau_967_bauer,"Start");
	b_startotherroutine(bau_968_bauer,"Start");
	b_startotherroutine(bau_969_bauer,"Start");
};


instance DIA_MALAK_BACK(C_INFO)
{
	npc = bau_963_malak;
	nr = 32;
	condition = dia_malak_back_condition;
	information = dia_malak_back_info;
	permanent = TRUE;
	description = "Z�stane� te� na Bengarov� farm�?";
};


func int dia_malak_back_condition()
{
	if((MIS_GETMALAKBACK == LOG_SUCCESS) && (NPCOBSESSEDBYDMT_MALAK == FALSE) && (hero.guild != GIL_KDF) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_malak_back_info()
{
	AI_Output(other,self,"DIA_Malak_BACK_15_00");	//Z�stane� te� na Bengarov� farm�?
	AI_Output(self,other,"DIA_Malak_BACK_08_01");	//Jasn�. N�jak to zvl�dneme.
	b_npcclearobsessionbydmt(self);
};


instance DIA_MALAK_KAP4_EXIT(C_INFO)
{
	npc = bau_963_malak;
	nr = 999;
	condition = dia_malak_kap4_exit_condition;
	information = dia_malak_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_malak_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_malak_kap4_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_MALAK_KAP5_EXIT(C_INFO)
{
	npc = bau_963_malak;
	nr = 999;
	condition = dia_malak_kap5_exit_condition;
	information = dia_malak_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_malak_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_malak_kap5_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_MALAK_KAP6_EXIT(C_INFO)
{
	npc = bau_963_malak;
	nr = 999;
	condition = dia_malak_kap6_exit_condition;
	information = dia_malak_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_malak_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_malak_kap6_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_MALAK_PICKPOCKET(C_INFO)
{
	npc = bau_963_malak;
	nr = 900;
	condition = dia_malak_pickpocket_condition;
	information = dia_malak_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_malak_pickpocket_condition()
{
	return c_beklauen(43,40);
};

func void dia_malak_pickpocket_info()
{
	Info_ClearChoices(dia_malak_pickpocket);
	Info_AddChoice(dia_malak_pickpocket,DIALOG_BACK,dia_malak_pickpocket_back);
	Info_AddChoice(dia_malak_pickpocket,DIALOG_PICKPOCKET,dia_malak_pickpocket_doit);
};

func void dia_malak_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_malak_pickpocket);
};

func void dia_malak_pickpocket_back()
{
	Info_ClearChoices(dia_malak_pickpocket);
};

