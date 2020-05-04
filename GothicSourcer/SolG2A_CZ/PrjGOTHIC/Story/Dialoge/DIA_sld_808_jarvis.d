
instance DIA_JARVIS_EXIT(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 999;
	condition = dia_jarvis_exit_condition;
	information = dia_jarvis_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jarvis_exit_condition()
{
	return TRUE;
};

func void dia_jarvis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JARVIS_HELLO(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 1;
	condition = dia_jarvis_hello_condition;
	information = dia_jarvis_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jarvis_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_jarvis_hello_info()
{
	AI_Output(self,other,"DIA_Jarvis_Hello_04_00");	//Hej! Nezn�m t� odn�kud?
	AI_Output(other,self,"DIA_Jarvis_Hello_15_01");	//To je mo�n�. Taky jsem byl v kolonii.
	AI_Output(self,other,"DIA_Jarvis_Hello_04_02");	//Spr�vn�... co chce�?
};


instance DIA_JARVIS_DIELAGE(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 2;
	condition = dia_jarvis_dielage_condition;
	information = dia_jarvis_dielage_info;
	permanent = FALSE;
	description = "Jak to vypad�?";
};


func int dia_jarvis_dielage_condition()
{
	return TRUE;
};

func void dia_jarvis_dielage_info()
{
	AI_Output(other,self,"DIA_Jarvis_DieLage_15_00");	//Jak to vypad�?
	AI_Output(self,other,"DIA_Jarvis_DieLage_04_01");	//Pr�v� te� m�me skute�n� probl�m. Mezi n�mi �old�ky se vytv��� dv� frakce.
	AI_Output(self,other,"DIA_Jarvis_DieLage_04_02");	//Sylvio a jeho lid� pochybuj�, �e Lee se dr�� spr�vn�ho z�m�ru.
};


instance DIA_JARVIS_TWOFRONTS(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 3;
	condition = dia_jarvis_twofronts_condition;
	information = dia_jarvis_twofronts_info;
	permanent = FALSE;
	description = "Jak to, �e jsou tu dv� frakce?";
};


func int dia_jarvis_twofronts_condition()
{
	if(Npc_KnowsInfo(other,dia_jarvis_dielage))
	{
		return TRUE;
	};
};

func void dia_jarvis_twofronts_info()
{
	AI_Output(other,self,"DIA_Jarvis_TwoFronts_15_00");	//Jak to, �e jsou tu dv� frakce?
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_01");	//V�t�ina z n�s se vr�tila z kolonie s Leem.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_02");	//Ale n�kte�� ze �old�k� se k n�m p�ipojili pozd�ji.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_03");	//Nep�i�li z kolonie, ale bojovali daleko na jihu se sk�ety.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_04");	//N�jak se dozv�d�li, �e Lee pot�eboval lidi. Jejich v�dcem byl Sylvio.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_05");	//On souhlasil s t�m, �e Lee z�stane velitelem, ale nyn� se sna�� po�tvat ostatn� �old�ky proti n�mu a jeho z�m�r�m.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_06");	//Hodn� Leeov�ch lid� si nemysl�, �e je to velkej probl�m. Ale j� zn�m t�pky jako je Sylvio.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_07");	//Aby doc�lil sv�ho, bude to klidn� hn�t na ost�� no�e.
};


instance DIA_JARVIS_LEESPLAN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 4;
	condition = dia_jarvis_leesplan_condition;
	information = dia_jarvis_leesplan_info;
	permanent = FALSE;
	description = "V�, co chce Lee d�lat?";
};


func int dia_jarvis_leesplan_condition()
{
	if(Npc_KnowsInfo(other,dia_jarvis_dielage))
	{
		return TRUE;
	};
};

func void dia_jarvis_leesplan_info()
{
	AI_Output(other,self,"DIA_Jarvis_LeesPlan_15_00");	//V�, co chce Lee d�lat?
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_01");	//Lee chce, abychom po�kali a nechali paladiny ve m�st� vyhladov�t.
	};
	AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_02");	//Chce n�s v�echny dostat z ostrova. A Innos v�, �e nem�m nic proti tomu odsud vypadnout.
	AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_03");	//Skute�n� nev�m, co p�esn� m� za lubem, ale j� mu v���m. Vedl n�s dote�ka dob�e.
};


