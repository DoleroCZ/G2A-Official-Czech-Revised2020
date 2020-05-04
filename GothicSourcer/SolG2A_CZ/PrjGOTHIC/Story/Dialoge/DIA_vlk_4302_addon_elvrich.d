
instance DIA_ADDON_ELVRICH_EXIT(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 999;
	condition = dia_addon_elvrich_exit_condition;
	information = dia_addon_elvrich_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_elvrich_exit_condition()
{
	return TRUE;
};

func void dia_addon_elvrich_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_ELVRICH_PICKPOCKET(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 900;
	condition = dia_addon_elvrich_pickpocket_condition;
	information = dia_addon_elvrich_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_elvrich_pickpocket_condition()
{
	return c_beklauen(62,110);
};

func void dia_addon_elvrich_pickpocket_info()
{
	Info_ClearChoices(dia_addon_elvrich_pickpocket);
	Info_AddChoice(dia_addon_elvrich_pickpocket,DIALOG_BACK,dia_addon_elvrich_pickpocket_back);
	Info_AddChoice(dia_addon_elvrich_pickpocket,DIALOG_PICKPOCKET,dia_addon_elvrich_pickpocket_doit);
};

func void dia_addon_elvrich_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_elvrich_pickpocket);
};

func void dia_addon_elvrich_pickpocket_back()
{
	Info_ClearChoices(dia_addon_elvrich_pickpocket);
};


instance DIA_ADDON_ELVRICH_BANDITSTHERE(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_banditsthere_condition;
	information = dia_addon_elvrich_banditsthere_info;
	important = TRUE;
	permanent = TRUE;
};


var int dia_addon_elvrich_banditsthere_noperm;

func int dia_addon_elvrich_banditsthere_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_ADDON_ELVRICH_BANDITSTHERE_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_banditsthere_info()
{
	if(Npc_IsDead(bdt_10307_addon_rangerbandit_m) && Npc_IsDead(bdt_10308_addon_rangerbandit_l) && Npc_IsDead(bdt_10309_addon_rangerbandit_l) && Npc_IsDead(bdt_10310_addon_rangerbandit_m))
	{
		AI_Output(self,other,"DIA_Addon_Elvrich_BanditsThere_04_00");	//D�ky Bohu. Banditi u� nejsou.
		DIA_ADDON_ELVRICH_BANDITSTHERE_NOPERM = TRUE;
		self.aivar[AIV_NOFIGHTPARKER] = FALSE;
	}
	else
	{
		b_say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_ELVRICH_WER(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_wer_condition;
	information = dia_addon_elvrich_wer_info;
	description = "Kdo jsi?";
};


func int dia_addon_elvrich_wer_condition()
{
	return TRUE;
};

func void dia_addon_elvrich_wer_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_Wer_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Addon_Elvrich_Wer_04_01");	//Jmenuji se Elvrich. Jsem z m�sta.
	if(MIS_THORBEN_BRINGELVRICHBACK == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Addon_Elvrich_Wer_15_02");	//Mistr Thorben mi �ekl, �e jsi zmizel.
	};
	AI_Output(self,other,"DIA_Addon_Elvrich_Wer_04_03");	//Tito stra�n� lid� m� sem dot�hli a dr�eli m� tu jako v�zn�.
};


instance DIA_ADDON_ELVRICH_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_missingpeople_condition;
	information = dia_addon_elvrich_missingpeople_info;
	description = "Hodn� lid� tady ve m�st� chyb�.";
};


func int dia_addon_elvrich_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_wer) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (SCKNOWSMISSINGPEOPLEAREINADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_MissingPeople_15_00");	//Hodn� lid� tady ve m�st� chyb�.
	AI_Output(self,other,"DIA_Addon_Elvrich_MissingPeople_04_01");	//O tom nev�m nic. M��u ti jenom ��ct, co se stalo M�.
};


instance DIA_ADDON_ELVRICH_WHATEXACTLY(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_whatexactly_condition;
	information = dia_addon_elvrich_whatexactly_info;
	description = "Co se ti p�esn� stalo?";
};


func int dia_addon_elvrich_whatexactly_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_wer))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_whatexactly_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_15_00");	//Co se ti p�esn� stalo?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_01");	//�el jsem na sch�zku s holkou.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_02");	//Jmenuje se Lucie. M�li jsme v pl�nu ut�ct do hor. Pry� z m�sta a ode v�ech, co tam �ij�.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_03");	//Jen co jsem dorazil na m�sto, vyvalilo se z k�ov� n�kolik bandit� a oba n�s zajali.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_04");	//Samoz�ejm� jsem bojoval, ale bylo to k ni�emu. Bylo jich p��li� mnoho. Nem�l jsem �anci.
	Info_ClearChoices(dia_addon_elvrich_whatexactly);
	Info_AddChoice(dia_addon_elvrich_whatexactly,"Co od tebe banditi cht�li?",dia_addon_elvrich_whatexactly_want);
	Info_AddChoice(dia_addon_elvrich_whatexactly,"Pov�z mi o Lucii.",dia_addon_elvrich_whatexactly_lucia);
};

