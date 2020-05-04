
instance DIA_THEKLA_EXIT(C_INFO)
{
	npc = bau_913_thekla;
	nr = 999;
	condition = dia_thekla_exit_condition;
	information = dia_thekla_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_thekla_exit_condition()
{
	return TRUE;
};

func void dia_thekla_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_THEKLA_HALLO(C_INFO)
{
	npc = bau_913_thekla;
	nr = 1;
	condition = dia_thekla_hallo_condition;
	information = dia_thekla_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thekla_hallo_condition()
{
	return TRUE;
};

func void dia_thekla_hallo_info()
{
	AI_Output(self,other,"DIA_Thekla_HALLO_17_00");	//Co d�l� tady v kuchyni?
};


instance DIA_THEKLA_LECKER(C_INFO)
{
	npc = bau_913_thekla;
	nr = 2;
	condition = dia_thekla_lecker_condition;
	information = dia_thekla_lecker_info;
	permanent = FALSE;
	description = "N�co tady v�born� von�!";
};


func int dia_thekla_lecker_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_thekla_lecker_info()
{
	AI_Output(other,self,"DIA_Thekla_Lecker_15_00");	//N�co tady v�born� von�!
	AI_Output(self,other,"DIA_Thekla_Lecker_17_01");	//No jasn�! Takov� jako ty dob�e zn�m! Takov�ch se tady po okol� potuluj� spousty.
	AI_Output(self,other,"DIA_Thekla_Lecker_17_02");	//Nejd��v se sna�� vet��t do tvoj� p��zn� a pak, kdy� je pot�ebuje�, nejsou nikde k nalezen�!
};


var int thekla_gavestew;

instance DIA_THEKLA_HUNGER(C_INFO)
{
	npc = bau_913_thekla;
	nr = 3;
	condition = dia_thekla_hunger_condition;
	information = dia_thekla_hunger_info;
	permanent = FALSE;
	description = "M�m hlad!";
};


func int dia_thekla_hunger_condition()
{
	if(THEKLA_GAVESTEW == FALSE)
	{
		return TRUE;
	};
};

func void dia_thekla_hunger_info()
{
	AI_Output(other,self,"DIA_Thekla_Hunger_15_00");	//M�m hlad!
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_01");	//Neserv�ruju tul�k�m. J�dlo je jen pro lidi, co tu pracuj�.
		AI_Output(self,other,"DIA_Thekla_Hunger_17_02");	//(pohrdav�) A pro tu �old�ckou ch�tru, samoz�ejm�.
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_03");	//Tady, tv�j dlabanec.
		b_giveinvitems(self,other,itfo_xpstew,1);
		THEKLA_GAVESTEW = TRUE;
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_04");	//Tady se j�dlo voj�k�m nepod�v�.
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_05");	//Jak by se dal odm�tnout Innos�v zmocn�nec?
		b_giveinvitems(self,other,itfo_xpstew,1);
		THEKLA_GAVESTEW = TRUE;
	};
};


instance DIA_THEKLA_ARBEIT(C_INFO)
{
	npc = bau_913_thekla;
	nr = 4;
	condition = dia_thekla_arbeit_condition;
	information = dia_thekla_arbeit_info;
	permanent = FALSE;
	description = "Hled�m pr�ci.";
};


func int dia_thekla_arbeit_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_thekla_arbeit_info()
{
	AI_Output(other,self,"DIA_Thekla_Arbeit_15_00");	//Hled�m pr�ci...
	AI_Output(self,other,"DIA_Thekla_Arbeit_17_01");	//Chce� pracovat tady na farm�?
	AI_Output(self,other,"DIA_Thekla_Arbeit_17_02");	//O tom m��e rozhodnout pouze Onar. Farma pat�� jemu, stejn� jako cel� �dol�.
};


instance DIA_THEKLA_WANNAJOIN(C_INFO)
{
	npc = bau_913_thekla;
	nr = 5;
	condition = dia_thekla_wannajoin_condition;
	information = dia_thekla_wannajoin_info;
	permanent = FALSE;
	description = "Vlastn� jsem se cht�l p�ipojit k �oldn���m ...";
};


func int dia_thekla_wannajoin_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_thekla_arbeit))
	{
		return TRUE;
	};
};

