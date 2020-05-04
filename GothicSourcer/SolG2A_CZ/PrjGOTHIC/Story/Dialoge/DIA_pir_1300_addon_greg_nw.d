
instance DIA_ADDON_GREG_NW_EXIT(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 999;
	condition = dia_addon_greg_nw_exit_condition;
	information = dia_addon_greg_nw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_greg_nw_exit_condition()
{
	return TRUE;
};

func void dia_addon_greg_nw_exit_info()
{
	AI_StopProcessInfos(self);
	PLAYERTALKEDTOGREGNW = TRUE;
};


instance DIA_ADDON_GREG_NW_HALLO(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_hallo_condition;
	information = dia_addon_greg_nw_hallo_info;
	important = TRUE;
};


func int dia_addon_greg_nw_hallo_condition()
{
	if(GREGLOCATION == GREG_FARM1)
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_hallo_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_00");	//Ssst. Hej ty. Poj� sem na chvilku.
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_15_01");	//Co se d�je?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_02");	//Na cest� do m�sta? Na d�le�it�m �kolu?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_03");	//(slizce) Poslouchej. Vypad� jako chytr� chlapec. Vsad�m se, �e se v �ivot� dostane� daleko.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_04");	//Ned� se lehce oblbnout. M��u mluvit p��mo.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_05");	//Necht�l by sis vyd�lat n�jak� pen�ze?
	PLAYERTALKEDTOGREGNW = TRUE;
	SC_MEETSGREGTIME = 1;
	Info_ClearChoices(dia_addon_greg_nw_hallo);
	Info_AddChoice(dia_addon_greg_nw_hallo,"Mus�m j�t.",dia_addon_greg_nw_hallo_weg);
	Info_AddChoice(dia_addon_greg_nw_hallo,"P�esta� ku�kat. �ekni mi co chce�.",dia_addon_greg_nw_hallo_schleim);
	Info_AddChoice(dia_addon_greg_nw_hallo,"Nevypad�, �e bys m�l zlato.",dia_addon_greg_nw_hallo_vorsicht);
	Info_AddChoice(dia_addon_greg_nw_hallo,"Skr�v� se n�komu?",dia_addon_greg_nw_hallo_hide);
	Info_AddChoice(dia_addon_greg_nw_hallo,"Pro� ne?",dia_addon_greg_nw_hallo_ja);
};

func void dia_addon_greg_nw_hallo_weg()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_weg_15_00");	//Mus�m j�t.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_weg_01_01");	//(na�tvan�) Tak�e mi nechce� pomoci. Budu si to pamatovat k�mo. Uvid�me se znova.
	AI_StopProcessInfos(self);
	MIS_ADDON_GREG_BRINGMETOTHECITY = LOG_FAILED;
};

func void dia_addon_greg_nw_hallo_ja()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_ja_15_00");	//Pro� ne?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_01");	//Mus� prominout star�mu nevzd�lan�mu mo�sk�mu vlkovi. Jsem tu nov� a nezn�m z�kony t�hle zem�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_02");	//Ho�ce jsem zjistil, �e cestuj�c� z daleka nejsou v tomto m�st� v�t�ni.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_03");	//(�alostn�) Te� jsem ale �pn� ztracen� a nem��u se dostat do m�sta.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_04");	//Mus�m se z��astnit velice d�le�it�ho obchodu a moji spole�n�ci nep�ijmou odlo�en� dob�e, jestli v�, co t�m mysl�m.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_05");	//Mohl bys mi pomoci dostat se p�es tyhle m�stsk� str�e?
	Info_ClearChoices(dia_addon_greg_nw_hallo);
	Log_CreateTopic(TOPIC_ADDON_GREG_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_GREG_NW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_GREG_NW,"Podivn� chlap s kl�pcem na oku se chce dostat do m�sta. P�edpokl�d�m, �e bych ho m�l dostat p�es m�stsk� str�e.");
	MIS_ADDON_GREG_BRINGMETOTHECITY = LOG_RUNNING;
};

func void dia_addon_greg_nw_hallo_vorsicht()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_vorsicht_15_00");	//Nevypad�, �e by jsi m�l zlato.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_01");	//(skromn�) J� nem�m takov� znamosti, jako m� sir jako ty.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_02");	//Jist� neodm�tne� men�� p��sp�vek, k tv�mu zna�n�mu bohatstv�, �e ne?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_03");	//Dobr�, �ekni mi! M��u se na tebe spol�hnout?
};

func void dia_addon_greg_nw_hallo_schleim()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_schleim_15_00");	//P�esta� ku�kat. �ekni mi, co chce�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_01");	//Vid�, to je p�esn� to, co m�m na mysli.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_02");	//P�r fantaskn�ch slov ti nepom��e.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_03");	//V�d�l jsem hned, �e to p�jde. Obchoduji zde s tuh�m obchodn�kem.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_04");	//Kdy� jsi tak podnikav�, mus� se zaj�mat o vyd�l�n� trocha pra�ul� do tv� pen�enky.
};

func void dia_addon_greg_nw_hallo_hide()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_hide_15_00");	//Schov�v� se n�komu?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_hide_01_01");	//Nikdy. To je sm�n�. Opravdu r�d se schov�v�m za stromy, aby mi v�tr nefoukal p��mo do obli�eje.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_hide_01_02");	//Tak co to m� b�t? Chce� pr�ci?
};


instance DIA_ADDON_GREG_NW_STADTWACHEN(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_stadtwachen_condition;
	information = dia_addon_greg_nw_stadtwachen_info;
	permanent = TRUE;
	description = "O m�stsk�ch str��ch ...";
};


