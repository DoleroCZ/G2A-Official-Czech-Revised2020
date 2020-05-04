
instance DIA_PARCIVAL_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_exit_condition;
	information = dia_parcival_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_parcival_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_SCHURFER(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_schurfer_condition;
	information = dia_parcival_schurfer_info;
	permanent = FALSE;
	description = "Co mi m��e� ��ct o horn�c�ch?";
};


func int dia_parcival_schurfer_condition()
{
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_parcival_schurfer_info()
{
	AI_Output(other,self,"DIA_Parcival_Schurfer_15_00");	//Co mi m��e� ��ct o horn�c�ch?
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_01");	//Vypravil jsem t�i skupiny.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_02");	//Vedou je paladinov� Marcos, Fajeth a Silvestro.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_03");	//Marcosova skupina vyrazila sm�rem ke star�mu dolu - vedl ji star� kop�� jm�nem Grimes.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_04");	//Dal�� dv� skupiny �ly spole�n�.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_05");	//Podle Jergana, jednoho z na�ich zv�d�, rozbili t�bor pobl� velk� v�e.
	b_logentry(TOPIC_SCOUTMINE,"Ka�d� odd�l kop��� vede jeden z paladin� - Marcos, Fajeth a Silvestro.");
	b_logentry(TOPIC_SCOUTMINE,"Marcosova skupina se vydala tam, kde kdysi b�val star� d�l. Jejich vyzv�da�em je Grimes.");
	b_logentry(TOPIC_SCOUTMINE,"Dal�� dv� skupiny se spojily dohromady a usadily se pobl� velk� v�e.");
};


instance DIA_PARCIVAL_DIEGO(C_INFO)
{
	npc = pal_252_parcival;
	nr = 9;
	condition = dia_parcival_diego_condition;
	information = dia_parcival_diego_info;
	permanent = FALSE;
	description = "K jak� skupin� se p�ipojil Diego?";
};


