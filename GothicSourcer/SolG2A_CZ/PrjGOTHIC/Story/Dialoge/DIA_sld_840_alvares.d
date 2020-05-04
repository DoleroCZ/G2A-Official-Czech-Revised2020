
instance DIA_ALVARES_EXIT(C_INFO)
{
	npc = sld_840_alvares;
	nr = 999;
	condition = dia_alvares_exit_condition;
	information = dia_alvares_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_alvares_exit_condition()
{
	return TRUE;
};

func void dia_alvares_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ALVARES_HAUAB(C_INFO)
{
	npc = sld_840_alvares;
	nr = 4;
	condition = dia_alvares_hauab_condition;
	information = dia_alvares_hauab_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alvares_hauab_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_alvares_hauab_info()
{
	AKILS_SLDSTILLTHERE = TRUE;
	AI_Output(self,other,"DIA_Alvares_HAUAB_11_00");	//A� u� t� sem p�ivedlo cokoliv, rad�i na to zapome� a b� d�l.
	Log_CreateTopic(TOPIC_AKILSSLDSTILLTHERE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSSLDSTILLTHERE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"Akilovu farmu ohro�uj� �oldn��i.");
	AI_StopProcessInfos(self);
};


instance DIA_ALVARES_ATTACK(C_INFO)
{
	npc = sld_840_alvares;
	nr = 6;
	condition = dia_alvares_attack_condition;
	information = dia_alvares_attack_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alvares_attack_condition()
{
	if(Npc_KnowsInfo(other,dia_alvares_hauab) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_alvares_attack_info()
{
	AI_Output(self,other,"DIA_Alvares_ATTACK_11_00");	//Hej, tys je�t� tady? Dal jsem ti na v�b�r, cizin�e: bu� vypadni, nebo chc�pni.
	Info_ClearChoices(dia_alvares_attack);
	Info_AddChoice(dia_alvares_attack,"Co jste za�? P�rek vtip�lk�?",dia_alvares_attack_kerle);
	Info_AddChoice(dia_alvares_attack,"Chci se k v�m �oldn��um p�idat.",dia_alvares_attack_soeldner);
	Info_AddChoice(dia_alvares_attack,"Te�ka odsud hezky rychle vypadnete...",dia_alvares_attack_witz);
	Info_AddChoice(dia_alvares_attack,"Nestoj�m o ��dn� probl�my.",dia_alvares_attack_aerger);
	if(MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING)
	{
		Info_AddChoice(dia_alvares_attack,"Jen jsem si p�i�el n�co vyzvednout.",dia_alvares_attack_lieferung);
	};
};

func void dia_alvares_attack_witz()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Witz_15_00");	//Hele, kluci, prost� odtu� hnedka zmiz�te, jasn�?
	AI_Output(self,other,"DIA_Alvares_ATTACK_Witz_11_01");	//A helemese, m�me tu nov�ho hrdinu - a je to opravdov� blbec.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Witz_11_02");	//V�, co si mysl�m?
	AI_Output(other,self,"DIA_Alvares_ATTACK_Witz_15_03");	//Koho zaj�m�, co si mysl�?
	AI_Output(self,other,"DIA_Alvares_ATTACK_Witz_11_04");	//Mysl�m, �e dobr� hrdina je jedin� mrtv� hrdina. Ud�lej mi teda laskavost - chc�pni co nejrychlejc!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

func void dia_alvares_attack_kerle()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Kerle_15_00");	//Co jste za�? P�rek vtip�lk�?
	AI_Output(self,other,"DIA_Alvares_ATTACK_Kerle_11_01");	//Tos uhodl. Ale po��dn� se zasm�ju, teprve a� bude� le�et dr�kou v bl�t�.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Kerle_11_02");	//(vol�) Engardo, do toho! Ty chytni toho sedl�ka a j� se vypo��d�m s t�mhle �a�kem!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

func void dia_alvares_attack_aerger()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Aerger_15_00");	//Nestoj�m o ��dn� probl�my.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Aerger_11_01");	//Ale my zase m�me probl�my moc r�di. Urazili jsme p�kn� kus cesty, jenom abysme n�jak� vyvolali.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Aerger_11_02");	//Jo, t�ch probl�m� nebude zrovna m�lo. A jestli okam�it� nezmiz�, za�neme rovnou s tebou.
	AI_StopProcessInfos(self);
};

func void dia_alvares_attack_lieferung()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Lieferung_15_00");	//Jen jsem si p�i�el n�co vyzvednout.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Lieferung_11_01");	//To my taky, a my jsme tu byli prvn�. Tak�e bu� vypadne�, nebo ti budu muset ubl�it.
	AI_StopProcessInfos(self);
};

func void dia_alvares_attack_soeldner()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Soeldner_15_00");	//Chci se k v�m �oldn���m p�idat.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Soeldner_11_01");	//Ou, v�n�? Tak to koukej mazat, nebo u� se nikdy k nikomu nep�id�.
	AI_StopProcessInfos(self);
};


instance DIA_ALVARES_SCHLUSS(C_INFO)
{
	npc = sld_840_alvares;
	nr = 4;
	condition = dia_alvares_schluss_condition;
	information = dia_alvares_schluss_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alvares_schluss_condition()
{
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(other,dia_alvares_attack))
	{
		return TRUE;
	};
};

func void dia_alvares_schluss_info()
{
	AI_Output(self,other,"DIA_Alvares_Schluss_11_00");	//Dostal jsi �anci. Ale vypad� to, �e rozumn� d�vody prost� ignoruje�.
	AI_Output(self,other,"DIA_Alvares_Schluss_11_01");	//Jak chce� - tak to t� prost� te� hned zabiju. (vol�) Engardo, odd�lej ho!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};


instance DIA_ALVARES_PICKPOCKET(C_INFO)
{
	npc = sld_840_alvares;
	nr = 900;
	condition = dia_alvares_pickpocket_condition;
	information = dia_alvares_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_alvares_pickpocket_condition()
{
	return c_beklauen(20,15);
};

func void dia_alvares_pickpocket_info()
{
	Info_ClearChoices(dia_alvares_pickpocket);
	Info_AddChoice(dia_alvares_pickpocket,DIALOG_BACK,dia_alvares_pickpocket_back);
	Info_AddChoice(dia_alvares_pickpocket,DIALOG_PICKPOCKET,dia_alvares_pickpocket_doit);
};

func void dia_alvares_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_alvares_pickpocket);
};

func void dia_alvares_pickpocket_back()
{
	Info_ClearChoices(dia_alvares_pickpocket);
};