func int dia_addon_greg_nw_stadtwachen_condition()
{
	if((MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_RUNNING) && (GREGLOCATION == GREG_FARM1))
	{
		return TRUE;
	};
};


var int dia_addon_greg_nw_stadtwachen_choiceclose_geld;
var int dia_addon_greg_nw_stadtwachen_choiceclose_schein;
var int dia_addon_greg_nw_stadtwachen_choiceclose_constantino;

func void dia_addon_greg_nw_stadtwachen_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_15_00");	//O m�stsk�ch str��ch ...
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_01_01");	//Ano. M� n�pad?
	Info_ClearChoices(dia_addon_greg_nw_stadtwachen);
	Info_AddChoice(dia_addon_greg_nw_stadtwachen,"Mus�m si to promyslet.",dia_addon_greg_nw_stadtwachen_nochnicht);
	if(DIA_ADDON_GREG_NW_STADTWACHEN_CHOICECLOSE_GELD == FALSE)
	{
		Info_AddChoice(dia_addon_greg_nw_stadtwachen,"Co takhle zkusit mal� �platek?",dia_addon_greg_nw_stadtwachen_geld);
	};
	if((DIA_ADDON_GREG_NW_STADTWACHEN_CHOICECLOSE_SCHEIN == FALSE) && Npc_HasItems(other,itwr_passierschein))
	{
		Info_AddChoice(dia_addon_greg_nw_stadtwachen,"M�m propustku do m�sta.",dia_addon_greg_nw_stadtwachen_schein);
	};
	if((MIS_ADDON_LESTER_PICKFORCONSTANTINO != 0) && (DIA_ADDON_GREG_NW_STADTWACHEN_CHOICECLOSE_CONSTANTINO == FALSE))
	{
		Info_AddChoice(dia_addon_greg_nw_stadtwachen,"Sb�ra�i bylinek jsou vpu�t�ni.",dia_addon_greg_nw_stadtwachen_constantino);
	};
	if(Npc_HasItems(other,itar_bau_l) || Npc_HasItems(other,itar_bau_m))
	{
		Info_AddChoice(dia_addon_greg_nw_stadtwachen,"S t�mhle farm��sk�m od�vem t� pust� do m�sta.",dia_addon_greg_nw_stadtwachen_klamotten);
	};
};

func void dia_addon_greg_nw_stadtwachen_klamotten()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_00");	//S t�mhle farm��sk�m oble�en�m t� pust� dovnit�.
	if(Npc_HasItems(other,itar_bau_l))
	{
		b_giveinvitems(other,self,itar_bau_l,1);
	}
	else
	{
		b_giveinvitems(other,self,itar_bau_m,1);
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_01");	//To je p�esn� to, co pot�ebuju. Chlape, v�d�l jsem, �e s tebou m��u po��tat.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_02");	//(�kleb� se) V p�evle�en� za zdej��ho venkovsk�ho bal�ka se na m� nikdo dvakr�t nepod�v�. Ha ha!
	if(Npc_HasItems(self,itar_bau_l))
	{
		AI_EquipArmor(self,itar_bau_l);
	}
	else
	{
		AI_EquipArmor(self,itar_bau_m);
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_03");	//Super. Vymyslel si to dob�e. Tady je odm�na, kterou jsem sl�bil.
	CreateInvItems(self,itmi_gold,50);
	b_giveinvitems(self,other,itmi_gold,50);
	b_giveplayerxp(XP_GREG_NW_GIVEBAUARMOR);
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_04");	//(nespokojen�) Co to ...? 50 mizern�ch zla��k�? Chce� m� podv�st.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_05");	//(blahosklonn�) Zlato nen� v�echno p��teli. Bu� ��asten s t�mto pro tuhle chv�li.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_06");	//M�m takov� pocit, �e se brzy znovu setk�me.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_07");	//A kdo v�? Mo�n� budu v�c p�ipraven�. M�j se.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Markt");
	b_logentry(TOPIC_ADDON_GREG_NW,"Dal jsem mu farm��sk� oble�en�. M��e se dostat p�es str�e v p�estrojen�.");
	MIS_ADDON_GREG_BRINGMETOTHECITY = LOG_SUCCESS;
};

func void dia_addon_greg_nw_stadtwachen_nochnicht()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_nochnicht_15_00");	//Mus�m o tom pop�em��let.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_nochnicht_01_01");	//Tak se stane. Ale a� ti to netrv� p��li� dlouho. Nem��u ztratit dal�� �as.
	AI_StopProcessInfos(self);
};

func void dia_addon_greg_nw_stadtwachen_schein()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_Schein_15_00");	//M�m propustku do m�sta.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_Schein_01_01");	//(cynicky) Jasn�. Budu se tv��it, �e jsem obyvatel tohodle poctiv�ho m�sta, m�l bych?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_Schein_01_02");	//(pohor�en�) Pod�vej se na m� po��dn� chlap�e. Tady nen� slep� �ebr�k, m��u je takhle podv�st?
	DIA_ADDON_GREG_NW_STADTWACHEN_CHOICECLOSE_SCHEIN = TRUE;
};

func void dia_addon_greg_nw_stadtwachen_constantino()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_constantino_15_00");	//Sb�ra�i bylinek jsou vpu�t�ni.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_constantino_01_01");	//(na�tvan�) Co? Vypad�m, jako kdy� si vykra�uju po lese a sb�r�m ky�i�ky?
	DIA_ADDON_GREG_NW_STADTWACHEN_CHOICECLOSE_CONSTANTINO = TRUE;
};