func void dia_thekla_wannajoin_info()
{
	AI_Output(other,self,"DIA_Thekla_WannaJoin_15_00");	//Vlastn� jsem se cht�l p�ipojit k �oldn���m.
	AI_Output(self,other,"DIA_Thekla_WannaJoin_17_01");	//Tak�e ty jsi dal�� z t�ch lotr� z trestaneck� kolonie?
	AI_Output(self,other,"DIA_Thekla_WannaJoin_17_02");	//To se dalo �ekat! Nech m� na pokoji! Takov�ch jako ty u� je tady v okol� a� dost!
};


instance DIA_THEKLA_SCHLAFEN(C_INFO)
{
	npc = bau_913_thekla;
	nr = 6;
	condition = dia_thekla_schlafen_condition;
	information = dia_thekla_schlafen_info;
	permanent = FALSE;
	description = "Pot�ebuju se n�kde vyspat.";
};


func int dia_thekla_schlafen_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_thekla_schlafen_info()
{
	AI_Output(other,self,"DIA_Thekla_Schlafen_15_00");	//Pot�ebuju se n�kde vyspat.
	AI_Output(self,other,"DIA_Thekla_Schlafen_17_01");	//Ani nepomysli na to, �e by ses mohl vyspat v moj� kuchyni. Najdi si n�co ve stodole.
};


instance DIA_THEKLA_PROBLEM(C_INFO)
{
	npc = bau_913_thekla;
	nr = 7;
	condition = dia_thekla_problem_condition;
	information = dia_thekla_problem_info;
	permanent = FALSE;
	description = "Co m� za probl�my se �old�ky?";
};


func int dia_thekla_problem_condition()
{
	if((KAPITEL <= 3) && Npc_KnowsInfo(other,dia_thekla_wannajoin))
	{
		return TRUE;
	};
};

func void dia_thekla_problem_info()
{
	AI_Output(other,self,"DIA_Thekla_Problem_15_00");	//Co m� za probl�my se �old�ky?
	AI_Output(self,other,"DIA_Thekla_Problem_17_01");	//Ach, ti pitomci mi v�n� lezou na nervy! Obzvl᚝ Sylvio a jeho tlustej k�mo� Bullco.
	AI_Output(self,other,"DIA_Thekla_Problem_17_02");	//Ti dva tu sed� cel� dny a ztrp�uj� mi �ivot.
	AI_Output(self,other,"DIA_Thekla_Problem_17_03");	//Ta pol�vka je moc hork�, maso moc tuh� a tak po��d dokola.
	if(other.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Thekla_Problem_15_04");	//A pro� s t�m teda n�co neud�l�?
		AI_Output(self,other,"DIA_Thekla_Problem_17_05");	//A co jako m�m d�lat, pane Chytrol�n? Pra�tit je v�le�kem? To si m��u dovolit na farm��e, ale tihle podl� bastardi mi to prost� vr�t�.
	};
};


instance DIA_THEKLA_MANIEREN(C_INFO)
{
	npc = bau_913_thekla;
	nr = 7;
	condition = dia_thekla_manieren_condition;
	information = dia_thekla_manieren_info;
	permanent = FALSE;
	description = "Chce�, abych ty dva nau�il slu�n�m zp�sob�m?";
};


