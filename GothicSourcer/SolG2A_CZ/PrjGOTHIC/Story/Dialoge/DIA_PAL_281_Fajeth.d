
func int c_snapperdeath()
{
	if(Npc_IsDead(newmine_snapper1) && Npc_IsDead(newmine_snapper2) && Npc_IsDead(newmine_snapper3) && Npc_IsDead(newmine_snapper4) && Npc_IsDead(newmine_snapper5) && Npc_IsDead(newmine_snapper6) && Npc_IsDead(newmine_snapper7) && Npc_IsDead(newmine_snapper8))
	{
		return TRUE;
	};
};


instance DIA_FAJETH_EXIT(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 999;
	condition = dia_fajeth_exit_condition;
	information = dia_fajeth_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fajeth_exit_condition()
{
	return TRUE;
};

func void dia_fajeth_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FAJETH_FIRST(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 2;
	condition = dia_fajeth_first_condition;
	information = dia_fajeth_first_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_fajeth_first_condition()
{
	if(garond.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_fajeth_first_info()
{
	AI_Output(self,other,"DIA_Fajeth_First_12_00");	//Kdo jsi a co tady d�l�?
	AI_Output(other,self,"DIA_Fajeth_First_15_01");	//Jsem na cest� z rozkazu lorda Hagena.
	AI_Output(self,other,"DIA_Fajeth_First_12_02");	//V tom p��pad� by ses m�l pokusit dostat do hradu. Je tam velitel Garond. M� na povel celou na�i v�pravu.
	AI_StopProcessInfos(self);
};


instance DIA_FAJETH_HALLO(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 2;
	condition = dia_fajeth_hallo_condition;
	information = dia_fajeth_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_fajeth_hallo_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_fajeth_hallo_info()
{
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_00");	//Odkud jsi p�i�el?
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_01");	//P�ich�z�m jm�nem Garonda.
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_02");	//To je skv�l�. Dal�� mu�i se mi v�dycky hod�.
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_03");	//Nejsem zde proto, abych v�m pom�hal.
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_04");	//Ne? A pro� jsi tedy p�i�el?
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_05");	//M�m za �kol zjistit, kolik rudy jste u� vydolovali.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_06");	//Ctihodn� m�gu. Tvoje p��tomnost dod�v� mn� a m�m mu��m jistotu.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_07");	//Hodilo by se n�m, kdybys n�m n�jak pomohl prost�ednictv�m sv� s�ly darovan� Innosem.
		Info_AddChoice(dia_fajeth_hallo,"Co pro tebe m��u ud�lat?",dia_fajeth_hallo_tun);
		Info_AddChoice(dia_fajeth_hallo,"Moje posl�n� je d�le�it�j��.",dia_fajeth_hallo_kdfnein);
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_08");	//A m�m �kolem je ud�lat v�echno pro to, abych vyt�il co nejv�c rudy a ochr�nil ji.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_09");	//To zahrnuje i verbov�n� mu��. Jsi v Innosov�ch slu�b�ch - bude� tedy poslouchat m� rozkazy.
		Info_AddChoice(dia_fajeth_hallo,"Co pro tebe m��u ud�lat?",dia_fajeth_hallo_tun);
		Info_AddChoice(dia_fajeth_hallo,"U� sv� p��kazy m�m, od Garonda.",dia_fajeth_hallo_milnein);
	}
	else
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_10");	//Poslouchej - netu��m, pro� ke mn� Garond poslal �old�ka. Ale ur�it� k tomu musel m�t dobr� d�vod.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_11");	//Av�ak ne� ti d�m zpr�vu pro Garonda, n�co pro m� ud�l�.
		Info_AddChoice(dia_fajeth_hallo,"V�echno m� svou cenu.",dia_fajeth_hallo_sldja);
		Info_AddChoice(dia_fajeth_hallo,"Ne, nem�m �as...",dia_fajeth_hallo_sldnein);
	};
};