func void dia_addon_greg_nw_stadtwachen_geld()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_geld_15_00");	//Co takhle mal� �platek?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_geld_01_01");	//(rozmarn�) Ano, jestli to bude fungovat, m�l bych to j�t zkusit.
	DIA_ADDON_GREG_NW_STADTWACHEN_CHOICECLOSE_GELD = TRUE;
};


instance DIA_ADDON_GREG_NW_PERM(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_perm_condition;
	information = dia_addon_greg_nw_perm_info;
	permanent = TRUE;
	description = "Je�t� jedna v�c ...";
};


func int dia_addon_greg_nw_perm_condition()
{
	if(((MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_SUCCESS) || (MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_FAILED)) && (GREGLOCATION == GREG_FARM1))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_PERM_15_00");	//Je�t� jedna v�c ...
	AI_Output(self,other,"DIA_Addon_Greg_NW_PERM_01_01");	//(arogantn�) Poslouchej synu. Mus�m se te� postarat o d�le�it� obchod.
	AI_Output(self,other,"DIA_Addon_Greg_NW_PERM_01_02");	//(v�hru�n�) Pokec�me pozd�ji. Pochopils?
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_NW_MEETGREGSECONDTIME(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_meetgregsecondtime_condition;
	information = dia_addon_greg_nw_meetgregsecondtime_info;
	important = TRUE;
};


func int dia_addon_greg_nw_meetgregsecondtime_condition()
{
	if(GREGLOCATION == GREG_TAVERNE)
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_meetgregsecondtime_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_00");	//Pod�vejme koho n�m ko�ka p�it�hla.
	if(MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_01");	//Venkovsk�ho kluka.
	}
	else if(MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_02");	//Bl�zen, kter� se rozhodnul m� odm�tnout. Ne�ekal jsi, �e m� uvid� znova, �e?
	}
	else if(MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_03");	//(nevrle) Myslel jsem, �e m� chce� pomoci. A co jsi ud�lal? Prost� odprejsknul.
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_04");	//Myslel jsi, �e jsem tam uv�zl nav�dy, eh?
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_05");	//Tady to m�. Pomo� si s�m, proto�e nikdo nepom��e. Znovu se z toho tak lehce nevyvl�kne�, chytnu t� te� za slovo.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_06");	//Tak to je, prost� pot�ebuju n�koho, jako tebe..
	SC_SAWGREGINTAVERNE = TRUE;
};


instance DIA_ADDON_GREG_NW_WER(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_wer_condition;
	information = dia_addon_greg_nw_wer_info;
	description = "A kdo vlastn� jsi?";
};


func int dia_addon_greg_nw_wer_condition()
{
	if(GREGLOCATION >= GREG_TAVERNE)
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_wer_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_wer_15_00");	//A kdo vlastn� jsi?
	AI_Output(self,other,"DIA_Addon_Greg_NW_wer_01_01");	//To nen� tvoje v�c.
	AI_Output(self,other,"DIA_Addon_Greg_NW_wer_01_02");	//Kdybych ti cht�l ��ct, kdo jsem, byl bych s t�m rychle hotov�, jasn�?
};


instance DIA_ADDON_GREG_NW_WAS(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_was_condition;
	information = dia_addon_greg_nw_was_info;
	description = "Co ode m� chce�?";
};


func int dia_addon_greg_nw_was_condition()
{
	if(GREGLOCATION == GREG_TAVERNE)
	{
		return TRUE;
	};
};

func void b_greg_search_dexter()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_00");	//Hled�m partnera. Nemohl jsem ho naj�t nikde ve m�st�, a tihle hlup�ci beztak nic nev�d�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_01");	//Je huben�, �ernovlas� a nos� �erven� brn�n�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_02");	//Mysl�m, �e byl v�ze� ve star� kolonii. Mysl�m, �e jeho jm�no za��n� na "D".
	Log_CreateTopic(TOPIC_ADDON_GREG_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_GREG_NW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_GREG_NW,"Mu� se z�platou na oku hled� n�koho, jeho� jm�no za��n� na 'D'.");
	SC_KNOWSGREGSSEARCHSDEXTER = TRUE;
};

func void dia_addon_greg_nw_was_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_15_00");	//Co ode mn� chce�?
	if(MIS_ADDON_GREG_BRINGMETOTHECITY != 0)
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_was_15_01");	//St�le m� probl�my s m�stkou str��?
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_01_02");	//(�to�n�) M��u ti ud�lat probl�m v minut� ty pitom�e.
	};
	b_greg_search_dexter();
	Info_ClearChoices(dia_addon_greg_nw_was);
	Info_AddChoice(dia_addon_greg_nw_was,"Mluv� o Diegovi?",dia_addon_greg_nw_was_diego);
	if((BDT13_DEXTER_VERRATEN == TRUE) || (RANGER_SCKNOWSDEXTER == TRUE))
	{
		Info_AddChoice(dia_addon_greg_nw_was,"M��e to b�t Dexter?",dia_addon_greg_nw_was_dexter);
	};
	Info_AddChoice(dia_addon_greg_nw_was,"Nezn�m nikoho, kdo by odpov�dal tv�mu popisu.",dia_addon_greg_nw_was_no);
};

func void dia_addon_greg_nw_was_gregunsicher()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_GregUnsicher_01_00");	//To m��e b�t jeho jm�no, nejsem si jist�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_GregUnsicher_01_01");	//Mus�m pravd�podobn� po�kat, dokud nebudu st�t p�ed n�m.
};

