
instance DIA_MIKA_EXIT(C_INFO)
{
	npc = mil_337_mika;
	nr = 999;
	condition = dia_mika_exit_condition;
	information = dia_mika_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mika_exit_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_mika_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_REFUSE(C_INFO)
{
	npc = mil_337_mika;
	nr = 1;
	condition = dia_mika_refuse_condition;
	information = dia_mika_refuse_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mika_refuse_condition()
{
	if(Npc_IsInState(self,zs_talk) && (lares.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_mika_refuse_info()
{
	b_say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_WOHIN(C_INFO)
{
	npc = mil_337_mika;
	nr = 4;
	condition = dia_mika_wohin_condition;
	information = dia_mika_wohin_info;
	important = TRUE;
};


func int dia_mika_wohin_condition()
{
	if(lares.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_mika_wohin_info()
{
	AI_Output(self,other,"DIA_Mika_WOHIN_12_00");	//Hej, hej. Ne tak rychle. Bloumat tady o samot� m��e b�t docela nebezpe�n�. Odkud jsi?
	Info_ClearChoices(dia_mika_wohin);
	Info_AddChoice(dia_mika_wohin,"Do toho ti nic nen�.",dia_mika_wohin_weg);
	Info_AddChoice(dia_mika_wohin,"Z jedn� z farem.",dia_mika_wohin_bauern);
	Info_AddChoice(dia_mika_wohin,"Z m�sta!",dia_mika_wohin_stadt);
};

func void dia_mika_wohin_stadt()
{
	AI_Output(other,self,"DIA_Mika_WOHIN_stadt_15_00");	//Z m�sta!
	AI_Output(self,other,"DIA_Mika_WOHIN_stadt_12_01");	//Dobr�, dobr�. Tak pro� se potom poflakuje� tady, daleko od bezpe�� m�stskejch hradeb?
	Info_ClearChoices(dia_mika_wohin);
};

func void dia_mika_wohin_bauern()
{
	AI_Output(other,self,"DIA_Mika_WOHIN_Bauern_15_00");	//Z jedn� z farem.
	AI_Output(self,other,"DIA_Mika_WOHIN_Bauern_12_01");	//Farm��, co? Hmm. V tom p��pad� by ses nem�l courat po t�chhle nebezpe�nejch cest�ch o samot�. Kdo v�, kdo by tady na tebe mohl ��hat.
	Info_ClearChoices(dia_mika_wohin);
};

func void dia_mika_wohin_weg()
{
	AI_Output(other,self,"DIA_Mika_WOHIN_weg_15_00");	//Do toho ti nic nen�.
	AI_Output(self,other,"DIA_Mika_WOHIN_weg_12_01");	//Kdy� mysl�. Ale a� t� n�kdo sejme, tak si potom nest�uj. P�eju hezkej den.
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_WASGEFAEHRLICH(C_INFO)
{
	npc = mil_337_mika;
	nr = 5;
	condition = dia_mika_wasgefaehrlich_condition;
	information = dia_mika_wasgefaehrlich_info;
	description = "Co je tady tak nebezpe�n�?";
};


func int dia_mika_wasgefaehrlich_condition()
{
	return TRUE;
};

func void dia_mika_wasgefaehrlich_info()
{
	AI_Output(other,self,"DIA_Mika_WASGEFAEHRLICH_15_00");	//Co je tady tak nebezpe�n�?
	AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_01");	//Spousta v�c�.
	if(other.protection[PROT_EDGE] < itar_leather_l.protection[PROT_EDGE])
	{
		AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_02");	//Za prv� jsou tady banditi. Takovou m�kkotu, jako jsi ty, klidn� zblajznou k sn�dani.
		AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_03");	//A kdy� t� nechyt�j banditi, tak se o tebe postaraj divok� zv��ata v lese nebo �old�ci, co se potulujou tady po okol�.
		AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_04");	//Tak�e ne� n�kam vyraz�, m�l by sis sehnat n�jak� slu�n� brn�n�.
	};
	AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_05");	//Vsad�m se, �e bude� k�i�et o pomoc hned za prvn� zat��kou.
};


instance DIA_MIKA_WASKOSTETHILFE(C_INFO)
{
	npc = mil_337_mika;
	nr = 6;
	condition = dia_mika_waskostethilfe_condition;
	information = dia_mika_waskostethilfe_info;
	description = "Jenom pro p��pad, �e bych tvou pomoc opravdu pot�eboval. Kolik by m� to st�lo?";
};


func int dia_mika_waskostethilfe_condition()
{
	if(Npc_KnowsInfo(other,dia_mika_wasgefaehrlich))
	{
		return TRUE;
	};
};

func void dia_mika_waskostethilfe_info()
{
	AI_Output(other,self,"DIA_Mika_WASKOSTETHILFE_15_00");	//Jenom pro p��pad, �e bych tvou pomoc opravdu pot�eboval. Kolik by m� to st�lo?
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_12_01");	//Jsem prost� skromn� slu�ebn�k kr�le a v ��dn�m p��pad� bych necht�l o�kubat bezbrann�ho ob�ana kr�lovstv�.
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_12_02");	//Ale, no... kdy� to ��k� takhle... rozhodn� bych nem�l nic proti n�jak�mu mal�mu finan�n�mu upevn�n� na�ich budouc�ch obchodn�ch vztah�.
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_12_03");	//10 zlatejch by m�lo pro za��tek sta�it. Co ty na to?
	Info_ClearChoices(dia_mika_waskostethilfe);
	Info_AddChoice(dia_mika_waskostethilfe,"Budu o tom p�em��let.",dia_mika_waskostethilfe_nochnicht);
	Info_AddChoice(dia_mika_waskostethilfe,"Pro� ne? Tady m� sv�ch 10 zla��k�.",dia_mika_waskostethilfe_ja);
};

func void dia_mika_waskostethilfe_ja()
{
	AI_Output(other,self,"DIA_Mika_WASKOSTETHILFE_ja_15_00");	//Pro� ne? Tady m� sv�ch 10 zla��k�.
	if(b_giveinvitems(other,self,itmi_gold,10))
	{
		AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_ja_12_01");	//V�born�. Kdybys pot�eboval pomoc, v�, kde m� hledat.
		AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_ja_12_02");	//Ale cht�l bych t� poprosit o jednu mali�kost. Necho� za mnou se ��dnejma prkotinama. To m� v�dycky dok�e vyto�it, rozum�me si?
		MIKA_HELPS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_ja_12_03");	//Tolik pen�z nem�. Mo�n� by sis m�l rozmyslet, jestli opravdu moj� pomoc pot�ebuje�.
	};
	AI_StopProcessInfos(self);
};

func void dia_mika_waskostethilfe_nochnicht()
{
	AI_Output(other,self,"DIA_Mika_WASKOSTETHILFE_nochnicht_15_00");	//Budu o tom p�em��let.
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_nochnicht_12_01");	//Jak je libo. Pozdravuj zubatou.
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_UEBERLEGT(C_INFO)
{
	npc = mil_337_mika;
	nr = 7;
	condition = dia_mika_ueberlegt_condition;
	information = dia_mika_ueberlegt_info;
	permanent = TRUE;
	description = "Rozmyslel jsem si to. Zaplat�m t�ch 10 zlat�ch.";
};


func int dia_mika_ueberlegt_condition()
{
	if(Npc_KnowsInfo(other,dia_mika_waskostethilfe) && (MIKA_HELPS == FALSE))
	{
		return TRUE;
	};
};

func void dia_mika_ueberlegt_info()
{
	AI_Output(other,self,"DIA_Mika_UEBERLEGT_15_00");	//Rozmyslel jsem si to. Zaplat�m t�ch 10 zlat�ch.
	if(b_giveinvitems(other,self,itmi_gold,10))
	{
		AI_Output(self,other,"DIA_Mika_UEBERLEGT_12_01");	//Skv�l�. Lep�� pozd� ne� nikdy. A co te�?
		MIKA_HELPS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mika_UEBERLEGT_12_02");	//(rozzloben�) Vra� se, a� bude� m�t ty prachy.
		AI_StopProcessInfos(self);
	};
};


instance DIA_MIKA_HILFE(C_INFO)
{
	npc = mil_337_mika;
	nr = 8;
	condition = dia_mika_hilfe_condition;
	information = dia_mika_hilfe_info;
	permanent = TRUE;
	description = "Pot�ebuji tvou pomoc.";
};


func int dia_mika_hilfe_condition()
{
	if(MIKA_HELPS == TRUE)
	{
		return TRUE;
	};
};

func void dia_mika_hilfe_info()
{
	AI_Output(other,self,"DIA_Mika_HILFE_15_00");	//Pot�ebuji tvou pomoc.
	AI_Output(self,other,"DIA_Mika_HILFE_12_01");	//Jestli to je naprosto nezbytn�... Co se d�je?
	Info_ClearChoices(dia_mika_hilfe);
	Info_AddChoice(dia_mika_hilfe,"Pron�sleduj� m� bandit�.",dia_mika_hilfe_schongut);
	Info_AddChoice(dia_mika_hilfe,"Za�to�ily na m� p��ery.",dia_mika_hilfe_monster);
	if(!Npc_IsDead(alvares) && !Npc_IsDead(engardo) && ((AKILS_SLDSTILLTHERE == TRUE) || Npc_KnowsInfo(other,dia_sarah_bauern)))
	{
		Info_AddChoice(dia_mika_hilfe,"Na farm��e Akila za�to�ili �old�ci.",dia_mika_hilfe_akil);
	};
};

func void dia_mika_hilfe_akil()
{
	AI_Output(other,self,"DIA_Mika_HILFE_Akil_15_00");	//Na farm��e Akila za�to�ili �old�ci.
	AI_Output(self,other,"DIA_Mika_HILFE_Akil_12_01");	//(znepokojen�) Co�e? Ta l�za vyrazila na Akilovu farmu? Tak to nen� �asu nazbyt. Poj� za mnou.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"Mika chce, abych vy�e�il probl�m se �oldn��i na Akilov� farm�.");
	Npc_ExchangeRoutine(self,"Akil");
};

func void dia_mika_hilfe_monster()
{
	AI_Output(other,self,"DIA_Mika_HILFE_monster_15_00");	//Za�to�ily na m� p��ery.
	AI_Output(self,other,"DIA_Mika_HILFE_monster_12_01");	//Ale j� ��dn� p��ery nevid�m. Ur�it� sis to jenom vymyslel.
	AI_StopProcessInfos(self);
};

func void dia_mika_hilfe_schongut()
{
	AI_Output(other,self,"DIA_Mika_HILFE_schongut_15_00");	//Pron�sleduj� m� bandit�.
	AI_Output(self,other,"DIA_Mika_HILFE_schongut_12_01");	//V�n�? A kde tedy jsou? Kdyby t� pron�sledovali, ur�it� bych m�l vid�t alespo� jednoho, ne?
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_ZACK(C_INFO)
{
	npc = mil_337_mika;
	nr = 8;
	condition = dia_mika_zack_condition;
	information = dia_mika_zack_info;
	important = TRUE;
};


func int dia_mika_zack_condition()
{
	if((Npc_GetDistToWP(self,"NW_FARM2_PATH_03") < 500) && (!Npc_IsDead(alvares) || !Npc_IsDead(engardo)))
	{
		return TRUE;
	};
};

func void dia_mika_zack_info()
{
	AI_Output(self,other,"DIA_Mika_Zack_12_00");	//Te� sleduj, jak se to d�l�.
	Info_AddChoice(dia_mika_zack,DIALOG_ENDE,dia_mika_zack_los);
};

func void dia_mika_zack_los()
{
	AI_StopProcessInfos(self);
	if(!Npc_IsDead(alvares))
	{
		alvares.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
	if(!Npc_IsDead(engardo))
	{
		engardo.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
};


instance DIA_MIKA_WIEDERNACHHAUSE(C_INFO)
{
	npc = mil_337_mika;
	nr = 9;
	condition = dia_mika_wiedernachhause_condition;
	information = dia_mika_wiedernachhause_info;
	important = TRUE;
};


func int dia_mika_wiedernachhause_condition()
{
	if((Npc_GetDistToWP(self,"NW_FARM2_PATH_03") < 10000) && Npc_IsDead(alvares) && Npc_IsDead(engardo))
	{
		return TRUE;
	};
};

func void dia_mika_wiedernachhause_info()
{
	AI_Output(self,other,"DIA_Mika_WIEDERNACHHAUSE_12_00");	//Dobr�. Tak jo. J� tedy p�jdu.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_MIKA_KAP3_EXIT(C_INFO)
{
	npc = mil_337_mika;
	nr = 999;
	condition = dia_mika_kap3_exit_condition;
	information = dia_mika_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mika_kap3_exit_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_mika_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_KAP3U4U5_PERM(C_INFO)
{
	npc = mil_337_mika;
	nr = 39;
	condition = dia_mika_kap3u4u5_perm_condition;
	information = dia_mika_kap3u4u5_perm_info;
	permanent = TRUE;
	description = "V�echno v po��dku?";
};


func int dia_mika_kap3u4u5_perm_condition()
{
	if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_mika_wohin) && Npc_IsDead(alvares) && Npc_IsDead(engardo))
	{
		return TRUE;
	};
};

func void dia_mika_kap3u4u5_perm_info()
{
	AI_Output(other,self,"DIA_Mika_Kap3u4u5_PERM_15_00");	//V�echno v po��dku?
	AI_Output(self,other,"DIA_Mika_Kap3u4u5_PERM_12_01");	//Je�t� po��d jsi na�ivu. To na m� ud�lalo dojem.
};


instance DIA_MIKA_PICKPOCKET(C_INFO)
{
	npc = mil_337_mika;
	nr = 900;
	condition = dia_mika_pickpocket_condition;
	information = dia_mika_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_mika_pickpocket_condition()
{
	return c_beklauen(65,75);
};

func void dia_mika_pickpocket_info()
{
	Info_ClearChoices(dia_mika_pickpocket);
	Info_AddChoice(dia_mika_pickpocket,DIALOG_BACK,dia_mika_pickpocket_back);
	Info_AddChoice(dia_mika_pickpocket,DIALOG_PICKPOCKET,dia_mika_pickpocket_doit);
};

func void dia_mika_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mika_pickpocket);
};

func void dia_mika_pickpocket_back()
{
	Info_ClearChoices(dia_mika_pickpocket);
};

