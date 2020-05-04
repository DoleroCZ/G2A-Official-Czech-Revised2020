
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
	AI_Output(self,other,"DIA_Alvares_HAUAB_11_00");	//A u tì sem pøivedlo cokoliv, radši na to zapomeò a bì dál.
	Log_CreateTopic(TOPIC_AKILSSLDSTILLTHERE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSSLDSTILLTHERE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"Akilovu farmu ohroují oldnéøi.");
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
	AI_Output(self,other,"DIA_Alvares_ATTACK_11_00");	//Hej, tys ještì tady? Dal jsem ti na vıbìr, cizinèe: buï vypadni, nebo chcípni.
	Info_ClearChoices(dia_alvares_attack);
	Info_AddChoice(dia_alvares_attack,"Co jste zaè? Párek vtipálkù?",dia_alvares_attack_kerle);
	Info_AddChoice(dia_alvares_attack,"Chci se k vám oldnéøum pøidat.",dia_alvares_attack_soeldner);
	Info_AddChoice(dia_alvares_attack,"Teïka odsud hezky rychle vypadnete...",dia_alvares_attack_witz);
	Info_AddChoice(dia_alvares_attack,"Nestojím o ádné problémy.",dia_alvares_attack_aerger);
	if(MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING)
	{
		Info_AddChoice(dia_alvares_attack,"Jen jsem si pøišel nìco vyzvednout.",dia_alvares_attack_lieferung);
	};
};

func void dia_alvares_attack_witz()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Witz_15_00");	//Hele, kluci, prostì odtuï hnedka zmizíte, jasnı?
	AI_Output(self,other,"DIA_Alvares_ATTACK_Witz_11_01");	//A helemese, máme tu nového hrdinu - a je to opravdovı blbec.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Witz_11_02");	//Víš, co si myslím?
	AI_Output(other,self,"DIA_Alvares_ATTACK_Witz_15_03");	//Koho zajímá, co si myslíš?
	AI_Output(self,other,"DIA_Alvares_ATTACK_Witz_11_04");	//Myslím, e dobrı hrdina je jedinì mrtvı hrdina. Udìlej mi teda laskavost - chcípni co nejrychlejc!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

func void dia_alvares_attack_kerle()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Kerle_15_00");	//Co jste zaè? Párek vtipálkù?
	AI_Output(self,other,"DIA_Alvares_ATTACK_Kerle_11_01");	//Tos uhodl. Ale poøádnì se zasmìju, teprve a budeš leet drkou v blátì.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Kerle_11_02");	//(volá) Engardo, do toho! Ty chytni toho sedláka a já se vypoøádám s tímhle šaškem!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

func void dia_alvares_attack_aerger()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Aerger_15_00");	//Nestojím o ádné problémy.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Aerger_11_01");	//Ale my zase máme problémy moc rádi. Urazili jsme pìknı kus cesty, jenom abysme nìjaké vyvolali.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Aerger_11_02");	//Jo, tìch problémù nebude zrovna málo. A jestli okamitì nezmizíš, zaèneme rovnou s tebou.
	AI_StopProcessInfos(self);
};

func void dia_alvares_attack_lieferung()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Lieferung_15_00");	//Jen jsem si pøišel nìco vyzvednout.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Lieferung_11_01");	//To my taky, a my jsme tu byli první. Take buï vypadneš, nebo ti budu muset ublíit.
	AI_StopProcessInfos(self);
};

func void dia_alvares_attack_soeldner()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Soeldner_15_00");	//Chci se k vám oldnéøùm pøidat.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Soeldner_11_01");	//Ou, vánì? Tak to koukej mazat, nebo u se nikdy k nikomu nepøidáš.
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
	AI_Output(self,other,"DIA_Alvares_Schluss_11_00");	//Dostal jsi šanci. Ale vypadá to, e rozumnı dùvody prostì ignoruješ.
	AI_Output(self,other,"DIA_Alvares_Schluss_11_01");	//Jak chceš - tak to tì prostì teï hned zabiju. (volá) Engardo, oddìlej ho!
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