func void dia_fajeth_hallo_tun()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_Tun_15_00");	//Co pro tebe m��u ud�lat?
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_01");	//U� n�kolik dn� se kolem t�bora potuluje sme�ka ch�apavc�. Vypad� to, �e �ekaj� jen na ide�ln� p��le�itost k �toku.
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_02");	//Nikdo nev�, kdy k tomu dojde - ale dokud jsou tady, nebude v t�bo�e klid.
	if(Npc_IsDead(fed) == FALSE)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_03");	//Ten Fed, mimo jin�, je strachy �pln� bez sebe. Znepokojuje ostatn� odsouzence.
	};
	if(Npc_IsDead(bilgot) == FALSE)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_04");	//Tak koho m�m poslat? Bilgota? Ha - to je taky troska.
	};
	if(Npc_IsDead(tengron) == FALSE)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_05");	//A Tengron? Um� sice bojovat, ale moc se nevyzn�.
	};
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_06");	//Jsi tedy jedin�, kdo to dok�e. Chci, aby ses na ty bestie vydal a pobil je.
	Wld_InsertNpc(newmine_snapper7,"OW_PATH_333");
	Wld_InsertNpc(newmine_snapper8,"OW_PATH_333");
	Wld_InsertNpc(newmine_snapper3,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
	MIS_FAJETH_KILL_SNAPPER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_FAJETHKILLSNAPPER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FAJETHKILLSNAPPER,LOG_RUNNING);
	b_logentry(TOPIC_FAJETHKILLSNAPPER,"Fajeth mi vysv�tlil, jak ��inn� lovit ch�apavce, kte�� se u� p�r dn� potuluj� kolem t�bora.");
	Info_ClearChoices(dia_fajeth_hallo);
	PrintScreen("",-1,-1,FONT_SCREEN,0);
};

func void dia_fajeth_hallo_kdfnein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_KDFNein_15_00");	//M�m mnohem d�le�it�j�� �kol. Nem��u ti pomoci.
	AI_Output(self,other,"DIA_Fajeth_Hallo_KDFNein_12_01");	//Pochopiteln�, ctihodnosti. Pod�m ti v�echny informace, kter� bude� cht�t.
	MIS_FAJETH_KILL_SNAPPER = LOG_OBSOLETE;
	Info_ClearChoices(dia_fajeth_hallo);
};

func void dia_fajeth_hallo_milnein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_MILNein_15_00");	//U� sv� p��kazy m�m, od Garonda.
	AI_Output(self,other,"DIA_Fajeth_Hallo_MILNein_12_01");	//A tak� je spln�. Ale a� pot�, co t� propust�m.
	AI_Output(self,other,"DIA_Fajeth_Hallo_MILNein_12_02");	//Jedin�, co od tebe chci sly�et, je 'Co pro tebe m��u ud�lat?' Rozum�no?
};

func void dia_fajeth_hallo_sldja()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_SLDJa_15_00");	//V�echno m� svou cenu. Kdy� mi zaplat�, nech�m si to proj�t hlavou.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_01");	//Nejsem zvykl� dohadovat se se �old�ky. Nesn��m smlouv�n� o lep�� cenu.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_02");	//Ale pokud pro m� bude� pracovat, d�m ti na d�kaz sv� dobr� v�le 100 zlat�ch.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_03");	//Tak co, dohodnuto?
	FAJETH_PAY = TRUE;
	Info_ClearChoices(dia_fajeth_hallo);
	Info_AddChoice(dia_fajeth_hallo,"Co pro tebe m��u ud�lat?",dia_fajeth_hallo_tun);
	Info_AddChoice(dia_fajeth_hallo,"Ne, nem�m �as...",dia_fajeth_hallo_sldnein);
};

func void dia_fajeth_hallo_sldnein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_SLDNein_15_00");	//Ne, nem�m �as starat se o tvoje probl�my.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDNein_12_01");	//Odm�t� tak snadno vyd�lan� pen�ze? To bych od �old�ka nikdy ne�ekal.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDNein_12_02");	//Proto�e n�m nechce� pomoci, p�edpokl�d�m, �e bude� cht�t co nejrychleji z�skat odpov�di na sv� ot�zky a pak hned vypadne�.
	MIS_FAJETH_KILL_SNAPPER = LOG_OBSOLETE;
	Info_ClearChoices(dia_fajeth_hallo);
};


