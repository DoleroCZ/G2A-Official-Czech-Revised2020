
instance DIA_CASSIA_EXIT(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 999;
	condition = dia_cassia_exit_condition;
	information = dia_cassia_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cassia_exit_condition()
{
	return TRUE;
};

func void dia_cassia_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CASSIA_PICKME(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 900;
	condition = dia_cassia_pickme_condition;
	information = dia_cassia_pickme_info;
	permanent = TRUE;
	description = PICKPOCKET_100_FEMALE;
};


func int dia_cassia_pickme_condition()
{
	return c_beklauen(100,400);
};

func void dia_cassia_pickme_info()
{
	Info_ClearChoices(dia_cassia_pickme);
	Info_AddChoice(dia_cassia_pickme,DIALOG_BACK,dia_cassia_pickme_back);
	Info_AddChoice(dia_cassia_pickme,DIALOG_PICKPOCKET,dia_cassia_pickme_doit);
};

func void dia_cassia_pickme_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_cassia_pickme);
};

func void dia_cassia_pickme_back()
{
	Info_ClearChoices(dia_cassia_pickme);
};


instance DIA_CASSIA_GILDE(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 1;
	condition = dia_cassia_gilde_condition;
	information = dia_cassia_gilde_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cassia_gilde_condition()
{
	if((CASSIA_GILDENCHECK == TRUE) && (JOIN_THIEFS == TRUE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_cassia_gilde_info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Cassia_Gilde_16_00");	//Vid�m, �e ses p�idal na stranu pr�va a ��du.
		AI_Output(self,other,"DIA_Cassia_Gilde_16_01");	//Nevad�, �e ses stal slu�ebn�kem Innose. Jsi jedn�m z n�s. A j� douf�m, �e se n�jak� zp�sob najde.
	};
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Cassia_Gilde_16_02");	//Tak te� pat�� k Innosov� c�rkvi. Fajn, ale je�t� po��d jsi jedn�m z n�s - douf�m, �e jsi na to nezapomn�l.
	};
	AI_StopProcessInfos(self);
};


instance DIA_CASSIA_ABGELAUFEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_abgelaufen_condition;
	information = dia_cassia_abgelaufen_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cassia_abgelaufen_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CASSIA_FRIST == TRUE) && (CASSIA_DAY < (b_getdayplus() - 2)))
	{
		return TRUE;
	};
};

func void dia_cassia_abgelaufen_info()
{
	AI_Output(self,other,"DIA_Cassia_Abgelaufen_16_00");	//Tv�j �as vypr�el. Nem�l ses vracet.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};


instance DIA_CASSIA_NEWS(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 1;
	condition = dia_cassia_news_condition;
	information = dia_cassia_news_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cassia_news_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_news_info()
{
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_News_16_00");	//Vid�m, �e jsi dostal n� dar. Jsem Cassia.
		AI_Output(other,self,"DIA_Cassia_News_15_01");	//Dobr�, Cassio, tak mi �ekni, pro� jsem tady.
		AI_Output(self,other,"DIA_Cassia_News_16_02");	//Upoutal jsi na�i pozornost t�m, �e jsi dok�zal z�skat d�v�ru jednoho z na�ich p��tel.
		AI_Output(self,other,"DIA_Cassia_News_16_03");	//A my ti chceme d�t �anci. M��e� se k n�m p�idat.
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_News_16_04");	//To se pod�vejme, kdo sem na�el cestu. Attila t� podcenil. Nehodl�m ud�lat stejnou chybu.
		AI_Output(other,self,"DIA_Cassia_News_15_05");	//Co to tady kujete?
		AI_Output(self,other,"DIA_Cassia_News_16_06");	//Chceme t� p�ipravit o �ivot za to, �e jsi don�el na na�eho p��tele. Proto jsme poslali Attilu.
		AI_Output(self,other,"DIA_Cassia_News_16_07");	//Nicm�n�, tv� p��tomnost tady n�m poskytuje nov� mo�nosti...
		AI_Output(other,self,"DIA_Cassia_News_15_08");	//... co mi chce� nab�dnout?
		AI_Output(self,other,"DIA_Cassia_News_16_09");	//M��e� se k n�m p�idat.
	};
	if((Npc_GetTrueGuild(other) == GIL_NONE) || (Npc_GetTrueGuild(other) == GIL_NOV))
	{
		CASSIA_GILDENCHECK = TRUE;
	};
	DG_GEFUNDEN = TRUE;
};


instance DIA_CASSIA_MEHR(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_mehr_condition;
	information = dia_cassia_mehr_info;
	permanent = FALSE;
	description = "�ekni mi o va�� organizaci v�c.";
};


func int dia_cassia_mehr_condition()
{
	return TRUE;
};

func void dia_cassia_mehr_info()
{
	AI_Output(other,self,"DIA_Cassia_mehr_15_00");	//�ekni mi o va�� organizaci v�c.
	AI_Output(self,other,"DIA_Cassia_mehr_16_01");	//Lid� z m�sta jsou n�mi trochu znepokojeni. Ale nikdo nezn� n� �kryt.
	AI_Output(self,other,"DIA_Cassia_mehr_16_02");	//Ta hrstka lid�, co v� o existenci stok, v���, �e jsou zam�en� a nikdo se do nich nem��e dostat.
	AI_Output(self,other,"DIA_Cassia_mehr_16_03");	//A dokud se do nich nikdo nedostane, m��eme v klidu pracovat.
};


instance DIA_CASSIA_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_missingpeople_condition;
	information = dia_cassia_missingpeople_info;
	permanent = FALSE;
	description = "Je tu n�co, co mi m��e� ��ct o ztracen�ch obyvatel�ch?";
};