func void dia_addon_greg_nw_was_unnun()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_UnNun_15_00");	//Je�t� n�co?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_UnNun_01_01");	//(kysele) Jasn� ty hlup�ku. Je�t� n�co.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_UnNun_01_02");	//Pot�ebuju zbran�. Pot�ebuju zaji�t�n�. Ani zlato nebude na �kodu.
	Info_ClearChoices(dia_addon_greg_nw_was);
	Info_AddChoice(dia_addon_greg_nw_was,"Nem��u ti s t�m pomoct.",dia_addon_greg_nw_was_nohelp);
	Info_AddChoice(dia_addon_greg_nw_was,"Obstar�n�? Jsi v hospod�!",dia_addon_greg_nw_was_orlan);
	Info_AddChoice(dia_addon_greg_nw_was,"Zbran�? �old�ci maj� zbran�.",dia_addon_greg_nw_was_sld);
	Info_AddChoice(dia_addon_greg_nw_was,"Tady je 10 zla��k�.",dia_addon_greg_nw_was_hiergold);
	Info_AddChoice(dia_addon_greg_nw_was,"Nebyli ve m�st� ��dn� obchodn�ci se zbran�mi?",dia_addon_greg_nw_was_waffenhaendler);
	Info_AddChoice(dia_addon_greg_nw_was,"Zlato? V�ichni chceme zlato.",dia_addon_greg_nw_was_gold);
};

func void dia_addon_greg_nw_was_nohelp()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_NoHelp_15_00");	//Nem��u ti s t�m pomoci.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_01");	//(rozloben�) Je to tak? Ty JENOM nechce�.
	if((MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_RUNNING) || (MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_FAILED))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_02");	//To je podruh�, co m� nech�v� na holi�k�ch.
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_03");	//D�m ti radu. Ujisti se, �e se nepotk�me znovu.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_04");	//Zapamatuji si to. M��e� s t�m po��tat.
	};
	MIS_ADDON_GREG_RAKECAVE = LOG_OBSOLETE;
	GREGLOCATION = GREG_BIGCROSS;
	AI_StopProcessInfos(self);
	AI_UseMob(self,"BENCH",-1);
	Npc_ExchangeRoutine(self,"Bigcross");
	b_startotherroutine(bau_974_bauer,"Start");
};

func void dia_addon_greg_nw_was_gold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Gold_15_00");	//Zlato? V�ichni chceme zlato.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_01");	//Mo�n�. A co s n�m ud�l�? Promrh� ho na pit� a dole v bordelu.
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Gold_15_02");	//A ty m� lep�� pl�n, �e?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_03");	//(na�tvan�) Bude� se plazit pod sk�lou, pokud bude� v�d�t o v�cech, co jsem ud�lal ve sv�m �ivot�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_04");	//Nebu� tak blb�, nebo ti budu muset zav��t hubu.
};

func void dia_addon_greg_nw_was_waffenhaendler()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Waffenhaendler_15_00");	//Ve m�st� nebyl ��dn� obchodn�k se zbran�mi?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Waffenhaendler_01_01");	//Ty mus� vtipkovat, �e? V�e co maj� je haramp�d�.
};

func void dia_addon_greg_nw_was_hiergold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_HierGold_15_00");	//Tady je 10 zla��k�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_01");	//(sm�je se) Ty ne��astn�ku. Nech si svoji almu�nu. M�m lep�� n�pad.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_02");	//Nedaleko je jeskyn�! U� jsem tam byl a schoval jsem n�jakou sadu na jednotliv�ch m�stech.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_03");	//Jeskyn� je pro mne samotn�ho trochu nebezpe�n�. Mus� mi pomoci.
	Log_CreateTopic(TOPIC_ADDON_GREG_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_GREG_NW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_GREG_NW,"Nab�dnul jsem mu�i se z�platou na oku trochu zlata, ale necht�l ho. Chce, abych ho n�sledoval do jeho jeskyn�.");
	MIS_ADDON_GREG_RAKECAVE = LOG_RUNNING;
	Info_ClearChoices(dia_addon_greg_nw_was);
};

func void dia_addon_greg_nw_was_sld()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_SLD_15_00");	//Zbran�? �old�ci maj� zbran�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_01");	//Zaj�mav�. Sly�el jsem, �e Onar, velkostatk��, naj�m� �old�ky.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_02");	//(sm�je se) To nen� �patn� na suchozemskou krysu.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_03");	//To nen� �patn� n�pad. Mo�n� bych jim m�l zaplatit za prohl�dku.
};

func void dia_addon_greg_nw_was_orlan()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Orlan_15_00");	//Obstar�n�? Jsi v hospod�!
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Orlan_01_01");	//Ten uhozen� hospodsk� t� nenech� ani na nic mrknout, dokud mu nezaplat�.
};

func void dia_addon_greg_nw_was_no()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_no_15_00");	//Zn�m n�koho, kdo by odpov�dal tv�mu popisu.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_no_01_01");	//M�l bych to v�d�t.
	dia_addon_greg_nw_was_unnun();
};

func void dia_addon_greg_nw_was_diego()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Diego_15_00");	//Mluv� o Diegovi.
	dia_addon_greg_nw_was_gregunsicher();
	dia_addon_greg_nw_was_unnun();
};

func void dia_addon_greg_nw_was_dexter()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Dexter_15_00");	//M��e b�t jeho jm�no Dexter?
	dia_addon_greg_nw_was_gregunsicher();
	dia_addon_greg_nw_was_unnun();
};


instance DIA_ADDON_GREG_NW_RAKECAVELOS(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_rakecavelos_condition;
	information = dia_addon_greg_nw_rakecavelos_info;
	description = "Poj�me do t� jeskyn�.";
};


