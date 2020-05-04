
instance DIA_JORA_EXIT(C_INFO)
{
	npc = vlk_408_jora;
	nr = 999;
	condition = dia_jora_exit_condition;
	information = dia_jora_exit_info;
	permanent = TRUE;
	description = "Mus�m j�t!";
};


func int dia_jora_exit_condition()
{
	return TRUE;
};

func void dia_jora_exit_info()
{
	if(((JORA_DIEB == LOG_FAILED) || (JORA_DIEB == LOG_SUCCESS)) && (JORA_GOLD == LOG_RUNNING))
	{
		AI_Output(self,other,"DIA_Jora_EXIT_08_00");	//Hej! A co moje prachy?
	};
	AI_StopProcessInfos(self);
};


instance DIA_JORA_SPERRE(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_sperre_condition;
	information = dia_jora_sperre_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_jora_sperre_condition()
{
	if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_jora_sperre_info()
{
	AI_Output(self,other,"DIA_Jora_Sperre_08_00");	//Jsi b�val� trestanec z d�ln� kolonie, nic ti neprod�m!
	AI_StopProcessInfos(self);
};


instance DIA_JORA_WAREZ(C_INFO)
{
	npc = vlk_408_jora;
	nr = 700;
	condition = dia_jora_warez_condition;
	information = dia_jora_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Uka� mi sv� zbo��.";
};


func int dia_jora_warez_condition()
{
	return TRUE;
};

func void dia_jora_warez_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Jora_WAREZ_15_00");	//Uka� mi sv� zbo��.
};


instance DIA_JORA_GREET(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_greet_condition;
	information = dia_jora_greet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jora_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CANTHAR_SPERRE == FALSE))
	{
		return TRUE;
	};
};

func void dia_jora_greet_info()
{
	AI_Output(self,other,"DIA_Jora_GREET_08_00");	//Innos t� prov�zej, cizin�e. Jestli si chce� po��dit dobrou cestovatelskou v�bavu, pak jsi na tom spr�vn�m m�st�.
	AI_Output(self,other,"DIA_Jora_GREET_08_01");	//Ale varuji t�: jestli m� v pl�nu si invent�� vylep�it n�jak pokoutn� bez placen�, zavol�m str�e!
	AI_Output(other,self,"DIA_Jora_GREET_15_02");	//Po�kej, copak vypad�m jako n�jak� chmat�k?
	AI_Output(self,other,"DIA_Jora_GREET_08_03");	//(pohrdav�) Pche! Dneska bys nebyl prvn�, kdo by se mi sna�il n�co �majznout.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Jora prod�v� na tr�i�ti v�echny mo�n� zbran�.");
};


instance DIA_JORA_BESTOHLEN(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_bestohlen_condition;
	information = dia_jora_bestohlen_info;
	permanent = FALSE;
	description = "N�kdo t� okradl?";
};


func int dia_jora_bestohlen_condition()
{
	return TRUE;
};

func void dia_jora_bestohlen_info()
{
	AI_Output(other,self,"DIA_Jora_Bestohlen_15_00");	//N�kdo t� okradl?
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_01");	//Nem��u to dok�zat, ten man�k byl zatracen� chytr�. P�edstavil se jako Rengaru - pokud to tedy je jeho skute�n� jm�no.
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_02");	//Posledn�ch p�r dn� jen tak zevloval na tr�i�ti.
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output(self,other,"DIA_Jora_Bestohlen_08_03");	//A ka�d� ve�er se p��mo na ulici nal�v� pivem. Vsad�m boty, �e ten �mejd chlast� za MOJE pen�ze!
	};
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_04");	//Jen jsem se na chvilku pod�val jinam a u� jsem byl bez portmonky!
};

func void b_jora_goldforclue()
{
	AI_Output(self,other,"DIA_Jora_Add_08_04");	//Posly� - jestli se ti povede z toho Rengaru vyt��skat moje prachy, pov�m ti v�echno, co v�m.
};