func int dia_cassia_missingpeople_condition()
{
	if((SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (MISSINGPEOPLERETURNEDHOME == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Cassia_Add_15_00");	//Je tu n�co, co mi m��e� ��ct o ztracen�ch obyvatel�ch?
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_01");	//Pro� bys to cht�l v�det?
	AI_Output(other,self,"DIA_Addon_Cassia_Add_15_02");	//R�d bych zjistil, co se jim stalo.
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_03");	//Kdy� bude� opou�tet stoku, plav m�rn� doprava po pobre��.
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_04");	//Tam najde� odpov�di na sv� ot�zky ...
};


instance DIA_CASSIA_VORTEIL(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 3;
	condition = dia_cassia_vorteil_condition;
	information = dia_cassia_vorteil_info;
	permanent = FALSE;
	description = "Co z toho budu m�t, kdy� se k v�m p�id�m?";
};


func int dia_cassia_vorteil_condition()
{
	return TRUE;
};

func void dia_cassia_vorteil_info()
{
	AI_Output(other,self,"DIA_Cassia_Vorteil_15_00");	//Co z toho budu m�t, kdy� se k v�m p�id�m?
	AI_Output(self,other,"DIA_Cassia_Vorteil_16_01");	//M��e� se od n�s nau�it p�r zaj�mavejch v�c� - schopnosti, kter� ti umo�n� ��t v p�epychu.
	AI_Output(other,self,"DIA_Cassia_Vorteil_15_02");	//Ale nemus�m se skr�vat tady dole, nebo jo?
	AI_Output(self,other,"DIA_Cassia_Vorteil_16_03");	//(tich� sm�ch) Ne. Mus� jen dodr�ovat na�e pravidla. To je v�echno.
};


instance DIA_CASSIA_LERNEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 4;
	condition = dia_cassia_lernen_condition;
	information = dia_cassia_lernen_info;
	permanent = FALSE;
	description = "Co se od v�s m��u nau�it?";
};


func int dia_cassia_lernen_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_vorteil))
	{
		return TRUE;
	};
};

func void dia_cassia_lernen_info()
{
	AI_Output(other,self,"DIA_Cassia_Lernen_15_00");	//Co se od v�s m��u nau�it?
	AI_Output(self,other,"DIA_Cassia_Lernen_16_01");	//Jesper je mistrem v pl�en�. Uk�e ti, jak se nehlu�n� pohybovat.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_02");	//Ramirez je v�jime�n� nadan� zlod�j. Jeho ru�i�k�m neodol� ��dn� z�mek.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_03");	//A j� t� nau��m, jak si p�ivlast�ovat obsahy kapes. Ciz�ch.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_04");	//Taky ti pom��u s t�m, jak dos�hnout v�t�� obratnosti. Proto�e obratnost je kl��em ke tv�m schopnostem.
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Cassia m� nau�� kaps��stv� a pom��e mi zv��it obratnost.");
	b_logentry(TOPIC_CITYTEACHER,"Ramirez m� nau��, jak p��it z�mky.");
	b_logentry(TOPIC_CITYTEACHER,"Jesper m� nau�� pl�en�.");
};


