
var int urshak_sucked;

instance DIA_URSHAK_EXIT(C_INFO)
{
	npc = none_110_urshak;
	nr = 999;
	condition = dia_urshak_exit_condition;
	information = dia_urshak_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_urshak_exit_condition()
{
	return TRUE;
};

func void dia_urshak_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_URSHAK_HALLO(C_INFO)
{
	npc = none_110_urshak;
	nr = 5;
	condition = dia_urshak_hallo_condition;
	information = dia_urshak_hallo_info;
	important = TRUE;
};


func int dia_urshak_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_hallo_info()
{
	AI_Output(self,other,"DIA_Urshak_HALLO_18_00");	//(agresivn�) KHROTOK JABARTH!!!
	AI_Output(self,other,"DIA_Urshak_HALLO_18_01");	//Po�kej! J� t� zn�t. Ty p��tel �lov�k s m�kk� hlas.
	AI_Output(self,other,"DIA_Urshak_HALLO_18_02");	//P��tel zab�t zl� d�mon KRUSHAK.
	b_giveplayerxp(XP_URSHAKFOUND);
	Log_CreateTopic(TOPIC_URSHAK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_URSHAK,LOG_RUNNING);
	b_logentry(TOPIC_URSHAK,"Na�el jsem sv�ho star�ho sk�et�ho p��tele Ur-Shaka.");
	Info_ClearChoices(dia_urshak_hallo);
	Info_AddChoice(dia_urshak_hallo,"Co tady d�l�?",dia_urshak_hallo_freund);
	Info_AddChoice(dia_urshak_hallo,"Mluv�c� sk�et?",dia_urshak_hallo_wer);
};

func void dia_urshak_hallo_wer()
{
	AI_Output(other,self,"DIA_Urshak_HALLO_wer_15_00");	//Mluv�c� sk�et?
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_01");	//Ty zapomenout na Ur-Shak? To d�lat smutek.
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_02");	//Ur-Shak pomoct p��tel mnoho dn� p�ed t�m, ne� ULU-MULU umo�nit j�t do moje vesnice. Sk�eti si v�it p��tel a p��tel nezem��t rukou sk�eta.
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_03");	//P��tel pak j� do podzemn� sk�et� chr�m a zahnat zl� d�mon. P�ed mnoho dn�. Ty nepamatovat?
};

func void dia_urshak_hallo_freund()
{
	AI_Output(other,self,"DIA_Urshak_HALLO_freund_15_00");	//To sis teda vybral �as k setk�n�. M�lem jsem t� zabil. Co tady d�l�?
	AI_Output(self,other,"DIA_Urshak_HALLO_freund_18_01");	//Ur-Shak d�vat pozor na zemi a vid�t, co se st�t zemi a jeho lidem.
	Info_ClearChoices(dia_urshak_hallo);
};


instance DIA_URSHAK_WASMACHENORKS(C_INFO)
{
	npc = none_110_urshak;
	nr = 6;
	condition = dia_urshak_wasmachenorks_condition;
	information = dia_urshak_wasmachenorks_info;
	description = "Pro� sk�eti napadli lidi?";
};


func int dia_urshak_wasmachenorks_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_wasmachenorks_info()
{
	AI_Output(other,self,"DIA_Urshak_WASMACHENORKS_15_00");	//Pro� sk�eti napadli lidi?
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_01");	//Ur-Shak v�dycky ��kat sk�et�mu lidu, lid� ne zl� a mnoho dobr�ch p��tel mezi nima.
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_02");	//Ale �aman neposlouchat Ur-Shak. Ur-Shak po��d u sv�ho lidu v nemilost.
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_03");	//Tak Ur-Shak ne sly�et moc o velk� pl�n proti lidem.
	b_logentry(TOPIC_URSHAK,"Je�t� st�le nep�im�l sv�j lid, aby mu naslouchal. Po��d z�st�v� vyhnancem.");
};


instance DIA_URSHAK_SOVIELE(C_INFO)
{
	npc = none_110_urshak;
	nr = 7;
	condition = dia_urshak_soviele_condition;
	information = dia_urshak_soviele_info;
	description = "Jak to, �e je v�s tu najednou tolik?";
};


func int dia_urshak_soviele_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_soviele_info()
{
	AI_Output(other,self,"DIA_Urshak_SOVIELE_15_00");	//Jak to, �e je v�s tu najednou tolik?
	AI_Output(self,other,"DIA_Urshak_SOVIELE_18_01");	//Sk�eti p�ij�t z hor, ale dal�� p�iplout na lod�ch a postavit velk� palis�da.
};


instance DIA_URSHAK_ZAUN(C_INFO)
{
	npc = none_110_urshak;
	nr = 8;
	condition = dia_urshak_zaun_condition;
	information = dia_urshak_zaun_info;
	description = "Co je ukryto za tou dlouhou zd� na v�chod�?";
};


func int dia_urshak_zaun_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_zaun_info()
{
	AI_Output(other,self,"DIA_Urshak_ZAUN_15_00");	//Co je ukryto za tou dlouhou zd� na v�chod�?
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_01");	//Sk�eti v�dycky, kdy� v�lka, stav�t velk� palis�da a t�bor.
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_02");	//Palis�da dobr� pro v�lka. Ukr�v� s�la vojska a chr�n� sk�ety.
};


instance DIA_URSHAK_WASHASTDUVOR(C_INFO)
{
	npc = none_110_urshak;
	nr = 9;
	condition = dia_urshak_washastduvor_condition;
	information = dia_urshak_washastduvor_info;
	description = "Co bude� d�lat te�?";
};


func int dia_urshak_washastduvor_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_washastduvor_info()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_15_00");	//Co bude� d�lat te�?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_18_01");	//Ur-Shak �ekat, a� sk�et� zv�d vz�t Ur-Shak k Hosh-Pak.
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_15_02");	//Kdo je Hosh-Pak?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_18_03");	//Moc mocn� �aman. M�t velk� vliv na v�le�n�ky a d�lat pro sk�ety velk� pl�ny.
	b_logentry(TOPIC_URSHAK,"Ur-Shak m� v pl�nu setkat se se sk�et�m �amanem Hosh-Pakem a p�esv�d�it ho, aby ho p�ijal do rady mezi ostatn� �amany.");
	Info_ClearChoices(dia_urshak_washastduvor);
	Info_AddChoice(dia_urshak_washastduvor,DIALOG_BACK,dia_urshak_washastduvor_weiter);
	Info_AddChoice(dia_urshak_washastduvor,"Kde najdu toho Hosh-Paka?",dia_urshak_washastduvor_);
	Info_AddChoice(dia_urshak_washastduvor,"Tak pro� teda za n�m nejde�?",dia_urshak_washastduvor_hoshpak);
};