instance DIA_JORA_HOLDEINGOLD(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_holdeingold_condition;
	information = dia_jora_holdeingold_info;
	permanent = FALSE;
	description = "Mohl bych se pokusit z�skat zp�tky tvoje pen�ze.";
};


func int dia_jora_holdeingold_condition()
{
	if(Npc_KnowsInfo(other,dia_jora_bestohlen))
	{
		return TRUE;
	};
};

func void dia_jora_holdeingold_info()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_15_00");	//Mohl bych se pokusit z�skat zp�tky tvoje pen�ze.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_08_01");	//(ned�v��iv�) Fakt? A jak to chce� ud�lat?
	Info_ClearChoices(dia_jora_holdeingold);
	Info_AddChoice(dia_jora_holdeingold,"Ale za odm�nu chci ��st zlata!",dia_jora_holdeingold_willbelohnung);
	if(MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING)
	{
		Info_AddChoice(dia_jora_holdeingold,"R�d bych se dozv�d�l, jak se dostat do cechu zlod�j�.",dia_jora_holdeingold_ghdg);
	};
	if((other.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		Info_AddChoice(dia_jora_holdeingold,"P�ijde na to - m��u se s tvou pomoc� dostat do horn� �tvrti?",dia_jora_holdeingold_toov);
	};
};

func void dia_jora_holdeingold_toov()
{
	AI_Output(other,self,"DIA_Jora_Add_15_00");	//P�ijde na to - m��u se s tvou pomoc� dostat do horn� �tvrti?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_08_03");	//(sm�je se) To jsi na �patn� adrese, j� v�bec nejsem z m�sta - jako v�t�ina kupc� na tr�i�ti.
	AI_Output(self,other,"DIA_Jora_Add_08_01");	//Jestli se chce� dostat do horn� �tvrti, promluv si v doln� ��sti m�sta s n�kter�mi m�stn�mi obchodn�ky.
};

func void dia_jora_holdeingold_ghdg()
{
	AI_Output(other,self,"DIA_Jora_Add_15_02");	//R�d bych se dozv�d�l, jak se dostat do cechu zlod�j�.
	AI_Output(self,other,"DIA_Jora_Add_08_03");	//Mo�n�, �e ti mohu pomoci.
	b_jora_goldforclue();
	Info_ClearChoices(dia_jora_holdeingold);
	Info_AddChoice(dia_jora_holdeingold,"Uvid�m, co se d� d�lat.",dia_jora_holdeingold_doit);
	Info_AddChoice(dia_jora_holdeingold,"Kolik pen�z to bylo?",dia_jora_holdeingold_howmuch);
	Info_AddChoice(dia_jora_holdeingold,"Pro� jsi nezavolal str�e?",dia_jora_holdeingold_wache);
};

func void dia_jora_holdeingold_willbelohnung()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_WillBelohnung_15_00");	//Ale za odm�nu chci ��st zlata!
	AI_Output(self,other,"DIA_Jora_HolDeinGold_WillBelohnung_08_01");	//Nejd��v se postarej o to, aby mi vr�tili portmonku, a teprve PAK si promluv�me o odm�n�!
	Info_ClearChoices(dia_jora_holdeingold);
	Info_AddChoice(dia_jora_holdeingold,"Uvid�m, co se d� d�lat.",dia_jora_holdeingold_doit);
	Info_AddChoice(dia_jora_holdeingold,"Kolik pen�z to bylo?",dia_jora_holdeingold_howmuch);
	Info_AddChoice(dia_jora_holdeingold,"Pro� jsi nezavolal str�e?",dia_jora_holdeingold_wache);
};

func void dia_jora_holdeingold_wache()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_Wache_15_00");	//Pro� jsi nezavolal str�e?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_Wache_08_01");	//Str�e jsou n�co platn�, pouze pokud zlod�je p�istihne� p�i �inu.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_Wache_08_02");	//A kdy� jsem zjistil, �e jsem bez portmonky, ten parchant u� byl d�vno v prachu!
};