instance DIA_CASSIA_REGELN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 3;
	condition = dia_cassia_regeln_condition;
	information = dia_cassia_regeln_info;
	permanent = FALSE;
	description = "Jak� jsou va�e pravidla?";
};


func int dia_cassia_regeln_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_vorteil))
	{
		return TRUE;
	};
};

func void dia_cassia_regeln_info()
{
	AI_Output(other,self,"DIA_Cassia_Regeln_15_00");	//Jak� jsou va�e pravidla?
	AI_Output(self,other,"DIA_Cassia_Regeln_16_02");	//Za prv�: Ne�pitne� o n�s ani sl�vko. Nikomu. Nikdy.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_03");	//Za druh�: Nenech� se chytit.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_04");	//Za t�et�: Jestli tady dole na n�koho vyt�hne� zbra�, zabijeme t�.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_05");	//A �tvrt�, posledn� pravidlo je: Ka�d�, kdo se k n�m chce p�idat, mus� prok�zat, �e k n��emu je.
};


instance DIA_CASSIA_ERWISCHEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_erwischen_condition;
	information = dia_cassia_erwischen_info;
	permanent = FALSE;
	description = "Co se stane, kdy� m� chytnou?";
};


func int dia_cassia_erwischen_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_regeln))
	{
		return TRUE;
	};
};

func void dia_cassia_erwischen_info()
{
	AI_Output(other,self,"DIA_Cassia_Erwischen_15_00");	//Co se stane, kdy� m� chytnou?
	AI_Output(self,other,"DIA_Cassia_Erwischen_16_01");	//Prost� se nenech chytit, jasn�?
};


instance DIA_CASSIA_BEWEISEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_beweisen_condition;
	information = dia_cassia_beweisen_info;
	permanent = TRUE;
	description = "Jak m�m dok�zat, �e jsem co k �emu?";
};


var int dia_cassia_beweisen_permanent;

func int dia_cassia_beweisen_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_regeln) && (DIA_CASSIA_BEWEISEN_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_beweisen_info()
{
	AI_Output(other,self,"DIA_Cassia_beweisen_15_00");	//Jak m�m dok�zat, �e jsem co k �emu?
	if(JOIN_THIEFS == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_beweisen_16_01");	//Tak p�id� se k n�m, nebo ne?
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_beweisen_16_02");	//Ten pali�atej starej alchymista - Constantino - m� n�dhern� prsten.
		AI_Output(self,other,"DIA_Cassia_beweisen_16_03");	//Ale jemu v�n� nen� k ni�emu. Chci, aby zdobil mou ruku.
		MIS_CASSIARING = LOG_RUNNING;
		DIA_CASSIA_BEWEISEN_PERMANENT = TRUE;
		Log_CreateTopic(TOPIC_CASSIARING,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CASSIARING,LOG_RUNNING);
		b_logentry(TOPIC_CASSIARING,"Cassia po mn� chce, abych j� p�inesl Constantin�v prsten.");
	};
};


instance DIA_CASSIA_BEITRETEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 10;
	condition = dia_cassia_beitreten_condition;
	information = dia_cassia_beitreten_info;
	permanent = FALSE;
	description = "Dobr�, jdu do toho.";
};


func int dia_cassia_beitreten_condition()
{
	if((JOIN_THIEFS == FALSE) && Npc_KnowsInfo(other,dia_cassia_regeln))
	{
		return TRUE;
	};
};

func void dia_cassia_beitreten_info()
{
	AI_Output(other,self,"DIA_Cassia_Beitreten_15_00");	//Dobr�, jdu do toho.
	AI_Output(self,other,"DIA_Cassia_Beitreten_16_01");	//V�born�. Dostal jsi �anci prok�zat, co v tob� v�z�. A jestli se chce� od n�s n��emu p�iu�it, jsi tady v�t�n.
	JOIN_THIEFS = TRUE;
};