func int dia_addon_greg_nw_rakecavelos_condition()
{
	if((MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREGLOCATION >= GREG_TAVERNE) && (GREGLOCATION < GREG_DEXTER))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_rakecavelos_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCaveLos_15_00");	//Poj�me do t� jeskyn�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveLos_01_01");	//Jdeme.
	AI_StopProcessInfos(self);
	AI_UseMob(self,"BENCH",-1);
	Npc_ExchangeRoutine(self,"RakeCave");
};

func void b_greg_gonow()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_03");	//(komanduje) Na co �ek�? Jdi dovnit� a z�skej m� cetky.
};


instance DIA_ADDON_GREG_NW_RAKECAVETHERE(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_rakecavethere_condition;
	information = dia_addon_greg_nw_rakecavethere_info;
	important = TRUE;
};


func int dia_addon_greg_nw_rakecavethere_condition()
{
	if((MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREGLOCATION >= GREG_TAVERNE) && (GREGLOCATION < GREG_DEXTER) && (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_rakecavethere_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_00");	//Tady p��teli. To je ta jeskyn�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_01");	//Tady m� krump��.
	b_giveinvitems(self,other,itmw_2h_axe_l_01,1);
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_02");	//Zahrabal jsem to tam n�kde. M�sto jsem ozna�il k��em.
	b_greg_gonow();
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCaveThere_15_04");	//A co ty?
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_05");	//N�kdo ti mus� hl�dat z�da. Te� je to na tob�.
	Log_CreateTopic(TOPIC_ADDON_GREG_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_GREG_NW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_GREG_NW,"Ten chlap chce, abych se v jeskyni porozhl�dl po jeho v�cech. Zahrabal je a m�sto ozna�il k��em. Tak� mi dal krump��.");
	MIS_ADDON_GREG_RAKECAVE_DAY = Wld_GetDay();
};


instance DIA_ADDON_GREG_NW_RAKECAVEPLUNDERED(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_rakecaveplundered_condition;
	information = dia_addon_greg_nw_rakecaveplundered_info;
	important = TRUE;
};


func int dia_addon_greg_nw_rakecaveplundered_condition()
{
	if(((MIS_ADDON_GREG_RAKECAVE_DAY <= (Wld_GetDay() - 2)) || (RAKEPLACE[1] == TRUE)) && (MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREGLOCATION >= GREG_TAVERNE) && (GREGLOCATION < GREG_DEXTER) && (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_rakecaveplundered_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_01_00");	//Co ti tak trvalo? Na�el jsi n�co?
	if(RAKEPLACE[1] == TRUE)
	{
		Info_AddChoice(dia_addon_greg_nw_rakecaveplundered,"Ano. Vykopal jsem tam s��ek se zlatem.",dia_addon_greg_nw_rakecaveplundered_gold);
	};
	Info_AddChoice(dia_addon_greg_nw_rakecaveplundered,"Ne.",dia_addon_greg_nw_rakecaveplundered_no);
};

func void dia_addon_greg_nw_rakecaveplundered_no()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_No_15_00");	//Ne.
	if(RAKEPLACE[1] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_01");	//D�l� si srandu?
		AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_No_15_02");	//(p�edst�r�) Tam OPRAVDU nic nebylo.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_03");	//Zatracen�. V�d�l jsem to. Tihle chl�pci m� za to znovu zbu��.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_04");	//Tak dobr�. To nevad�, nic se ned�je,prcku. Mus�m na cestu. Uvid�me se pozd�ji.
	AI_StopProcessInfos(self);
	GREGLOCATION = GREG_BIGCROSS;
	Npc_ExchangeRoutine(self,"Bigcross");
	b_startotherroutine(bau_974_bauer,"Start");
};


var int b_greg_rakeplacebriefing_onetime;

func void b_greg_rakeplacebriefing()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_00");	//Dobr�. Na mal�m jeze�e se dv�ma vodop�dy je ostr�vek. Tam by m�l b�t ukryt� dal��.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_01");	//D�le naho�e na pastvin� jsou dal�� dv� m�sta, kde jsem n�co ukryl.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_02");	//Jeden flek je tam za farmou a druh� je bl�zko vchodu do �dol� u vodop�d�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_03");	//Jsou tam schody vedouc� dol� z pol� horn�ho farm��e k Onarovi.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_04");	//V roklin� na dn� schod� je dal�� flek.
	if(b_greg_rakeplacebriefing_onetime == FALSE)
	{
		b_logentry(TOPIC_ADDON_GREG_NW,"Jsou tady dal�� poklady. 1) Na ostr�vku v jeze�e s dv�ma vodop�dy. 2) Naho�e na pastvin� za farmou. 3) Vedle vchodu do pr�smyku u vodop�d�. 4) V kotlin� pod schody. Vedou z n�horn� pastviny, k jednomu z velk�ch farm���. Mus�m jeho sadu dostat nazp�tek. Bude �ekat na k�i�ovatce mezi poli.");
		b_greg_rakeplacebriefing_onetime = TRUE;
	};
};