func void dia_jora_holdeingold_howmuch()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_HowMuch_15_00");	//Kolik pen�z to bylo?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_HowMuch_08_01");	//50 zla��k� - v t�hle mizern� dob� je to v�c ne� dost.
};

func void dia_jora_holdeingold_doit()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_DoIt_15_00");	//Uvid�m, co se d� d�lat.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_01");	//Dej si pozor. Jestli toho lotra jen tak zml�t�, vlo�� se do toho str�e.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_02");	//Posledn� dobou je to tu p�kn� drsn�. Od chv�le, co do m�sta p�ibyli paladinov�, str�e ka�d�ho rv��e bez milosti sejmou.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_03");	//Bude� si muset n�co vymyslet.
	AI_Output(other,self,"DIA_Jora_HolDeinGold_DoIt_15_04");	//Jasn�.
	JORA_DIEB = LOG_RUNNING;
	JORA_GOLD = LOG_RUNNING;
	Log_CreateTopic(TOPIC_JORADIEB,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JORADIEB,LOG_RUNNING);
	Log_CreateTopic(TOPIC_JORA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JORA,LOG_RUNNING);
	b_logentry(TOPIC_JORA,"Obchodn�ka Jora okradl chlap�k jm�nem Rengaru, kter� se p�es den potuluje po tr�i�ti.");
	b_logentry(TOPIC_JORA,"Mus�m Jorovi vr�tit ukraden� zlato.");
	b_logentry(TOPIC_JORADIEB,"Obchodn�ka Jora okradl chlap�k jm�nem Rengaru - jestli ho chyt�m, mo�n� z toho bude koukat i n�jak� odm�na.");
	Info_ClearChoices(dia_jora_holdeingold);
};


instance DIA_JORA_WEGENDIEB(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_wegendieb_condition;
	information = dia_jora_wegendieb_info;
	permanent = TRUE;
	description = "K tomu zlod�ji...";
};


func int dia_jora_wegendieb_condition()
{
	if(JORA_DIEB == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jora_wegendieb_info()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_15_00");	//K tomu zlod�ji...
	AI_Output(self,other,"DIA_Jora_WegenDieb_08_01");	//Tak jak to vypad�? Chytils ho, a co je d�le�it�j��, m� to moje zlato?
	Info_ClearChoices(dia_jora_wegendieb);
	if(Npc_IsDead(rengaru))
	{
		Info_AddChoice(dia_jora_wegendieb,"No, stala se mu takov� tragick� nehoda.",dia_jora_wegendieb_tot);
	}
	else if(RENGARU_INKNAST == TRUE)
	{
		Info_AddChoice(dia_jora_wegendieb,"U� jsem ho dostal. Je to v klidu.",dia_jora_wegendieb_imknast);
	}
	else if(Npc_KnowsInfo(other,dia_rengaru_hallodieb))
	{
		Info_AddChoice(dia_jora_wegendieb,"Utekl mi.",dia_jora_wegendieb_entkommen);
	};
	Info_AddChoice(dia_jora_wegendieb,"Je�t� st�le na tom pracuji.",dia_jora_wegendieb_continue);
};

func void dia_jora_wegendieb_continue()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Continue_15_00");	//Je�t� st�le na tom pracuji.
	AI_Output(self,other,"DIA_Jora_WegenDieb_Continue_08_01");	//Tak koukej, a� u� to zlato m�m zp�tky!
	Info_ClearChoices(dia_jora_wegendieb);
};

func void dia_jora_wegendieb_entkommen()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Entkommen_15_00");	//Utekl mi.
	AI_Output(self,other,"DIA_Jora_WegenDieb_Entkommen_08_01");	//A co moje zlato? To se taky ztratilo s n�m?
	JORA_DIEB = LOG_FAILED;
	b_checklog();
	Info_ClearChoices(dia_jora_wegendieb);
};

func void dia_jora_wegendieb_imknast()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_ImKnast_15_00");	//Ano, lapil jsem ho, jak se pat��. Te� bude chv�li bru�et v base.
	AI_Output(self,other,"DIA_Jora_WegenDieb_ImKnast_08_01");	//A co moje zlato?
	JORA_DIEB = LOG_SUCCESS;
	b_checklog();
	Info_ClearChoices(dia_jora_wegendieb);
};