func int dia_thekla_manieren_condition()
{
	if(Npc_KnowsInfo(other,dia_thekla_problem) && (sylvio.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && (bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_thekla_manieren_info()
{
	AI_Output(other,self,"DIA_Thekla_Manieren_15_00");	//Chce�, abych ty dva nau�il slu�n�m zp�sob�m?
	AI_Output(self,other,"DIA_Thekla_Manieren_17_01");	//Ud�l� l�p, kdy� to nebude� zkou�et, drahou�ku. Co v�m, tak Sylvio m� magickou zbroj. Jeho nem��e� porazit.
	AI_Output(other,self,"DIA_Thekla_Manieren_15_02");	//A co Bullco?
	AI_Output(self,other,"DIA_Thekla_Manieren_17_03");	//Ten chlap je silnej jako hovado. Co pamatuju, srazil ka�d�ho, kdo jemu nebo Sylviovi d�lal pot�e.
};


instance DIA_THEKLA_AFTERFIGHT(C_INFO)
{
	npc = bau_913_thekla;
	nr = 7;
	condition = dia_thekla_afterfight_condition;
	information = dia_thekla_afterfight_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thekla_afterfight_condition()
{
	if((sylvio.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON) || (bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON) || ((bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST) && (KAPITEL <= 3)))
	{
		return TRUE;
	};
};

func void dia_thekla_afterfight_info()
{
	if(bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_00");	//V�n� bys m�l nechat Bullca na pokoji, drahou�ku.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_01");	//To mus� b�t po��dn� fu�ka srazit to tlust� prase.
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_02");	//Dostals docela nakl�da�ku, drahou�ku.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_03");	//Ne��kala jsem ti to snad? Te� v�, co jsem m�la na mysli.
		AI_Output(other,self,"DIA_Thekla_AfterFight_15_04");	//Jsem r�d, �e se dob�e bav�.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_05");	//Tak te� tak neprotahuj obli�ej. Nejsi prvn�, kdo od toho ne��da dostal napr�sk�no.
	};
	AI_Output(self,other,"DIA_Thekla_AfterFight_17_06");	//Tady, dej si trochu v�varu, a� se ti vr�t� s�la.
	b_giveinvitems(self,other,itfo_xpstew,1);
	THEKLA_GAVESTEW = TRUE;
};


instance DIA_THEKLA_SAGITTAPAKET(C_INFO)
{
	npc = bau_913_thekla;
	nr = 4;
	condition = dia_thekla_sagittapaket_condition;
	information = dia_thekla_sagittapaket_info;
	permanent = TRUE;
	description = "Tady je bal�k od Sagitty.";
};


func int dia_thekla_sagittapaket_condition()
{
	if(Npc_HasItems(other,itmi_theklaspaket) && (MIS_THEKLA_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_thekla_sagittapaket_info()
{
	b_giveinvitems(other,self,itmi_theklaspaket,1);
	AI_Output(other,self,"DIA_Thekla_SagittaPaket_15_00");	//Tady je bal�k od Sagitty.
	AI_Output(self,other,"DIA_Thekla_SagittaPaket_17_01");	//D�ky moc. Tak jsi byl p�ece jen k n��emu dobr�.
	MIS_THEKLA_PAKET = LOG_SUCCESS;
	b_giveplayerxp(XP_THEKLASPAKET);
};


var int thekla_mehreintopfkap1;
var int thekla_mehreintopfkap3;
var int thekla_mehreintopfkap5;

instance DIA_THEKLA_PERM(C_INFO)
{
	npc = bau_913_thekla;
	nr = 900;
	condition = dia_thekla_perm_condition;
	information = dia_thekla_perm_info;
	permanent = TRUE;
	description = "M��u dostat je�t� trochu toho v�varu?";
};


func int dia_thekla_perm_condition()
{
	if(THEKLA_GAVESTEW == TRUE)
	{
		return TRUE;
	};
};

func void dia_thekla_perm_info()
{
	AI_Output(other,self,"DIA_Thekla_PERM_15_00");	//M��u dostat je�t� trochu toho v�varu?
	if(MIS_THEKLA_PAKET == FALSE)
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_01");	//U� nic nem�m.
		AI_Output(other,self,"DIA_Thekla_PERM_15_02");	//Ani mali�kou misku?
		AI_Output(self,other,"DIA_Thekla_PERM_17_03");	//Ne.
		AI_Output(other,self,"DIA_Thekla_PERM_15_04");	//A m��u alespo� vyl�zat hrnec?
		AI_Output(self,other,"DIA_Thekla_PERM_17_05");	//Nech� toho?!
		AI_Output(self,other,"DIA_Thekla_PERM_17_06");	//Kdy� tak prahne� po m�m v�varu, m�l bys pro to n�co ud�lat.
		AI_Output(other,self,"DIA_Thekla_PERM_15_07");	//Co?
		AI_Output(self,other,"DIA_Thekla_PERM_17_08");	//Zajdi za Sagittou, l��itelkou, co �ije za Sekobovou farmou, a p�ines mi od n� bal�k bylinek.
		AI_Output(self,other,"DIA_Thekla_PERM_17_09");	//Kdy� mi p�inese� ty bylinky, ud�l�m ti trochu v�varu.
		MIS_THEKLA_PAKET = LOG_RUNNING;
		CreateInvItems(sagitta,itmi_theklaspaket,1);
		Log_CreateTopic(TOPIC_THEKLAEINTOPF,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_THEKLAEINTOPF,LOG_RUNNING);
		b_logentry(TOPIC_THEKLAEINTOPF,"Kdy� Thekle p�inesu byliny od l��itelky Sagitty, uva�� mi je�t� dal�� lektvar. Sagitta p�eb�v� kousek za Sekobov�m statkem.");
	}
	else if(MIS_THEKLA_PAKET == LOG_SUCCESS)
	{
		if(KAPITEL <= 2)
		{
			if(THEKLA_MEHREINTOPFKAP1 == FALSE)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_10");	//Dobr�. Tak budu hodn�. Tady. A� mi neum�e� hlady p�ed o�ima.
				b_giveinvitems(self,other,itfo_xpstew,1);
				THEKLA_MEHREINTOPFKAP1 = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_11");	//Hej, hej, hej, ne tak rychle! D�m ti v�d�t, a� pro tebe najdu n�jakou pr�ci.
				AI_Output(self,other,"DIA_Thekla_PERM_17_12");	//A PAK dostane� v�c v�varu, je to jasn�?
			};
		};
		if((KAPITEL == 3) || (KAPITEL == 4))
		{
			if((THEKLA_MEHREINTOPFKAP3 == FALSE) && (MIS_RESCUEBENNET == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_13");	//Sly�ela jsem, �es pomohl Bennetovi z v�zen�. Dobr� pr�ce, hochu.
				b_giveinvitems(self,other,itfo_xpstew,1);
				THEKLA_MEHREINTOPFKAP3 = TRUE;
			}
			else if(MIS_RESCUEBENNET != LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_14");	//Ty bastardi od domobrany hodili Benneta do lochu.
				AI_Output(self,other,"DIA_Thekla_PERM_17_15");	//Ud�lej mi laskavost a dosta� ho odtamtud, jo? A j� ti zat�m ud�l�m trochu toho b�je�n�ho v�varu.
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_16");	//U� mi nic nezbylo. Vra� se pozd�jc.
			};
		};
		if(KAPITEL >= 5)
		{
			if(THEKLA_MEHREINTOPFKAP5 == FALSE)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_17");	//Ty jsi po��d hladovej, co? A co vlastn� po��d d�l�?
				AI_Output(other,self,"DIA_Thekla_PERM_15_18");	//Sejmul jsem p�r drak�.
				AI_Output(self,other,"DIA_Thekla_PERM_17_19");	//�! Tak to m�m dojem, �e nade�la chv�le na po��dnej hrnec v�varu.
				b_giveinvitems(self,other,itfo_xpstew,1);
				THEKLA_MEHREINTOPFKAP5 = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_20");	//Pozd�. U� ��dn� v�var nezbyl.
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_21");	//��dn� bylinky, ��dn� v�var - v�me?
	};
};


instance DIA_THEKLA_PICKPOCKET(C_INFO)
{
	npc = bau_913_thekla;
	nr = 900;
	condition = dia_thekla_pickpocket_condition;
	information = dia_thekla_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_thekla_pickpocket_condition()
{
	return c_beklauen(53,60);
};

func void dia_thekla_pickpocket_info()
{
	Info_ClearChoices(dia_thekla_pickpocket);
	Info_AddChoice(dia_thekla_pickpocket,DIALOG_BACK,dia_thekla_pickpocket_back);
	Info_AddChoice(dia_thekla_pickpocket,DIALOG_PICKPOCKET,dia_thekla_pickpocket_doit);
};

func void dia_thekla_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thekla_pickpocket);
};

func void dia_thekla_pickpocket_back()
{
	Info_ClearChoices(dia_thekla_pickpocket);
};