func int dia_parcival_diego_condition()
{
	if((SEARCHFORDIEGO == LOG_RUNNING) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_parcival_diego_info()
{
	AI_Output(other,self,"DIA_Parcival_Diego_15_00");	//K jak� skupin� se p�ipojil Diego?
	AI_Output(self,other,"DIA_Parcival_Diego_13_01");	//Ten trestanec - Diego? �el se skupinou paladina Silvestra.
	b_logentry(TOPIC_SCOUTMINE,"Diego se p�ipojil ke skupin�, kterou vede paladin Silvestro.");
};


instance DIA_PARCIVAL_WEG(C_INFO)
{
	npc = pal_252_parcival;
	nr = 8;
	condition = dia_parcival_weg_condition;
	information = dia_parcival_weg_info;
	permanent = FALSE;
	description = "V�, jak se dostat k dol�m?";
};


func int dia_parcival_weg_condition()
{
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_parcival_weg_info()
{
	AI_Output(other,self,"DIA_Parcival_Weg_15_00");	//V�, jak se dostat k dol�m?
	AI_Output(self,other,"DIA_Parcival_Weg_13_01");	//Do toho �dol� nevede ��dn� bezpe�n� cesta. Ale zd� se mi rozumn� nej�t p��m�m sm�rem.
	AI_Output(self,other,"DIA_Parcival_Weg_13_02");	//Sna� se vyhnout sk�et�m a les�m - a nech� t� Innos ochra�uje.
	b_logentry(TOPIC_SCOUTMINE,"Bude moud�ej�� nej�t nejkrat�� cestou, to by mohlo b�t nebezpe�n�. Zvl᚝ bych se m�l vyh�bat les�m a sk�et�m.");
};


instance DIA_PARCIVAL_DRAGON(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_dragon_condition;
	information = dia_parcival_dragon_info;
	description = "Jak to vypad�?";
};


func int dia_parcival_dragon_condition()
{
	return TRUE;
};

func void dia_parcival_dragon_info()
{
	AI_Output(other,self,"DIA_Parcival_DRAGON_15_00");	//Jak to vypad�?
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_01");	//T�bor obkl��ili sk�eti. Doslova se tam zakopali.
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_02");	//Ale mnohem v�c znepokojuj�c� jsou �toky drak�. Zpusto�ili u� cel� vn�j�� opevn�n�.
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_03");	//Je�t� jeden dra�� �tok a budeme m�t t�k� ztr�ty.
};


instance DIA_PARCIVAL_DRAGONS(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_dragons_condition;
	information = dia_parcival_dragons_info;
	description = "Kolik drak� tu je?";
};


func int dia_parcival_dragons_condition()
{
	if(Npc_KnowsInfo(hero,dia_parcival_dragon) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_parcival_dragons_info()
{
	AI_Output(other,self,"DIA_Parcival_DRAGONS_15_00");	//Kolik drak� tu je?
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_01");	//Netu��me, kolik jich je dohromady, ale ur�it� to je v�c ne� jeden.
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_02");	//Ale to nen� v�echno. Cel� Hornick� �dol� je pln� zl�ch stv�r, kter� drak�m slou��.
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_03");	//Co si budeme namlouvat - bez posil zven�� jsou na�e �ance dostat se odsud v jednom kuse miziv�.
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_BRAVE(C_INFO)
{
	npc = pal_252_parcival;
	nr = 8;
	condition = dia_parcival_brave_condition;
	information = dia_parcival_brave_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_parcival_brave_condition()
{
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(hero,dia_parcival_dragons) && (KAPITEL < 3) && (PARCIVAL_BRAVE_LABERCOUNT <= 6))
	{
		return TRUE;
	};
};


var int parcival_brave_labercount;

func void dia_parcival_brave_info()
{
	var int randy;
	if(PARCIVAL_BRAVE_LABERCOUNT < 6)
	{
		randy = Hlp_Random(3);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_00");	//V�ude panuje klid. To se ale m��e rychle zm�nit.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_01");	//Zkus�me vydr�et tak dlouho, jak to jen p�jde.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_02");	//Innos n�m pom��e. Jeho sv�tlo z��� v na�ich srdc�ch!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_BRAVE_13_03");	//Hej! Nem� na pr�ci nic d�le�it�j��ho, ne� se mnou po��d tlachat? Mazej!
		b_giveplayerxp(XP_AMBIENT);
	};
	PARCIVAL_BRAVE_LABERCOUNT = PARCIVAL_BRAVE_LABERCOUNT + 1;
};


instance DIA_PARCIVAL_KAP3_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_kap3_exit_condition;
	information = dia_parcival_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_parcival_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_ALLESKLAR(C_INFO)
{
	npc = pal_252_parcival;
	nr = 31;
	condition = dia_parcival_allesklar_condition;
	information = dia_parcival_allesklar_info;
	permanent = TRUE;
	description = "Je v�echno v po��dku?";
};


func int dia_parcival_allesklar_condition()
{
	if((KAPITEL == 3) && (DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER < 3) && Npc_KnowsInfo(other,dia_parcival_dragon))
	{
		return TRUE;
	};
};


var int dia_parcival_allesklar_nervcounter;

func void dia_parcival_allesklar_info()
{
	AI_Output(other,self,"DIA_Parcival_ALLESKLAR_15_00");	//Je v�echno v po��dku?
	if(DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER == 0)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_01");	//Zat�m jo!
	}
	else if(DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER == 1)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_02");	//Jo, zatracen�.
	}
	else if(PARCIVAL_BRAVE_LABERCOUNT > 6)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_03");	//(zasm�je se) Ale. Te� ch�pu, co m� za lubem. Ne, p��teli. Tentokr�t ne.
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_04");	//Neotravuj.
	};
	DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER = DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER + 1;
};


instance DIA_PARCIVAL_KAP4_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_kap4_exit_condition;
	information = dia_parcival_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_parcival_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_ANYNEWS(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_anynews_condition;
	information = dia_parcival_anynews_info;
	description = "Stalo se n�co d�le�it�ho?";
};


func int dia_parcival_anynews_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_parcival_dragon))
	{
		return TRUE;
	};
};