func void dia_jora_wegendieb_tot()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Tot_15_00");	//No, stala se mu takov� tragick� nehoda...
	AI_Output(self,other,"DIA_Jora_WegenDieb_Tot_08_01");	//Aspo� u� nikomu nic neukradne. Innosova spravedlnost zv�t�zila!
	AI_Output(self,other,"DIA_Jora_WegenDieb_Tot_08_02");	//Kde je moje zlato?
	JORA_DIEB = LOG_SUCCESS;
	b_checklog();
	Info_ClearChoices(dia_jora_wegendieb);
};


instance DIA_JORA_BRINGGOLD(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_bringgold_condition;
	information = dia_jora_bringgold_info;
	permanent = TRUE;
	description = "Tady je t�ch 50 zla��k�, co ti ukradl.";
};


func int dia_jora_bringgold_condition()
{
	if(((JORA_DIEB == LOG_FAILED) || (JORA_DIEB == LOG_SUCCESS)) && (JORA_GOLD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_jora_bringgold_info()
{
	AI_Output(other,self,"DIA_Jora_BringGold_15_00");	//Tady je t�ch 50 zla��k�, co ti ukradl.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Jora_BringGold_08_01");	//Innos bu� pochv�len! Tak p�ece je tady ve m�st� je�t� n�jak� spravedlnost!
		JORA_GOLD = LOG_SUCCESS;
		b_giveplayerxp(XP_JORA_GOLD);
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_BringGold_08_03");	//Hej, tohle nen� 50 zla��k�! Sna�� se m� taky o�kubat, nebo co?
	};
};


var int jora_ghdghinweis;

instance DIA_JORA_GHDGINFO(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_ghdginfo_condition;
	information = dia_jora_ghdginfo_info;
	permanent = TRUE;
	description = "Co v� o cechu zlod�j�?";
};


func int dia_jora_ghdginfo_condition()
{
	if((MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING) && Npc_KnowsInfo(other,dia_jora_bestohlen) && (JORA_GHDGHINWEIS == FALSE))
	{
		return TRUE;
	};
};

func void dia_jora_ghdginfo_info()
{
	AI_Output(other,self,"DIA_Jora_Add_15_05");	//Co v� o cechu zlod�j�?
	if(JORA_GOLD != LOG_SUCCESS)
	{
		b_jora_goldforclue();
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_Add_08_06");	//No dob�e, tak poslouchej- ale jako bych ti nic ne�ekl, kapi�to?
		AI_Output(self,other,"DIA_Jora_Add_08_07");	//Do kr�my v doc�ch chod� p�r podez�el�ch t�pk�.
		AI_Output(self,other,"DIA_Jora_Add_08_08");	//Vsad�m se, �e i s�m kr�m�� jich n�kolik zn�.
		AI_Output(self,other,"DIA_Jora_Add_08_09");	//Jestli chce� vystopovat zlod�je, zkus si promluvit pr�v� s N�M.
		AI_Output(self,other,"DIA_Jora_Add_08_10");	//M��e� t�eba p�edst�rat, �e ses zapletl do n��eho nekal�ho. Na to by mohl nalet�t.
		AI_Output(self,other,"DIA_Jora_Add_08_11");	//Ale m�j p�itom o�i otev�en� - s t�mi lidmi si nen� radno zahr�vat.
		JORA_GHDGHINWEIS = TRUE;
	};
};


instance DIA_JORA_BELOHNUNG(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_belohnung_condition;
	information = dia_jora_belohnung_info;
	permanent = FALSE;
	description = "Ale za odm�nu chci ��st zlata!";
};


func int dia_jora_belohnung_condition()
{
	if(JORA_GOLD == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_jora_belohnung_info()
{
	AI_Output(other,self,"DIA_Jora_Belohnung_15_00");	//Ale za odm�nu chci ��st zlata!
	if(JORA_GHDGHINWEIS == TRUE)
	{
		AI_Output(self,other,"DIA_Jora_Add_08_12");	//Ale j� u� jsem ti dal cennou radu.
		AI_Output(self,other,"DIA_Jora_Add_08_13");	//Tohle by jako odm�na m�lo sta�it.
	};
	AI_Output(self,other,"DIA_Jora_Add_08_14");	//Jestli chce� zlato, tak vyp�trej zlod�je a pak si u lorda Andreho vyzvedni odm�nu.
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output(self,other,"DIA_Jora_Belohnung_08_03");	//Te� se mus�m zase v�novat z�kazn�k�m.
	};
	AI_StopProcessInfos(self);
};


instance DIA_JORA_ALRIKSSCHWERT(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_alriksschwert_condition;
	information = dia_jora_alriksschwert_info;
	permanent = FALSE;
	description = "Alrik tvrd�, �e m� jeho me�.";
};


func int dia_jora_alriksschwert_condition()
{
	if(MIS_ALRIK_SWORD == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jora_alriksschwert_info()
{
	AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_00");	//Alrik tvrd�, �e m� jeho me�.
	AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_01");	//Mysl� toho otrhance, co mi prodal svou zbra� za p�r pochodn� a kousk� masa?
	AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_02");	//Jo, to je on.
	if(Npc_HasItems(self,itmw_alrikssword_mis) > 0)
	{
		AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_03");	//Jeho me� po��d je�t� m�m.
		AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_04");	//A kolik za n�j bude� cht�t?
		if(JORA_GOLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_05");	//No, �e jsi to ty...
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_06");	//�le, v� co? Vem si ho zadarmo. Kdy� u� nic jin�ho, vr�tils mi moje pen�ze.
			b_giveinvitems(self,other,itmw_alrikssword_mis,1);
		}
		else
		{
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_07");	//No, �e jsi to ty - 50 zla��k�.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_08");	//(mrzut�) J� u� ho ale nem�m! �ert v�, kam se pod�l.
	};
};


instance DIA_JORA_BUYALRIKSSCHWERT(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_buyalriksschwert_condition;
	information = dia_jora_buyalriksschwert_info;
	permanent = TRUE;
	description = "Tady je 50 zla��k�, a te� mi dej Alrik�v me�.";
};


func int dia_jora_buyalriksschwert_condition()
{
	if(Npc_KnowsInfo(other,dia_jora_alriksschwert) && (Npc_HasItems(self,itmw_alrikssword_mis) > 0))
	{
		return TRUE;
	};
};

func void dia_jora_buyalriksschwert_info()
{
	AI_Output(other,self,"DIA_Jora_BUYAlriksSchwert_15_00");	//Tady je 50 zla��k�, a te� mi dej Alrik�v me�.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Jora_BUYAlriksSchwert_08_04");	//Tum� - (vychytrale) byl to dobr� obchod.
		b_giveinvitems(self,other,itmw_alrikssword_mis,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_BUYAlriksSchwert_08_05");	//Nem� sice dost zlata, ale to nevad� - n�jak� �as ti tu ten me� odlo��m. Tak�e se m��e� vr�tit pozd�ji.
	};
};


instance DIA_JORA_PICKPOCKET(C_INFO)
{
	npc = vlk_408_jora;
	nr = 900;
	condition = dia_jora_pickpocket_condition;
	information = dia_jora_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_jora_pickpocket_condition()
{
	return c_beklauen(31,45);
};

func void dia_jora_pickpocket_info()
{
	Info_ClearChoices(dia_jora_pickpocket);
	Info_AddChoice(dia_jora_pickpocket,DIALOG_BACK,dia_jora_pickpocket_back);
	Info_AddChoice(dia_jora_pickpocket,DIALOG_PICKPOCKET,dia_jora_pickpocket_doit);
};

func void dia_jora_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jora_pickpocket);
};

func void dia_jora_pickpocket_back()
{
	Info_ClearChoices(dia_jora_pickpocket);
};