func void dia_addon_greg_nw_rakecaveplundered_gold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_00");	//Ano. Vykopal jsem tam s��ek se zlatem.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_01");	//(chamtiv�) Dej mi to.
	if(Npc_HasItems(other,itse_goldpocket25) || (Npc_HasItems(other,itmi_gold) >= 25))
	{
		if(b_giveinvitems(other,self,itse_goldpocket25,1))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_02");	//Tady m�.
		}
		else if(b_giveinvitems(other,self,itmi_gold,25))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_03");	//Uvnit� bylo 25 zla��k�, tady je m�.
		};
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_04");	//Dobr�, to znamen�, �e tu st�le jsou.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_05");	//Vypad� to, �e jsi nakonec k n��emu dobr�.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_06");	//Dobr�, poslouchej. Ukryl jsem toho v�c. A ty to pro m� z�sk�.
		b_greg_rakeplacebriefing();
		GREG_SUCHWEITER = TRUE;
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_07");	//Po�k�m na tebe na k��ovatce mezi poli toho velk�ho farm��e. Nezklam m�. Mohl bys toho litovat, jasn�?
		AI_StopProcessInfos(self);
		GREGLOCATION = GREG_BIGCROSS;
		Npc_ExchangeRoutine(self,"Bigcross");
		b_giveplayerxp(XP_ADDON_RAKECAVEPLUNDERED);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_08");	//U� to nem�m.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_09");	//Nech toho. Nebo to m�m z tebe vyt��skat?
		AI_StopProcessInfos(self);
		MIS_ADDON_GREG_RAKECAVE = LOG_FAILED;
		GREGLOCATION = GREG_BIGCROSS;
		Npc_ExchangeRoutine(self,"Bigcross");
		b_attack(self,other,AR_NONE,1);
	};
};


instance DIA_ADDON_GREG_NW_LAKECAVE(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 100;
	condition = dia_addon_greg_nw_lakecave_condition;
	information = dia_addon_greg_nw_lakecave_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_greg_nw_lakecave_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREGLOCATION >= GREG_TAVERNE) && (GREGLOCATION < GREG_DEXTER) && (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000) && (GREG_SUCHWEITER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_lakecave_info()
{
	b_greg_gonow();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_NW_WHERETREASURES(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 10;
	condition = dia_addon_greg_nw_wheretreasures_condition;
	information = dia_addon_greg_nw_wheretreasures_info;
	permanent = TRUE;
	description = "Kde�e p�esn� jsi ty v�ci ukryl?";
};


func int dia_addon_greg_nw_wheretreasures_condition()
{
	if((MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREG_SUCHWEITER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_wheretreasures_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WhereTreasures_15_00");	//Kde�e p�esn� jsi ty v�ci ukryl?
	b_greg_rakeplacebriefing();
};


instance DIA_ADDON_GREG_NW_PERMTAVERNE(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 99;
	condition = dia_addon_greg_nw_permtaverne_condition;
	information = dia_addon_greg_nw_permtaverne_info;
	permanent = TRUE;
	description = "Je�t� jedna v�c ...";
};


func int dia_addon_greg_nw_permtaverne_condition()
{
	if(((GREGLOCATION == GREG_BIGCROSS) && (Npc_KnowsInfo(other,dia_addon_greg_nw_bigcross) == FALSE) && (((Npc_GetDistToWP(self,"BIGCROSS") < 1000) == FALSE) || (MIS_ADDON_GREG_RAKECAVE == LOG_SUCCESS))) || ((GREGLOCATION == GREG_DEXTER) && Npc_KnowsInfo(other,dia_addon_greg_nw_waswillstdu)))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_permtaverne_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_PermTaverne_15_00");	//Je�t� jedna v�c ...
	if((MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREG_SUCHWEITER == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_01");	//Nejd��v mus� z�skat moje ukryt� v�ci. Pak si m��eme promluvit o jin�ch v�cech.
	}
	else if(MIS_ADDON_GREG_RAKECAVE == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_02");	//Jsem ��astn�, �e jsi mi pomohl. To ale neznamen�, �e jsme te� p��tel�, ch�pe�?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_03");	//U� jsme kecali dost.
	};
};


instance DIA_ADDON_GREG_NW_BIGCROSS(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_bigcross_condition;
	information = dia_addon_greg_nw_bigcross_info;
	description = "V�echno v po��dku?";
};


func int dia_addon_greg_nw_bigcross_condition()
{
	if((GREGLOCATION == GREG_BIGCROSS) && (Npc_GetDistToWP(self,"BIGCROSS") < 1000))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_bigcross_info()
{
	if((MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_FAILED) || (MIS_ADDON_GREG_RAKECAVE == LOG_FAILED))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_00");	//Koho to tu m�me? Nespokojen�ho.
	};
	AI_Output(other,self,"DIA_Addon_Greg_NW_Bigcross_15_01");	//V�echno v po��dku?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_02");	//Ne doopravdy. �old�ci nebyli moc dobr� pomoc.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_03");	//Myslel jsem, �e budou m�t aspo� n�co.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_04");	//Ale kdy� se pt�, je to jen banda tupc� a kecal�.
	if((MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREG_SUCHWEITER == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_05");	//Tak jak pokra�uje hled�n� m�ch v�c�? U� jsi je na�el?
		if((RAKEPLACE[1] == FALSE) || (RAKEPLACE[2] == FALSE) || (RAKEPLACE[3] == FALSE) || (RAKEPLACE[4] == FALSE) || (RAKEPLACE[5] == FALSE))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_Bigcross_15_06");	//Ne, ne v�echny.
			AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_07");	//Tak jdi na to. Nem��e to b�t tak t�k�.
		};
	};
};


instance DIA_ADDON_GREG_NW_WHATWANTFROMSLD(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_whatwantfromsld_condition;
	information = dia_addon_greg_nw_whatwantfromsld_info;
	description = "Co jsi cht�l od �old�k�?";
};


func int dia_addon_greg_nw_whatwantfromsld_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_greg_nw_bigcross) && (GREGLOCATION == GREG_BIGCROSS) && (Npc_GetDistToWP(self,"BIGCROSS") < 1000))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_whatwantfromsld_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WhatWantFromSLD_15_00");	//Co jsi cht�l od �old�k�?
	if(SC_KNOWSGREGSSEARCHSDEXTER == FALSE)
	{
		b_greg_search_dexter();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_WhatWantFromSLD_01_01");	//V� co chci. Jdu po tom d�evorubci v �erven�m brn�n�.
		AI_Output(self,other,"DIA_Addon_Greg_NW_WhatWantFromSLD_01_02");	//Ale tihle idioti beztak nic nev�d�.
	};
};


instance DIA_ADDON_GREG_NW_DEXTERFOUND(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_dexterfound_condition;
	information = dia_addon_greg_nw_dexterfound_info;
	description = "Mysl�m, �e hled� chl�pka jm�nem Dexter.";
};


func int dia_addon_greg_nw_dexterfound_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_greg_nw_bigcross) && (GREGLOCATION == GREG_BIGCROSS) && ((BDT13_DEXTER_VERRATEN == TRUE) || (RANGER_SCKNOWSDEXTER == TRUE)))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_dexterfound_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_15_00");	//Mysl�m, �e hled� chl�pka jm�nem Dexter.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_01_01");	//Zatracen�. Nev�m, jak se jmenuje.
	Info_ClearChoices(dia_addon_greg_nw_dexterfound);
	Info_AddChoice(dia_addon_greg_nw_dexterfound,"Jenom mysl�m, �e jsem m�l.",dia_addon_greg_nw_dexterfound_weg);
	Info_AddChoice(dia_addon_greg_nw_dexterfound,"Co takhle, kdyby jsme tam �li spole�n�?",dia_addon_greg_nw_dexterfound_together);
	Info_AddChoice(dia_addon_greg_nw_dexterfound,"V�m, kde ho m��e� naj�t.",dia_addon_greg_nw_dexterfound_wo);
};