func void dia_parcival_anynews_info()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_15_00");	//Stalo se n�co d�le�it�ho?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_01");	//Ty pat�� k t� spodin�, co si ��k� drakobijci?
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_02");	//V�n� jsem si myslel, �e v sob� m� dost cti, ne� aby ses spol�oval s takov�mi lidmi.
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_03");	//D�l�m si starosti. Velk� starosti.
		AI_Output(other,self,"DIA_Parcival_AnyNews_15_04");	//Kv�li �emu?
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_05");	//Ned�vno p�i�li tihle chl�pci. ��kaj� si drakobijci.
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_06");	//Jak to vid�m j�, jsou to povale�i a zlo�inci.
	};
	AI_Output(self,other,"DIA_Parcival_AnyNews_13_07");	//Kdyby z�le�elo na mn�, vyhnal bych je z hradu. A� se o n� postaraj� sk�eti.
	Info_ClearChoices(dia_parcival_anynews);
	Info_AddChoice(dia_parcival_anynews,"Ale jsou tady, na rozd�l od lorda Hagena.",dia_parcival_anynews_lordhagen);
	Info_AddChoice(dia_parcival_anynews,"Mo�n� bys jim m�l d�t �anci.",dia_parcival_anynews_chance);
	Info_AddChoice(dia_parcival_anynews,"Nezd� se ti, �e to p�eh�n�?",dia_parcival_anynews_overact);
};

func void dia_parcival_anynews_lordhagen()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_LordHagen_15_00");	//Ale jsou tady, na rozd�l od lorda Hagena.
	AI_Output(self,other,"DIA_Parcival_AnyNews_LordHagen_13_01");	//(trpce se zasm�je) Ano, bohu�el jsou to jedin�, co tady m�me.
	AI_Output(self,other,"DIA_Parcival_AnyNews_LordHagen_13_02");	//Innos n�s opravdu velice t�ce zkou��.
	Info_ClearChoices(dia_parcival_anynews);
};

func void dia_parcival_anynews_chance()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_Chance_15_00");	//Mo�n� bys jim m�l d�t �anci.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_01");	//U� ji dostali. Bohu�el.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_02");	//Garond je p�esv�d�en, �e by n�m mohli pomoci.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_03");	//Ale j� z nich nespust�m oko. M�me u� dost probl�m� se sk�ety, nepot�ebujeme dal�� pot�e.
	Info_ClearChoices(dia_parcival_anynews);
};

func void dia_parcival_anynews_overact()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_Overact_15_00");	//Nezd� se ti, �e to p�eh�n�?
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_01");	//To rozhodn� ne. V na�em postaven� pot�ebujeme mu�e, kte�� by st�li p��kladem.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_02");	//Bojovn�ky, kte�� by v srdc�ch na�ich voj�k� za�hnuli Innos�v ohe�.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_03");	//M�sto toho tahle sebranka podr�v� mor�lku na�eho mu�stva.
};


instance DIA_PARCIVAL_JAN(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_jan_condition;
	information = dia_parcival_jan_info;
	permanent = FALSE;
	description = "Mus�m si s tebou promluvit o Janovi.";
};


func int dia_parcival_jan_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_RUNNING) && Npc_KnowsInfo(other,dia_parcival_dragon))
	{
		return TRUE;
	};
};

func void dia_parcival_jan_info()
{
	AI_Output(other,self,"DIA_Parcival_Jan_15_00");	//Mus�m si s tebou promluvit o Janovi.
	AI_Output(self,other,"DIA_Parcival_Jan_13_01");	//Jan? Kdo je to?
	AI_Output(other,self,"DIA_Parcival_Jan_15_02");	//Drakobijec. Je kov��.
	AI_Output(self,other,"DIA_Parcival_Jan_13_03");	//No ano, u� si vzpom�n�m. Co je s n�m?
	AI_Output(other,self,"DIA_Parcival_Jan_15_04");	//Chce pracovat v kov�rn�.
	AI_Output(self,other,"DIA_Parcival_Jan_13_05");	//Nep�ipad� v �vahu. Je jedn�m z nich a j� jim nev���m.
};