func void dia_urshak_washastduvor_hoshpak()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_hoshpak_15_00");	//Tak pro� teda za n�m nejde�?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_01");	//Ur-Shak zkou�et znovu a znovu z�skat �est a star� m�sto v �aman� rada.
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_02");	//Ale a� do te�, Hosh-Pak neposlouchat Ur-Shak. Sk�eti zab�t Ur-Shak, kdy� jeho vid�t bez zv�d. Ur-Shak muset mluvit s Hosh-Pak.
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_03");	//Mo�n� dneska �t�st�.
};

func void dia_urshak_washastduvor_()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_Urshak_15_00");	//Kde najdu toho Hosh-Paka?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_Urshak_18_01");	//Ut�bo�it se, kde vid�t sk�et� bojovn�ky p�es les u velk� sopka. Hosh-Pak tak moct ovl�dat v�le�n�ky.
};

func void dia_urshak_washastduvor_weiter()
{
	Info_ClearChoices(dia_urshak_washastduvor);
};


instance DIA_URSHAK_HOSHPAKDEAD(C_INFO)
{
	npc = none_110_urshak;
	nr = 9;
	condition = dia_urshak_hoshpakdead_condition;
	information = dia_urshak_hoshpakdead_info;
	description = "Hosh-Pak je mrtv�.";
};