instance DIA_CASSIA_ABLEHNEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 9;
	condition = dia_cassia_ablehnen_condition;
	information = dia_cassia_ablehnen_info;
	permanent = FALSE;
	description = "A co kdy� se k v�m nebudu cht�t p�idat...?";
};


func int dia_cassia_ablehnen_condition()
{
	if((JOIN_THIEFS == FALSE) && Npc_KnowsInfo(other,dia_cassia_regeln))
	{
		return TRUE;
	};
};

func void dia_cassia_ablehnen_info()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_15_00");	//A co kdy� se k v�m nebudu cht�t p�idat...?
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_01");	//Zahazuje� �anci, kter� se naskytne jen jednou, ale m��e� j�t.
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_02");	//(v�n�) A ani nepomysli na to, �e bys n�s n�komu prozradil. Mohl bys toho trpce litovat.
		Info_ClearChoices(dia_cassia_ablehnen);
		Info_AddChoice(dia_cassia_ablehnen,"OK, jdu do toho.",dia_cassia_ablehnen_okay);
		Info_AddChoice(dia_cassia_ablehnen,"Mus�m si to rozmyslet.",dia_cassia_ablehnen_frist);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_03");	//V tom p��pad� t� zabiju.
		Info_ClearChoices(dia_cassia_ablehnen);
		Info_AddChoice(dia_cassia_ablehnen,"OK, jdu do toho.",dia_cassia_ablehnen_okay);
		Info_AddChoice(dia_cassia_ablehnen,"No tak si m� zkus zab�t.",dia_cassia_ablehnen_kill);
	};
};

func void dia_cassia_ablehnen_okay()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Okay_15_00");	//Dobr�, jdu do toho.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Okay_16_01");	//(usm�v� se) U�inil jsi spr�vn� rozhodnut�. Jestli usp�je� ve zkou�ce, m��e� roz���it na�e �ady.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Okay_16_02");	//Jestli se chce� nejprve nau�it zlod�jsk� dovednosti, poslu� si - bude� je pot�ebovat.
	JOIN_THIEFS = TRUE;
	Info_ClearChoices(dia_cassia_ablehnen);
};

func void dia_cassia_ablehnen_kill()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Kill_15_00");	//No tak si m� zkus zab�t.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Kill_16_01");	//To je zl�. M�la jsem dojem, �e jsi chyt�ej��.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_cassia_ablehnen_frist()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Frist_15_00");	//Mus�m si to rozmyslet.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Frist_16_01");	//Jak chce�. D�v�m ti dva dny na rozmy�lenou. Po uplynut� lh�ty u� se tu nesm� uk�zat.
	CASSIA_DAY = b_getdayplus();
	CASSIA_FRIST = TRUE;
	Info_ClearChoices(dia_cassia_ablehnen);
};


instance DIA_CASSIA_BEVORLERNEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 5;
	condition = dia_cassia_bevorlernen_condition;
	information = dia_cassia_bevorlernen_info;
	permanent = TRUE;
	description = "M��e� m� n�co nau�it?";
};


func int dia_cassia_bevorlernen_condition()
{
	if((JOIN_THIEFS == TRUE) && Npc_KnowsInfo(other,dia_cassia_lernen) && ((CASSIA_TEACHPICKPOCKET == FALSE) || (CASSIA_TEACHDEX == FALSE)))
	{
		return TRUE;
	};
};

func void dia_cassia_bevorlernen_info()
{
	AI_Output(other,self,"DIA_Cassia_BevorLernen_15_00");	//M��e� m� n�co nau�it?
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_16_01");	//Jasn�, ��dn� probl�m. Prost� mi dej v�d�t, a� bude� p�ipraven.
		CASSIA_TEACHPICKPOCKET = TRUE;
		CASSIA_TEACHDEX = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_16_02");	//Jasn�. Kaps��stv� a obratnost t� bude ka�d� st�t 100 zlat�ch.
		Info_ClearChoices(dia_cassia_bevorlernen);
		Info_AddChoice(dia_cassia_bevorlernen,"Mo�n� pozd�ji... (ZP�T)",dia_cassia_bevorlernen_spaeter);
		if(CASSIA_TEACHPICKPOCKET == FALSE)
		{
			Info_AddChoice(dia_cassia_bevorlernen,"Cht�l bych se nau�it kaps��sk�mu um�n� (zaplatit 100 zla��k�).",dia_cassia_bevorlernen_pickpocket);
		};
		if(CASSIA_TEACHDEX == FALSE)
		{
			Info_AddChoice(dia_cassia_bevorlernen,"Chci se st�t obratn�j��m (zaplatit 100 zla��k�).",dia_cassia_bevorlernen_dex);
		};
	};
};