func void dia_addon_greg_nw_dexterfound_weg()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_weg_15_00");	//Mysl�m, �e j� jo.
	Info_ClearChoices(dia_addon_greg_nw_dexterfound);
};

func void dia_addon_greg_nw_dexterfound_wo()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_00");	//V�m, kde ho m��e� naj�t.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_01");	//(p�ekvapen�) Opravdu? MLUV!
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_02");	//Nedaleko odtud.
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_03");	//Vypad� to, �e je v�dcem hnusn� bandy bandit�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_04");	//(sarkasticky se sm�je) HAHA. Ano. To je on.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_05");	//Ved�l jsem, �e je tady n�kde zalezl�. Ten star� d�evorubec.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_06");	//V�e co mus�m ud�lat, je mrknout se do krys�ch pelech� a �pinav�ch d�r v okol�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_07");	//Te� ten prase�� mor najdu. U� nepot�ebuji tvoji pomoc.
	Info_ClearChoices(dia_addon_greg_nw_dexterfound);
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_addon_greg_nw_dexterfound_together()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_together_15_00");	//Co kdyby jsme tam �li spole�n�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_together_01_01");	//Jdu ho vykostit. To m��u ud�lat s�m.
};


instance DIA_ADDON_GREG_NW_CAUGHTDEXTER(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_caughtdexter_condition;
	information = dia_addon_greg_nw_caughtdexter_info;
	important = TRUE;
};


func int dia_addon_greg_nw_caughtdexter_condition()
{
	if((GREGLOCATION == GREG_DEXTER) && (Npc_IsDead(dexter) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_caughtdexter_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter_01_00");	//(�ve) Kde je to prase?
	AI_Output(other,self,"DIA_Addon_Greg_NW_CaughtDexter_15_01");	//Kdo? Kapit�n? Je tady.
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter_01_02");	//(�ve) Tak mi uhni z cesty.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DexterHouseRun");
};


instance DIA_ADDON_GREG_NW_WODENNNU(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_wodennnu_condition;
	information = dia_addon_greg_nw_wodennnu_info;
	important = TRUE;
};


func int dia_addon_greg_nw_wodennnu_condition()
{
	if((GREGLOCATION == GREG_DEXTER) && (Npc_IsDead(dexter) == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_HUT_10") < 500))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_wodennnu_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_WodennNu_01_00");	//(kysele) Kam p�jde te�?
	AI_Output(other,self,"DIA_Addon_Greg_NW_WodennNu_15_01");	//Byl tady.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WodennNu_01_02");	//(komanduje) Tak jdi a najdi ho!
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_NW_CAUGHTDEXTER2(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_caughtdexter2_condition;
	information = dia_addon_greg_nw_caughtdexter2_info;
	important = TRUE;
};


func int dia_addon_greg_nw_caughtdexter2_condition()
{
	if((GREGLOCATION == GREG_DEXTER) && Npc_IsDead(dexter))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_caughtdexter2_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter2_01_00");	//Dobr�. Dexter je pry�, he?
	AI_Output(other,self,"DIA_Addon_Greg_NW_CaughtDexter2_15_01");	//Vypad� to, �e je mrtv�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter2_01_02");	//Bylo na �ase. Zkontroluj, jestli n�co nem�.
	Npc_ExchangeRoutine(self,"DexterHouseWalk");
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_GREG_NW_RAVENSLETTER(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_ravensletter_condition;
	information = dia_addon_greg_nw_ravensletter_info;
	description = "Dexter m�l u sebe jenom tenhle dopis.";
};


func int dia_addon_greg_nw_ravensletter_condition()
{
	if((GREGLOCATION == GREG_DEXTER) && Npc_KnowsInfo(other,dia_addon_greg_nw_caughtdexter2) && Npc_HasItems(other,itwr_ravenskidnappermission_addon) && Npc_IsDead(dexter))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_ravensletter_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_00");	//Dexter m�l jenom tenhle dopis.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_01");	//Uka�.
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_02");	//�, zatracen�. To mi stejn� moc nepom��e.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_03");	//Nem�li jsme ho nechat odej�t jen tak rychle.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_04");	//Pot�ebuji v�d�t, jak n�kdo m��e p�ej�t hory na severo-v�chod� Khorinisu.
	if((nefarius_nw.aivar[AIV_TALKEDTOPLAYER] == TRUE) && (saturas_nw.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_05");	//Mo�n� skrz podzemn� tunel. M�gov� Vody studuj� port�l, kter� vede do hor na severo-v�chod�.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_06");	//(nevrle) Co to je za blbost?
		AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_07");	//(vysm�v� se) Hah. M�gov� Vody. Nem� lep�� pl�n, �e?
	};
	AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_08");	//Ne.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_09");	//(povzdech) Potom jsem tu uv�zl.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_10");	//Dexter byla moje posledn� nad�je.
};


instance DIA_ADDON_GREG_NW_WASWILLSTDU(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_waswillstdu_condition;
	information = dia_addon_greg_nw_waswillstdu_info;
	description = "Co jsi cht�l od Dextera?";
};


func int dia_addon_greg_nw_waswillstdu_condition()
{
	if((GREGLOCATION == GREG_DEXTER) && Npc_KnowsInfo(other,dia_addon_greg_nw_ravensletter))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_waswillstdu_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_15_00");	//Co jsi cht�l od Dextera?
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_01_01");	//P�i�el jsem z m�st za horami na severo-v�chod� ostrova. A m�m v �myslu se tam vr�tit.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_01_02");	//Doufal jsem, �e ten dareb�k zn� cestu bez lodi.
	Npc_ExchangeRoutine(self,"DexterThrone");
	Info_ClearChoices(dia_addon_greg_nw_waswillstdu);
	Info_AddChoice(dia_addon_greg_nw_waswillstdu,"Co je na druh� stran� hor?",dia_addon_greg_nw_waswillstdu_da);
	if(skip_nw.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		Info_AddChoice(dia_addon_greg_nw_waswillstdu,"Vid�l jsem pir�ta jm�nem Skip nedaleko p��stavu.",dia_addon_greg_nw_waswillstdu_skip);
	};
};