instance DIA_JARVIS_SYLVIOSPLAN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 5;
	condition = dia_jarvis_sylviosplan_condition;
	information = dia_jarvis_sylviosplan_info;
	permanent = FALSE;
	description = "V�, co m� Sylvio v pl�nu?";
};


func int dia_jarvis_sylviosplan_condition()
{
	if(Npc_KnowsInfo(other,dia_jarvis_dielage))
	{
		return TRUE;
	};
};

func void dia_jarvis_sylviosplan_info()
{
	AI_Output(other,self,"DIA_Jarvis_SylviosPlan_15_00");	//V�, co m� Sylvio v pl�nu?
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_01");	//Sylvio zjistil, �e n�kte�� z paladin� se p�esunuli do star� kolonie.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_02");	//��k�, �e zbytek paladin� by si n�s tady neodv�il napadnout, a chce z toho vyt�it co nejv�c.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_03");	//Drancov�n� mal�ch farem, p�epad�v�n� vojensk�ch hl�dek mimo m�sta, olupov�n� poutn�k�, prost� takov�hle v�ci.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_04");	//Ale Lee si mysl�, �e by to byla ta nejhor�� v�c, jakou bychom v na�� situaci mohli ud�lat.
};


instance DIA_JARVIS_WANNAJOIN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 6;
	condition = dia_jarvis_wannajoin_condition;
	information = dia_jarvis_wannajoin_info;
	permanent = FALSE;
	description = "Cht�l bych se st�t �old�kem!";
};


func int dia_jarvis_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_jarvis_wannajoin_info()
{
	AI_Output(other,self,"DIA_Jarvis_WannaJoin_15_00");	//Cht�l bych se st�t �old�kem!
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_01");	//Nejsem si jistej, �e je to dobrej n�pad.
	AI_Output(other,self,"DIA_Jarvis_WannaJoin_15_02");	//Kde je probl�m?
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_03");	//No, bu� budu hlasovat pro, nebo proti.
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_04");	//A v situaci, ve kter� jsme, bych pro tebe ur�it� hlasoval, kdybych si byl jistej, �e jsi na Leeho stran�!
};


instance DIA_JARVIS_MISSIONKO(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 7;
	condition = dia_jarvis_missionko_condition;
	information = dia_jarvis_missionko_info;
	permanent = FALSE;
	description = "Tak�e co bych m�l d�lat?";
};


func int dia_jarvis_missionko_condition()
{
	if(Npc_KnowsInfo(other,dia_jarvis_wannajoin) && Npc_KnowsInfo(other,dia_jarvis_dielage))
	{
		return TRUE;
	};
};

func void dia_jarvis_missionko_info()
{
	AI_Output(other,self,"DIA_Jarvis_MissionKO_15_00");	//Tak�e co bych m�l d�lat?
	AI_Output(self,other,"DIA_Jarvis_MissionKO_04_01");	//Jednoduch�. Zmla� p�r Sylviov�ch hoch�! T�mhle zp�sobem budou ob� strany p�esn� v�d�t, kde stoj�.
	AI_Output(self,other,"DIA_Jarvis_MissionKO_04_02");	//A pokud se bude� p�i souboji dr�et pravidel, dokonce z�sk� respekt ostatn�ch.
	MIS_JARVIS_SLDKO = LOG_RUNNING;
	self.aivar[AIV_IGNORE_MURDER] = TRUE;
	Log_CreateTopic(TOPIC_JARVISSLDKO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JARVISSLDKO,LOG_RUNNING);
	b_logentry(TOPIC_JARVISSLDKO,"Jarvis mi d� sv�j hlas, pokud se mi poda�� porazit Sylviovy hochy.");
};


instance DIA_JARVIS_DUELLREGELN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_duellregeln_condition;
	information = dia_jarvis_duellregeln_info;
	permanent = FALSE;
	description = "Jak� jsou pravidla pro souboj?";
};