func int dia_urshak_hoshpakdead_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_washastduvor) && Npc_IsDead(hosh_pak) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_hoshpakdead_info()
{
	AI_Output(other,self,"DIA_Urshak_HOSHPAKDEAD_15_00");	//Hosh-Pak je mrtv�.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_01");	//Hosh-Pak mrtv�? RUSHTASOK!
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_02");	//M� srdce t�k� jako k�men. Ur-Shak nikdy nezapomenout velk� sk�et, co ud�lat Ur-Shak �aman.
	AI_Output(other,self,"DIA_Urshak_HOSHPAKDEAD_15_03");	//Rozum�m, byl tv�m u�itelem.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_04");	//Ur-Shak te� muset zbavit z�rmutku, muset d�t Hosh-Pak posledn� ob�ad. Ur-Shak muset j�t.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_05");	//P��tel rad�j hned proj�t pr�smyk. Tady moc nebezpe�n�.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_06");	//Ur-Shak ��ct, kdy� p��tel �lov�k um��t.
	b_logentry(TOPIC_URSHAK,"Hosh-Pak je mrtev. M�j sk�et� p��tel nyn� m��� k jeho stanu a oplak�v� smrt sv�ho mentora. M�l bych ho nechat j�t.");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,20);
	Npc_ExchangeRoutine(self,"Start");
	Wld_InsertNpc(orcwarrior_rest,"FP_CAMPFIRE_HOSHPAK_01");
	Wld_InsertNpc(orcwarrior_rest,"FP_CAMPFIRE_HOSHPAK_02");
};


instance DIA_URSHAK_GEH(C_INFO)
{
	npc = none_110_urshak;
	condition = dia_urshak_geh_condition;
	information = dia_urshak_geh_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_urshak_geh_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hoshpakdead) && ((Npc_GetDistToWP(self,"OW_HOSHPAK_04") < 1000) == FALSE) && (Npc_RefuseTalk(self) == FALSE) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_geh_info()
{
	AI_Output(self,other,"DIA_Urshak_GEH_18_00");	//P��tel rad�j hned proj�t pr�smyk.
	Npc_SetRefuseTalk(self,10);
	AI_StopProcessInfos(self);
};


instance DIA_URSHAK_HOSHPAKRACHE(C_INFO)
{
	npc = none_110_urshak;
	condition = dia_urshak_hoshpakrache_condition;
	information = dia_urshak_hoshpakrache_info;
	important = TRUE;
};


func int dia_urshak_hoshpakrache_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hoshpakdead) && (Npc_GetDistToWP(self,"OW_HOSHPAK_04") <= 1000) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_hoshpakrache_info()
{
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_00");	//(agresivn�) KHROTOK ! J� zjistil, �e ty tady, kdy� Hosh-Pak mrtv�. Ty ud�lal velk� chyba, cizinec.
	AI_Output(other,self,"DIA_Urshak_HOSHPAKRACHE_15_01");	//J� v�d�t, ty bude� tady. Ty hr�l na m� haba��ra.
	AI_Output(other,self,"DIA_Urshak_HOSHPAKRACHE_15_02");	//Tv� pozice b�t v�c, ne� ty r�d p�ipustit. Te� ty neb�t nic, jen n�stroj zla.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_03");	//Cizinec m� pravda. Ur-Shaka te� napl�ovat jen nen�vist a chu� po pomsta.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_04");	//Ur-Shak vid� velk� chyba, �e v��it cizinci. Ur-Shak litovat, �e naz�vat �lov�ka p��tel a pom�hat mu, ne zab�jet.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_05");	//Cizinec nakonec opustit �dol� a proj�t pr�smyk. Ur-Shak nezab�t cizinec te�. �est �amana Ur-Shak velet nezab�jet.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_06");	//P��t� my potkat, my nep��tel�. Bude l�p ty te� odej�t.
	AI_StopProcessInfos(self);
	URSHAK_SUCKED = TRUE;
	b_logentry(TOPIC_URSHAK,"Ur-Shak byl p�ijat zp�tky do rady sk�et�ch �aman� a ocitl se tedy na stran� nep��tele. Rad�i bych se mu m�l vyh�bat, dokud se mi nepoda�� tu z�le�itost se sk�ety n�jak urovnat. To by ho m�lo uklidnit.");
	b_giveplayerxp(XP_URSHAKBECOMESSHAMAN);
};


instance DIA_URSHAK_KEINEWAHL(C_INFO)
{
	npc = none_110_urshak;
	condition = dia_urshak_keinewahl_condition;
	information = dia_urshak_keinewahl_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_urshak_keinewahl_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hoshpakrache) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_urshak_keinewahl_info()
{
	AI_Output(self,other,"DIA_Urshak_KEINEWAHL_18_00");	//Ty j�t. J� nemluvit s cizinci.
	AI_StopProcessInfos(self);
	URSHAK_SUCKED = TRUE;
};