func void dia_cassia_bevorlernen_spaeter()
{
	Info_ClearChoices(dia_cassia_bevorlernen);
};

func void dia_cassia_bevorlernen_dex()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(other,self,"DIA_Cassia_BevorLernen_DEX_15_00");	//Chci dos�hnout v�t�� obratnosti. Tady je zlato.
		AI_Output(self,other,"DIA_Cassia_BevorLernen_DEX_16_01");	//M��eme za��t hned, jak bude� p�ipraven.
		CASSIA_TEACHDEX = TRUE;
		Info_ClearChoices(dia_cassia_bevorlernen);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_DIA_Cassia_BevorLernen_DEX_16_02");	//Vra� se, a� bude� m�t zlato.
		Info_ClearChoices(dia_cassia_bevorlernen);
	};
};

func void dia_cassia_bevorlernen_pickpocket()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(other,self,"DIA_Cassia_BevorLernen_Pickpocket_15_00");	//Chci se dozv�d�t n�co o kaps��stv�. Tady je zlato.
		AI_Output(self,other,"DIA_Cassia_BevorLernen_Pickpocket_16_01");	//M��eme za��t hned, jak bude� p�ipraven.
		CASSIA_TEACHPICKPOCKET = TRUE;
		Info_ClearChoices(dia_cassia_bevorlernen);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_Pickpocket_16_02");	//Vra� se, a� bude� m�t zlato.
		Info_ClearChoices(dia_cassia_bevorlernen);
	};
};


instance DIA_CASSIA_TEACH(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 12;
	condition = dia_cassia_teach_condition;
	information = dia_cassia_teach_info;
	permanent = TRUE;
	description = "Cht�l bych b�t o n�co obratn�j��.";
};


func int dia_cassia_teach_condition()
{
	if(CASSIA_TEACHDEX == TRUE)
	{
		return TRUE;
	};
};

func void dia_cassia_teach_info()
{
	AI_Output(other,self,"DIA_Cassia_TEACH_15_00");	//Cht�l bych b�t o n�co obratn�j��.
	Info_ClearChoices(dia_cassia_teach);
	Info_AddChoice(dia_cassia_teach,DIALOG_BACK,dia_cassia_teach_back);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_cassia_teach_1);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_cassia_teach_5);
};

func void dia_cassia_teach_back()
{
	Info_ClearChoices(dia_cassia_teach);
};

func void dia_cassia_teach_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(dia_cassia_teach);
	Info_AddChoice(dia_cassia_teach,DIALOG_BACK,dia_cassia_teach_back);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_cassia_teach_1);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_cassia_teach_5);
};

func void dia_cassia_teach_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(dia_cassia_teach);
	Info_AddChoice(dia_cassia_teach,DIALOG_BACK,dia_cassia_teach_back);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_cassia_teach_1);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_cassia_teach_5);
};


instance DIA_CASSIA_PICKPOCKET(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 10;
	condition = dia_cassia_pickpocket_condition;
	information = dia_cassia_pickpocket_info;
	permanent = TRUE;
	description = "Uka� mi, jak vyb�rat kapsy. (10 LP)";
};