func int dia_jarvis_duellregeln_condition()
{
	if(MIS_JARVIS_SLDKO == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jarvis_duellregeln_info()
{
	AI_Output(other,self,"DIA_Jarvis_DuellRegeln_15_00");	//Jak� jsou pravidla pro souboj?
	AI_Output(self,other,"DIA_Jarvis_DuellRegeln_04_01");	//B� za Torlofem a nech si to vysv�tlit, pokud t� to zaj�m�.
	AI_Output(self,other,"DIA_Jarvis_DuellRegeln_04_02");	//Tak�e u� si rozum�me: Nezaj�m� m�, jestli dodr�uje� pravidla nebo ne. Prost� a� ti chlapi le�� dr�kou v bahn�!
	b_logentry(TOPIC_JARVISSLDKO,"A j� se ��dn�mi soubojov�mi pravidly ��dit nemus�m...");
};


instance DIA_JARVIS_SYLVIOSMEN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_sylviosmen_condition;
	information = dia_jarvis_sylviosmen_info;
	permanent = FALSE;
	description = "Kte�� ze �old�k� jsou Sylviovi mu�i?";
};


func int dia_jarvis_sylviosmen_condition()
{
	if(MIS_JARVIS_SLDKO == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jarvis_sylviosmen_info()
{
	AI_Output(other,self,"DIA_Jarvis_SylviosMen_15_00");	//Kte�� ze �old�k� jsou Sylviovi mu�i?
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_01");	//Je to �est chlap�. Prvn� je Sylvio s�m a jeho prav� ruka Bullco.
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_02");	//A pak jsou tu Rod, Sentenza, Fester a Raoul.
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_03");	//Zbytek chlap� je bu� neutr�ln�ch, nebo na Leeov� stran�.
	b_logentry(TOPIC_JARVISSLDKO,"K Sylviov�m chlap�m pat�� krom� Sylvia je�t� jeho velitel Bullco, Rod, Sentenza, Fester a Raoul.");
};


instance DIA_JARVIS_HOWMANY(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_howmany_condition;
	information = dia_jarvis_howmany_info;
	permanent = FALSE;
	description = "Kolik Sylviov�ch chlap� m�m porazit?";
};


func int dia_jarvis_howmany_condition()
{
	if(MIS_JARVIS_SLDKO == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jarvis_howmany_info()
{
	AI_Output(other,self,"DIA_Jarvis_HowMany_15_00");	//Kolik Sylviov�ch chlap� m�m porazit?
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_01");	//Pokud sraz� t�i z nich k zemi, pak n�m dok�e�, na kter� jsi stran�.
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_02");	//Koho z nich si vybere�, to je tvoje v�c.
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_03");	//Alespo� jedna mal� rada: Tohle nen� o tom dok�zat si kur�. Necho� p��mo proti Sylviovi samotn�mu - nad�lal by z tebe sekanou.
	b_logentry(TOPIC_JARVISSLDKO,"Posta��, kdy� poraz�m t�i Sylviovy kump�ny - se Sylviem samotn�m bych se do k��ku rad�i pou�t�t nem�l.");
};


instance DIA_JARVIS_HOWMANYLEFT(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_howmanyleft_condition;
	information = dia_jarvis_howmanyleft_info;
	permanent = TRUE;
	description = "Kolik Sylviov�ch mu�� m�m je�t� na seznamu?";
};


func int dia_jarvis_howmanyleft_condition()
{
	if((MIS_JARVIS_SLDKO == LOG_RUNNING) && Npc_KnowsInfo(other,dia_jarvis_howmany))
	{
		return TRUE;
	};
};

func void dia_jarvis_howmanyleft_info()
{
	var int victories;
	AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_00");	//Kolik Sylviov�ch mu�� m�m je�t� na seznamu?
	victories = 0;
	if((bullco.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (bullco.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_01");	//Porazil jsem Bullca.
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_02");	//Sly�el jsem. To nebylo zl�.
		victories = victories + 1;
	};
	if((rod.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (rod.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_03");	//Rod vypad� trochu unaven�.
		victories = victories + 1;
	};
	if((sentenza.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (sentenza.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		if(Npc_KnowsInfo(other,dia_sentenza_hello))
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_04");	//Sentenza se pokusil ze mne dostat n�jakou zlatku - to nebylo chytr�.
		}
		else
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_05");	//Sundal jsem Sentenzu.
		};
		victories = victories + 1;
	};
	if((fester.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (fester.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		if(MIS_FESTER_KILLBUGS == LOG_OBSOLETE)
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_06");	//Fester se m� pokusil oblafnout - to byla velk� chyba.
		}
		else
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_07");	//Fester dostal to, co si zaslou�il.
		};
		victories = victories + 1;
	};
	if((raoul.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (raoul.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		if(victories == 0)
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_08");	//A to sam� Raoul...
		}
		else
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_09");	//Byl jsem se na Raoula pod�vat...
		};
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_10");	//A?
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_11");	//Pot�eboval po��dnou nakl�da�ku.
		victories = victories + 1;
	};
	if(victories < 3)
	{
		if(victories == 0)
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_12");	//Dote� jsi neslo�il jedin�ho Sylviova chlapa.
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_13");	//Dob�e - jen pokra�uj.
		};
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_14");	//O�ek�v�m od tebe, �e z��d� alespo� t�i z nich.
	}
	else
	{
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_15");	//To sta��, to sta��.
		if(victories == 6)
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_16");	//Ty jsi skute�n� napr�skal ka�d�mu z nich, jo?
		};
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_17");	//Ud�lal jsi na m� dojem - a� se m� Lee zept�, budu bez v�h�n� hlasovat pro tebe.
		MIS_JARVIS_SLDKO = LOG_SUCCESS;
		self.aivar[AIV_IGNORE_MURDER] = FALSE;
		b_giveplayerxp(XP_AMBIENT * victories);
		b_logentry(TOPIC_SLDRESPEKT,"Kdy� se budu cht�t p�ipojit k �old�k�m, Jarvis bude pro.");
	};
};


var int jarvis_guildcomment;
var int jarvis_sylviocomment;

instance DIA_JARVIS_PERM(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_perm_condition;
	information = dia_jarvis_perm_info;
	permanent = FALSE;
	description = "Co je nov�ho?";
};


func int dia_jarvis_perm_condition()
{
	if(other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_jarvis_perm_info()
{
	AI_Output(other,self,"DIA_Jarvis_PERM_15_00");	//Co je nov�ho?
	if(KAPITEL <= 3)
	{
		if(JARVIS_GUILDCOMMENT == FALSE)
		{
			if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
			{
				AI_Output(self,other,"DIA_Jarvis_PERM_04_01");	//Te� jsi jeden z n�s. To je dob�e.
			}
			else
			{
				AI_Output(self,other,"DIA_Jarvis_PERM_04_02");	//Vybral sis �patn�, mohl ses st�t jedn�m z n�s.
			};
			JARVIS_GUILDCOMMENT = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_03");	//Posledn� dobou Sylviovi lid� dost zkrotli. (divok� sm�ch)
		};
	};
	if(KAPITEL >= 4)
	{
		if(JARVIS_SYLVIOCOMMENT == FALSE)
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_04");	//Sylvio je kone�n� pry�. Po tom, co sly�el o drac�ch, on a jeho p�r chlap� sm��ovali do t�a�sk� kolonie.
			AI_Output(self,other,"DIA_Jarvis_PERM_04_05");	//Pravd�podobn� si myslel, �e by tam mohlo b�t n�co v�c.
			JARVIS_SYLVIOCOMMENT = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_06");	//Nic, te� u� je v�echno v klidu. Nemohu se do�kat toho, a� uvid�m, jak tohle v�echno dopadne.
		};
	};
};


instance DIA_JARVIS_PICKPOCKET(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 900;
	condition = dia_jarvis_pickpocket_condition;
	information = dia_jarvis_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_jarvis_pickpocket_condition()
{
	return c_beklauen(41,55);
};

func void dia_jarvis_pickpocket_info()
{
	Info_ClearChoices(dia_jarvis_pickpocket);
	Info_AddChoice(dia_jarvis_pickpocket,DIALOG_BACK,dia_jarvis_pickpocket_back);
	Info_AddChoice(dia_jarvis_pickpocket,DIALOG_PICKPOCKET,dia_jarvis_pickpocket_doit);
};

func void dia_jarvis_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jarvis_pickpocket);
};

func void dia_jarvis_pickpocket_back()
{
	Info_ClearChoices(dia_jarvis_pickpocket);
};