func void dia_addon_greg_nw_waswillstdu_da()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_da_15_00");	//Co je na druh� stran� hor??
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_da_01_01");	//M��u ti doporu�it snad jen to, abys tam nechodil.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_da_01_02");	//Je to tvrd� m�sto. Slaboch jako ty by tam dlouho nep�e�il.
};

func void dia_addon_greg_nw_waswillstdu_skip()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_Skip_15_00");	//Vid�l jsem pir�ta jm�nem Skip nedaleko p��stavu.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_Skip_01_01");	//Ten idiot. �ekal jsem tam 3 dny. Pro� p�ijel a� te�?
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_Skip_01_02");	//Hned jak se mi vr�t� s�la, dostane co proto.
	SC_KNOWSCONNECTIONSKIPGREG = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_GREG_NW_FOUNDTREASURE(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_foundtreasure_condition;
	information = dia_addon_greg_nw_foundtreasure_info;
	permanent = TRUE;
	description = "Na�el jsem tvoji zahrabanou soupravu.";
};


func int dia_addon_greg_nw_foundtreasure_condition()
{
	if((RAKEPLACE[1] == TRUE) && (RAKEPLACE[2] == TRUE) && (RAKEPLACE[3] == TRUE) && (RAKEPLACE[4] == TRUE) && (RAKEPLACE[5] == TRUE) && (MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREG_SUCHWEITER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_foundtreasure_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_15_00");	//Na�el jsem tvoji zahrabanou soupravu.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_01_01");	//M�l bys m�t 100 zla��k�, zlat� kalich, st��brnou v�zu a amulet u sebe. Je to moje. Dej mi je.
	Info_ClearChoices(dia_addon_greg_nw_foundtreasure);
	Info_AddChoice(dia_addon_greg_nw_foundtreasure,"Nem�m to te� sebou.",dia_addon_greg_nw_foundtreasure_not);
	if((Npc_HasItems(other,itse_goldpocket100) || (Npc_HasItems(other,itmi_gold) >= 100)) && Npc_HasItems(other,itmi_goldcup) && Npc_HasItems(other,itmi_silverchalice) && Npc_HasItems(other,itam_prot_point_01))
	{
		Info_AddChoice(dia_addon_greg_nw_foundtreasure,"Tady jsou tv� v�ci.",dia_addon_greg_nw_foundtreasure_ja);
	};
};

func void dia_addon_greg_nw_foundtreasure_ja()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_00");	//Tady jsou tv� v�ci.
	if(b_giveinvitems(other,self,itse_goldpocket100,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_01");	//V��ek se 100 zla��ky.
	}
	else if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_02");	//100 zla��k�.
	};
	if(b_giveinvitems(other,self,itmi_goldcup,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_03");	//Zlat� kalich.
	};
	if(b_giveinvitems(other,self,itmi_silverchalice,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_04");	//St��brn� m�sa.
	};
	if(b_giveinvitems(other,self,itam_prot_point_01,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_05");	//Amulet.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_ja_01_06");	//Velmi dob�e. M� ��est�, �e nejsi dostate�n� blb�, abys s t�m utekl.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_ja_01_07");	//Tady m� d�l na ko�isti.
	b_giveinvitems(self,other,itmi_gold,30);
	Info_ClearChoices(dia_addon_greg_nw_foundtreasure);
	MIS_ADDON_GREG_RAKECAVE = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_GREG_RAKECAVE);
};

func void dia_addon_greg_nw_foundtreasure_not()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_not_15_00");	//Nem�m to sebou.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_not_01_01");	//Tak ty v�ci z�skej, nebo se rozlob�m.
	AI_StopProcessInfos(self);
};