func void dia_addon_elvrich_whatexactly_want()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Want_15_00");	//Co od tebe banditi cht�li?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Want_04_01");	//N�kdy, v noci, se mi poda�ilo je odpslouch�vat. Nerozumn�l jsem tomu dob�e, ale mysl�m, �e n�s cht�li zotro�it.
	Info_AddChoice(dia_addon_elvrich_whatexactly,"Kam v�s cht�li odvl�ct?",dia_addon_elvrich_whatexactly_pirates);
};

func void dia_addon_elvrich_whatexactly_pirates()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Pirates_15_00");	//Kam v�s cht�li odvl�ct?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_01");	//N�kam na ostrov Khorinisu. Ale podle m� se tam nejde dostat bez lodi.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_02");	//Odvedli m� na jak�si kotvi�t� na pob�e��. T�bo�ili tam n�jac� pir�ti.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_03");	//Jeden z bandit� �el nap�ed n�co vyjednat a s t�mi pir�ty. M�li prudk� argumenty.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_04");	//Mysl�m, �e banditi cht�li, aby je pir�ti p�evezli a m� s nima.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_05");	//Ale pir�ti s t�m mysl�m nesouhlasili. Nakonec se banditi vr�tili sem a od t� doby tady sed�me.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_06");	//Vypadali p�kn� bezradn�. A pak ses objevil ty.
	ELVRICH_SCKNOWSPIRATS = TRUE;
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Elvrich, u�edn�k truhl��e Thorbena byl unesen bandity. Vypad� to, �e pir�ti se s bandity moc r�di nemaj�.");
	Info_AddChoice(dia_addon_elvrich_whatexactly,"Pir�ti v Khorinisu?",dia_addon_elvrich_whatexactly_here);
	Info_AddChoice(dia_addon_elvrich_whatexactly,"Kde maj� pir�ti svou skr��?",dia_addon_elvrich_whatexactly_pirat);
};

func void dia_addon_elvrich_whatexactly_here()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Here_15_00");	//Pir�ti v Khorinisu?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_01");	//Moc o nich nev�m. Na tom kotvi�ti jsem je vid�l poprv�.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_02");	//V�dycky stoj� v pozad�. Ka�d� z nich je hledan� zlo�inec v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_03");	//Boj� se �ibenice. Proto je nikdy neuvid� ve m�st�.
};

func void dia_addon_elvrich_whatexactly_lucia()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_lucia_15_00");	//Pov�z mi o Lucii.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_lucia_04_01");	//Holka z p��stavu. Pracovala pro toho teplou�e Bromora. Je velmi p�kn�.
};

func void dia_addon_elvrich_whatexactly_pirat()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_pirat_15_00");	//Kde maj� pir�ti svou skr��?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_01");	//Nen� to daleko od p��stavu v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_02");	//Kdy� stoj� na molu a d�v� se na mo�e, tak vem �lun a vesluj pod�l pob�e�� na prav� stran�.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_03");	//Prvn� mal� z�toka, kterou projede� by to m�la b�t.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Abych na�el skr�� pir�t�, mus�m j�t nejprve do p��stavu v Khorinisu. Jakmile budu st�t na molu, �elem k mo�i, mus�m plavat po pob�e�� na prav� stran�.");
	Info_AddChoice(dia_addon_elvrich_whatexactly,DIALOG_BACK,dia_addon_elvrich_whatexactly_back);
};

func void dia_addon_elvrich_whatexactly_back()
{
	Info_ClearChoices(dia_addon_elvrich_whatexactly);
};


instance DIA_ADDON_ELVRICH_BROMOR(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_bromor_condition;
	information = dia_addon_elvrich_bromor_info;
	description = "Bromor ��kal, �e mu Lucia ukradla zlatou misu ...";
};


func int dia_addon_elvrich_bromor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_whatexactly) && (MIS_BROMOR_LUCIASTOLEGOLD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_bromor_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_Bromor_15_00");	//Bromor ��kal, �e mu Lucia ukradla zlatou misu ...
	AI_Output(self,other,"DIA_Addon_Elvrich_Bromor_04_01");	//No, pokud Lucie opravdu n�co ukradla, tak j� to bandit� ur�it� sebrali.
	Log_CreateTopic(TOPIC_ADDON_BROMORSGOLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BROMORSGOLD,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BROMORSGOLD,"Bromorova zlat� misa je nejsp�e u bandit� v severn�m lese za Sekobovou farmou.");
};


instance DIA_ADDON_ELVRICH_WHEREISLUCIA(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_whereislucia_condition;
	information = dia_addon_elvrich_whereislucia_info;
	description = "Kde je Lucie te�?";
};