instance DIA_PARCIVAL_THINKAGAIN(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_thinkagain_condition;
	information = dia_parcival_thinkagain_info;
	permanent = TRUE;
	description = "Nem��e� tu v�c s Janem je�t� jednou zv�it?";
};


func int dia_parcival_thinkagain_condition()
{
	if(Npc_KnowsInfo(other,dia_parcival_jan) && (MIS_JANBECOMESSMITH == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_parcival_thinkagain_info()
{
	AI_Output(other,self,"DIA_Parcival_ThinkAgain_15_00");	//Nem��e� tu v�c s Janem je�t� jednou zv�it?
	AI_Output(self,other,"DIA_Parcival_ThinkAgain_13_01");	//Ne, stoj�m si za sv�m rozhodnut�m.
};


instance DIA_PARCIVAL_TALKEDGAROND(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_talkedgarond_condition;
	information = dia_parcival_talkedgarond_info;
	description = "Garond chce, aby se Jan staral o kov�rnu.";
};


func int dia_parcival_talkedgarond_condition()
{
	if(Npc_KnowsInfo(other,dia_parcival_jan) && (MIS_JANBECOMESSMITH == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_parcival_dragon))
	{
		return TRUE;
	};
};

func void dia_parcival_talkedgarond_info()
{
	AI_Output(other,self,"DIA_Parcival_TalkedGarond_15_00");	//Garond chce, aby se Jan staral o kov�rnu.
	AI_Output(self,other,"DIA_Parcival_TalkedGarond_13_01");	//Hmm. Pokud to je tak, a� si tu kov�rnu klidn� m�.
	AI_Output(self,other,"DIA_Parcival_TalkedGarond_13_02");	//I kdy� si mysl�m, �e v��it tomu Janovi je velk� chyba.
};


instance DIA_PARCIVAL_PERMKAP4(C_INFO)
{
	npc = pal_252_parcival;
	nr = 43;
	condition = dia_parcival_permkap4_condition;
	information = dia_parcival_permkap4_info;
	permanent = TRUE;
	description = "A krom� toho?";
};


func int dia_parcival_permkap4_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_parcival_anynews))
	{
		return TRUE;
	};
};

func void dia_parcival_permkap4_info()
{
	AI_Output(other,self,"DIA_Parcival_PERMKAP4_15_00");	//A krom� toho?
	AI_Output(self,other,"DIA_Parcival_PERMKAP4_13_01");	//Ale, nech m� u� b�t!
};


instance DIA_PARCIVAL_KAP5_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_kap5_exit_condition;
	information = dia_parcival_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_parcival_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_VERRAETER(C_INFO)
{
	npc = pal_252_parcival;
	condition = dia_parcival_verraeter_condition;
	information = dia_parcival_verraeter_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_parcival_verraeter_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (MIS_OCGATEOPEN == TRUE))
	{
		return TRUE;
	};
};

func void dia_parcival_verraeter_info()
{
	AI_Output(self,other,"DIA_Parcival_VERRAETER_13_00");	//Zr�dce! Jsem si jist�, �es to byl TY, kdo otev�el br�nu.
	AI_Output(self,other,"DIA_Parcival_VERRAETER_13_01");	//Za to zaplat�.
	Npc_SetRefuseTalk(self,30);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_PARCIVAL_KAP6_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_kap6_exit_condition;
	information = dia_parcival_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_parcival_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_PICKPOCKET(C_INFO)
{
	npc = pal_252_parcival;
	nr = 900;
	condition = dia_parcival_pickpocket_condition;
	information = dia_parcival_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_parcival_pickpocket_condition()
{
	return c_beklauen(84,460);
};

func void dia_parcival_pickpocket_info()
{
	Info_ClearChoices(dia_parcival_pickpocket);
	Info_AddChoice(dia_parcival_pickpocket,DIALOG_BACK,dia_parcival_pickpocket_back);
	Info_AddChoice(dia_parcival_pickpocket,DIALOG_PICKPOCKET,dia_parcival_pickpocket_doit);
};

func void dia_parcival_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_parcival_pickpocket);
};

func void dia_parcival_pickpocket_back()
{
	Info_ClearChoices(dia_parcival_pickpocket);
};