func int dia_cassia_pickpocket_condition()
{
	if((CASSIA_TEACHPICKPOCKET == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_pickpocket_info()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_15_00");	//Uka� mi, jak se vyb�raj� kapsy.
	if(b_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
	{
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_01");	//Jestli chce� n�komu vypr�zdnit kapsy, rozptyl ho. Prost� si s n�m za�ni pov�dat, ho�te �e�.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_02");	//Zat�mco na n�j mluv�, po��dn� si ho odhadni. V��mej si nacpan�ch kapes, �perk� nebo ko�en�ch �em�nk� kolem krku. A hlavn� si hl�dej, jak moc je ten chl�pek v��mav�.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_03");	//Obrat nalit�ho n�den�ka nen� to sam� jako okr�st ostra�it�ho obchodn�ka, m�j to na pam�ti.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_04");	//Kdy� bude� neohraban�, tak samoz�ejm� bude �uchat zradu. Tak hlavn� kl�dek.
	};
};


instance DIA_CASSIA_AUFNAHME(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_aufnahme_condition;
	information = dia_cassia_aufnahme_info;
	permanent = FALSE;
	description = "Dostal jsem Constantin�v prsten.";
};


func int dia_cassia_aufnahme_condition()
{
	if((MIS_CASSIARING == LOG_RUNNING) && (Npc_HasItems(other,itri_prot_point_01_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_cassia_aufnahme_info()
{
	AI_Output(other,self,"DIA_Cassia_Aufnahme_15_00");	//Dostal jsem Constantin�v prsten.
	b_giveinvitems(other,self,itri_prot_point_01_mis,1);
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_01");	//Gratuluju. Pro�el jsi vstupn� zkou�kou. Te� jsi opravdu jedn�m z n�s.
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_02");	//Vezmi si tenhle kl��. Je od dve�� od hotelu. (�sm�v) Tak nebude� muset poka�d� plavat.
	b_giveinvitems(self,other,itke_thiefguildkey_hotel_mis,1);
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_03");	//Taky bys m�l v�d�t, �e m�me tajn� znamen�. Zvl�tn� k�vnut�.
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_04");	//P�esn�. Kdy� bude� mluvit s t�m prav�m �lov�kem a ud�l� tenhle posunek, bude v�d�t, �e jsi jedn�m z n�s.
	MIS_CASSIARING = LOG_SUCCESS;
	b_giveplayerxp(XP_CASSIARING);
	KNOWS_SECRETSIGN = TRUE;
	Log_CreateTopic(TOPIC_DIEBESGILDE,LOG_NOTE);
	b_logentry(TOPIC_DIEBESGILDE,"Byj jsem p�ijat do zlod�jsk�ho cechu.");
	b_logentry(TOPIC_DIEBESGILDE,"Nau�il jsem se zlod�jsk� sign�l - kdy� jej uk�u t�m spr�vn�m lidem, poznaj�, �e jsem jedn�m z nich.");
};


instance DIA_CASSIA_VERSTECK(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_versteck_condition;
	information = dia_cassia_versteck_info;
	permanent = FALSE;
	description = "Tak kde ukr�v�te svou ko�ist?";
};


func int dia_cassia_versteck_condition()
{
	if((MIS_CASSIARING == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_ramirez_beute))
	{
		return TRUE;
	};
};

func void dia_cassia_versteck_info()
{
	AI_Output(other,self,"DIA_Cassia_Versteck_15_00");	//Tak kde ukr�v�te svou ko�ist?
	AI_Output(self,other,"DIA_Cassia_Versteck_16_01");	//Hele, snad si v�n� nemysl�, �e ti tohle �eknu?
	AI_Output(self,other,"DIA_Cassia_Versteck_16_02");	//Bude� m�t dost p��le�itost�, aby sis u�il sv� vlastn� ko�isti. Pamatuj - kdo je moc nenasytn�, skon�� s pr�zdn�ma rukama.
};


instance DIA_CASSIA_BLUTKELCHE(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_blutkelche_condition;
	information = dia_cassia_blutkelche_info;
	permanent = FALSE;
	description = "M� pro m� pr�ci?";
};


func int dia_cassia_blutkelche_condition()
{
	if((MIS_CASSIARING == LOG_SUCCESS) && (MIS_CASSIAKELCHE != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_cassia_blutkelche_info()
{
	AI_Output(other,self,"DIA_Cassia_Blutkelche_15_00");	//M� pro m� pr�ci?
	if(PETZCOUNTER_CITY_THEFT > 0)
	{
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_01");	//Ne do t� doby, co t� ve m�st� budou zn�t jako zlod�je.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_02");	//Nejd��v uklidni situaci - zapla� pokutu nebo se zbav sv�dk�, je mi to jedno. Prost� to n�jak vy�e�.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_03");	//Ano. Je tady sada kalich�. Je jich �est.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_04");	//Kr�l Rhobar je z�skal na jedn� ze sv�ch v�le�n�ch v�prav -  ale ob�toval mnoho mu�� na to, aby si je mohl odv�zt. Proto se jim ��k� Krvav� kalichy.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_05");	//��dn� z t�ch kalich� nem� s�m o sob� velkou cenu - ale v�ech �est pohromad� p�edstavuje cel� jm�n�.
		AI_Output(other,self,"DIA_Cassia_Blutkelche_15_06");	//Kde jsou ty kalichy?
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_07");	//Jsou tady, ve m�st� - pat�� bohat�m obchodn�k�m z horn� �tvrti.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_08");	//P�ines mi je. J� se zat�m pokus�m sehnat na n� kupce.
		AI_Output(other,self,"DIA_Cassia_Blutkelche_15_09");	//Co z toho budu m�t?
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_10");	//Bu� polovinu zisku, nebo si m��e� vz�t jeden zaj�mav� p�edm�t z m� ko�isti.
		MIS_CASSIAKELCHE = LOG_RUNNING;
		Log_CreateTopic(TOPIC_CASSIAKELCHE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CASSIAKELCHE,LOG_RUNNING);
		b_logentry(TOPIC_CASSIAKELCHE,"Cassia m� po��dala, abych j� p�inesl �est krvav�ch kalich�. Nejsp� je v�echny najdu kdesi ve m�st�.");
	};
};


instance DIA_CASSIA_ABGEBEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_abgeben_condition;
	information = dia_cassia_abgeben_info;
	permanent = TRUE;
	description = "O Krvav�ch kalich�ch...";
};


func int dia_cassia_abgeben_condition()
{
	if(MIS_CASSIAKELCHE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_cassia_abgeben_info()
{
	AI_Output(other,self,"DIA_Cassia_abgeben_15_00");	//O Krvav�ch kalich�ch...
	if(b_giveinvitems(other,self,itmi_bloodcup_mis,6))
	{
		AI_Output(other,self,"DIA_Cassia_abgeben_15_01");	//M�m v�ech �est kalich�.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_02");	//Dobr� pr�ce. J� jsem zat�m na�el kupce.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_03");	//M��e� hned vz�t svou odm�nu. D�k, �es to pro m� ud�lal.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_04");	//U� pro tebe nem�m nic na pr�ci - ale m��e� se ode m� kdykoli n��emu nau�it. A nav�c, na tomhle ostrov� je toho dost, co jen �ek�, a� si to n�kdo vezme. (usm�v� se)
		MIS_CASSIAKELCHE = LOG_SUCCESS;
		b_giveplayerxp(XP_CASSIABLUTKELCHE);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_abgeben_16_05");	//M��u ty kalichy prodat jen jako sadu. P�ines mi je v�echny.
	};
};


instance DIA_CASSIA_BELOHNUNG(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_belohnung_condition;
	information = dia_cassia_belohnung_info;
	permanent = FALSE;
	description = "P�i�el jsem si pro svoji odm�nu.";
};


func int dia_cassia_belohnung_condition()
{
	if(MIS_CASSIAKELCHE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_cassia_belohnung_info()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_00");	//P�i�el jsem si pro svoji odm�nu.
	AI_Output(self,other,"DIA_Cassia_Belohnung_16_01");	//Co sis vybral?
	Info_ClearChoices(dia_cassia_belohnung);
	Info_AddChoice(dia_cassia_belohnung,"400 zla��k�.",dia_cassia_belohnung_gold);
	Info_AddChoice(dia_cassia_belohnung,"4 elix�ry hojiv� s�ly",dia_cassia_belohnung_trank);
	Info_AddChoice(dia_cassia_belohnung,NAME_ADDON_CASSIASBELOHNUNGSRING,dia_cassia_belohnung_ring);
};

func void dia_cassia_belohnung_gold()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_02");	//Dej mi zlato.
	b_giveinvitems(self,other,itmi_gold,400);
	Info_ClearChoices(dia_cassia_belohnung);
};

func void dia_cassia_belohnung_trank()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_03");	//Dej mi lektvary.
	b_giveinvitems(self,other,itpo_health_03,4);
	Info_ClearChoices(dia_cassia_belohnung);
};

func void dia_cassia_belohnung_ring()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_04");	//Dej mi prsten.
	b_giveinvitems(self,other,itri_hp_01,1);
	Info_ClearChoices(dia_cassia_belohnung);
};