func int dia_addon_elvrich_whereislucia_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_whatexactly) && (MIS_LUCIASLETTER != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_whereislucia_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhereIsLucia_15_00");	//Kde je Lucie te�?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_01");	//Na�e cesty se rozd�lili na velk� k�i�ovatce u Onarovy farmy.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_02");	//Banditi ji odvlekli do lesa za Sekobovu farmu.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_03");	//Innos ji chra�.
	Log_CreateTopic(TOPIC_ADDON_LUCIA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LUCIA,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_LUCIA,"Lucie byla odvle�ena bandity do lesa za Sekobovou farmou n�kde na severu.");
	SC_KNOWSLUCIACAUGHTBYBANDITS = TRUE;
};


instance DIA_ADDON_ELVRICH_FERNANDOSWAFFEN(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_fernandoswaffen_condition;
	information = dia_addon_elvrich_fernandoswaffen_info;
	description = "To jsou ti banditi, co obdr�eli tu dod�vku zbran�?";
};


func int dia_addon_elvrich_fernandoswaffen_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_whatexactly) && (MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_fernandoswaffen_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_FernandosWaffen_15_00");	//To jsou ti banditi, co obdr�eli tu dod�vku zbran�?
	AI_Output(self,other,"DIA_Addon_Elvrich_FernandosWaffen_04_01");	//Jo. Na mou du�i, m�li probl�my ji celou un�st.
	AI_Output(self,other,"DIA_Addon_Elvrich_FernandosWaffen_04_02");	//Utekli za tu farmu a v�echno vzali s sebou.
	b_giveplayerxp(XP_AMBIENT);
	Log_CreateTopic(TOPIC_ADDON_BANDITTRADER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BANDITTRADER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Badndit�, kte�� obdr�eli velkou dod�vku zbran� se skr�vaj� n�kde za Sekobovou farmou na severu. ");
};


instance DIA_ADDON_ELVRICH_LUCIALETTER(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 4;
	condition = dia_addon_elvrich_lucialetter_condition;
	information = dia_addon_elvrich_lucialetter_info;
	description = "Na�el jsem dopis od Lucie.";
};


func int dia_addon_elvrich_lucialetter_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_whatexactly) && Npc_HasItems(other,itwr_luciasloveletter_addon))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_lucialetter_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_LuciaLetter_15_00");	//Na�el jsem dopis od Lucie.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_01");	//(rozru�en�) Co? Dej to sem!
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_02");	//(v zoufalstv�) NE! Tomu nev���m. Ne. To nem��e b�t pravda.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_03");	//(v zoufalstv�) Nemohla m� takhle opustit.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_04");	//(v zoufalstv�) Vezmi si ten dopis zp�tky. Nechci ho. Pevn� v���m, �e se jednoho dne vr�t�.
	Log_CreateTopic(TOPIC_ADDON_LUCIA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LUCIA,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_LUCIA,"Elvrich nechce uv��it, �e Lucie �la s bandity dobrovoln�. Po��d douf�, �e se vr�t�, navzdory jej�ho dopisu na rozlou�enou.");
	b_giveplayerxp(XP_ADDON_LUCIASLETTER);
	MIS_LUCIASLETTER = LOG_SUCCESS;
};


instance DIA_ADDON_ELVRICH_WASNUN(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_wasnun_condition;
	information = dia_addon_elvrich_wasnun_info;
	permanent = FALSE;
	description = "M�l by ses vr�tit do m�sta!";
};


func int dia_addon_elvrich_wasnun_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_whereislucia))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_wasnun_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_00");	//M�l by ses vr�tit do m�sta!
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_01");	//A co sis myslel, �e bych d�lal? P�jdu rovnou zp�tky k mistru Thorbenovi.
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_02");	//Bude� hledat bandity?
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_03");	//No, h�dal bych �e asi jo ...
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_04");	//Pokud bys na�el Lucii, vzal bys ji bezpe�n� zp�t do m�sta, �e jo?
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_05");	//Uvid�m, co se d� d�lat.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Elvrich se vr�til ke sv�mu truhl��sk�mu mistrovi Thorbenovi.");
	ELVRICH_GOESBACK2THORBEN = TRUE;
	Npc_ExchangeRoutine(self,"BACKINTHECITY");
	EquipItem(self,itmw_1h_bau_mace);
};


instance DIA_ADDON_ELVRICH_PERM(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_perm_condition;
	information = dia_addon_elvrich_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_elvrich_perm_condition()
{
	if((ELVRICH_GOESBACK2THORBEN == TRUE) && Npc_IsInState(self,zs_talk) && (MIS_LUCIASLETTER != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_perm_info()
{
	AI_Output(self,other,"DIA_Addon_Elvrich_PERM_04_00");	//D�kuji ti za z�chranu!
};