instance DIA_FAJETH_LEADER(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 2;
	condition = dia_fajeth_leader_condition;
	information = dia_fajeth_leader_info;
	permanent = FALSE;
	description = "Zabil jsem v�dce sme�ky.";
};


func int dia_fajeth_leader_condition()
{
	if(Npc_KnowsInfo(other,dia_bilgot_knowsleadsnapper) && Npc_IsDead(newmine_leadsnapper) && (MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_fajeth_leader_info()
{
	AI_Output(other,self,"DIA_Fajeth_Leader_15_00");	//Zabil jsem v�dce sme�ky.
	AI_Output(self,other,"DIA_Fajeth_Leader_12_01");	//Dobr�. Bez v�dce u� nejsou zdaleka tak nebezpe�n�. Mysl�m, �e u� na n�s neza�to��.
	if(FAJETH_PAY == TRUE)
	{
		AI_Output(self,other,"DIA_Fajeth_Leader_12_02");	//Tady jsou tv� pen�ze - jak jsme se domluvili.
		b_giveinvitems(self,other,itmi_gold,100);
	};
	fajeth.flags = 0;
	MIS_FAJETH_KILL_SNAPPER = LOG_SUCCESS;
	b_giveplayerxp(XP_FAJETHKILLSNAPPER);
};


instance DIA_FAJETH_SNAPPER_KILLED(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 9;
	condition = dia_fajeth_snapper_killed_condition;
	information = dia_fajeth_snapper_killed_info;
	permanent = TRUE;
	description = "S ch�apavci jsem skoncoval.";
};


func int dia_fajeth_snapper_killed_condition()
{
	if((MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING) && (c_snapperdeath() == TRUE))
	{
		return TRUE;
	};
};

func void dia_fajeth_snapper_killed_info()
{
	AI_Output(hero,self,"DIA_Fajeth_SNAPPER_KILLED_15_00");	//S ch�apavci jsem skoncoval.
	AI_Output(self,hero,"DIA_Fajeth_SNAPPER_KILLED_12_01");	//Dobr� pr�ce. O zbytek bychom u� m�li b�t schopni se postarat sami.
	if(FAJETH_PAY == TRUE)
	{
		AI_Output(self,hero,"DIA_Fajeth_SNAPPER_KILLED_12_02");	//Zaslou�il sis sv�j plat - tady m� 100 zlat�ch, jak jsme se domluvili.
		b_giveinvitems(self,other,itmi_gold,100);
	};
	fajeth.flags = 0;
	MIS_FAJETH_KILL_SNAPPER = LOG_SUCCESS;
	b_giveplayerxp(XP_FAJETHKILLSNAPPER);
};


instance DIA_FAJETH_RUNNING(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 9;
	condition = dia_fajeth_running_condition;
	information = dia_fajeth_running_info;
	permanent = TRUE;
	description = "Jak to vypad� s mor�lkou tv�ch mu��?";
};


func int dia_fajeth_running_condition()
{
	if(MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_fajeth_running_info()
{
	AI_Output(other,self,"DIA_Fajeth_Running_15_00");	//Jak to vypad� s mor�lkou tv�ch mu��?
	AI_Output(self,other,"DIA_Fajeth_Running_12_01");	//Chce� v�d�t, jak to vypad� s mor�lkou? Strachy sotva pracuj�!
	AI_Output(self,other,"DIA_Fajeth_Running_12_02");	//Postarej se o ty ch�apavce, jinak to �patn� dopadne!
};


instance DIA_FAJETH_BELOHNUNG(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 3;
	condition = dia_fajeth_belohnung_condition;
	information = dia_fajeth_belohnung_info;
	permanent = FALSE;
	description = "Pov�z mi, kolik rudy jste u� vydolovali.";
};


func int dia_fajeth_belohnung_condition()
{
	if((MIS_FAJETH_KILL_SNAPPER == LOG_SUCCESS) || (MIS_FAJETH_KILL_SNAPPER == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void dia_fajeth_belohnung_info()
{
	AI_Output(other,self,"DIA_Fajeth_BELOHNUNG_15_00");	//Pov�z mi, kolik rudy jste u� vydolovali.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_01");	//Nahlas Garondovi, �e zat�m se n�m poda�ilo z�skat jenom DV� bedny rudy.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_02");	//Kv�li neust�l�m n�jezd�m jsem u� p�i�el o spoustu mu��.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_03");	//Pokud by n�m Garond poslal v�ce mu��, m�li bychom rudy v�c.
	AI_Output(other,self,"DIA_Fajeth_BELOHNUNG_15_04");	//Jasn�. Vy��d�m mu to.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_05");	//Dobr�. Te� je to na tob�. Budeme dr�et pozice tak dlouho, jak to jen p�jde.
	FAJETH_ORE = TRUE;
	b_logentry(TOPIC_SCOUTMINE,"Fajethovi kop��i u� vydolovali DV� bedny rudy.");
	AI_StopProcessInfos(self);
};


instance DIA_FAJETH_PERM2(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 9;
	condition = dia_fajeth_perm2_condition;
	information = dia_fajeth_perm2_info;
	permanent = TRUE;
	description = "Jak to vypad� s dolov�n�m rudy?";
};


func int dia_fajeth_perm2_condition()
{
	if(Npc_KnowsInfo(other,dia_fajeth_belohnung) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_fajeth_perm2_info()
{
	AI_Output(other,self,"DIA_Fajeth_Perm2_15_00");	//Jak to vypad� s dolov�n�m rudy?
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_01");	//�patn�. V�bec to nejde.
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_02");	//Kdy� jsme p�ijeli, bylo to v po��dku - ale pak m� ho�i nedok�zali vydolovat nic ne� zbytky. Nic po��dn�ho.
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_03");	//Ale nevzd�v�me se - alespo� ne dokud tomu tady vel�m j�.
};


instance DIA_FAJETH_ERZABBAU(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 11;
	condition = dia_fajeth_erzabbau_condition;
	information = dia_fajeth_erzabbau_info;
	permanent = TRUE;
	description = "Jak to vypad� s t�bou?";
};


func int dia_fajeth_erzabbau_condition()
{
	if(Npc_KnowsInfo(other,dia_fajeth_belohnung) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_fajeth_erzabbau_info()
{
	AI_Output(other,self,"DIA_Fajeth_ERZABBAU_15_00");	//Jak to vypad� s t�bou?
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_01");	//N�jak se v�echno uklidnilo. ��m to je?
		AI_Output(other,self,"DIA_Fajeth_ERZABBAU_15_02");	//Draci jsou mrtv�.
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_03");	//No, v tom p��pad� douf�m, �e u� brzy bude po v�em. U� jsem si p�est�val d�lat nad�je.
	}
	else
	{
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_04");	//Vid� s�m. Nic moc.
	};
};


instance DIA_FAJETH_PICKPOCKET(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 900;
	condition = dia_fajeth_pickpocket_condition;
	information = dia_fajeth_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_fajeth_pickpocket_condition()
{
	return c_beklauen(56,95);
};

func void dia_fajeth_pickpocket_info()
{
	Info_ClearChoices(dia_fajeth_pickpocket);
	Info_AddChoice(dia_fajeth_pickpocket,DIALOG_BACK,dia_fajeth_pickpocket_back);
	Info_AddChoice(dia_fajeth_pickpocket,DIALOG_PICKPOCKET,dia_fajeth_pickpocket_doit);
};

func void dia_fajeth_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fajeth_pickpocket);
};

func void dia_fajeth_pickpocket_back()
{
	Info_ClearChoices(dia_fajeth_pickpocket);
};

