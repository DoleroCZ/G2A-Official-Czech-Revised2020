
instance DIA_ADDON_NEFARIUS_ADW_EXIT(C_INFO)
{
	npc = kdw_14020_addon_nefarius_adw;
	nr = 999;
	condition = dia_addon_nefarius_adw_exit_condition;
	information = dia_addon_nefarius_adw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_nefarius_adw_exit_condition()
{
	return TRUE;
};

func void dia_addon_nefarius_adw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_NEFARIUS_ADWHELLO(C_INFO)
{
	npc = kdw_14020_addon_nefarius_adw;
	nr = 5;
	condition = dia_addon_nefarius_adwhello_condition;
	information = dia_addon_nefarius_adwhello_info;
	important = TRUE;
};


func int dia_addon_nefarius_adwhello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_adwhello_info()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_ADWHello_05_00");	//Uklidnilo m�, �e jsi dorazil v po��dku.
	AI_Output(other,self,"DIA_Addon_Nefarius_ADWHello_15_01");	//Jakto�e jsi dorazil d��v ne� j�?
	AI_Output(self,other,"DIA_Addon_Nefarius_ADWHello_05_02");	//Cestovali jsme skrz zvl�tn� dimenzi. Kdo v�, kde ses to�il.
	AI_Output(other,self,"DIA_Addon_Nefarius_ADWHello_15_03");	//Zvl�tn�. M��u pou��t port�l i jindy?
	AI_Output(self,other,"DIA_Addon_Nefarius_ADWHello_05_04");	//Dorazili jsme p�esn� sem. Funguje z�ejm� velmi dob�e.
	AI_Output(self,other,"DIA_Addon_Nefarius_ADWHello_05_05");	//D�m ti v�d�t, kdybych m�l podez�en�, �e se n�co zm�nilo.
};


instance DIA_ADDON_NEFARIUS_NEUES(C_INFO)
{
	npc = kdw_14020_addon_nefarius_adw;
	nr = 5;
	condition = dia_addon_nefarius_neues_condition;
	information = dia_addon_nefarius_neues_info;
	description = "Co jsi d�lal do te�?";
};


func int dia_addon_nefarius_neues_condition()
{
	if(GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_neues_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_15_00");	//Co jsi d�lal do te�?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_01");	//Studuji historii stavitel� a sna��m se p�ij�t na to, pro� port�l uzav�eli.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_02");	//Vypad� to, jakoby cht�li skr�t toto ztracen� m�sto p�ed zbytkem sv�ta.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_03");	//Stra�n� v�ci se staly p�ed mnoha lety. N�co stra�n�ho je posedlo.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_04");	//Pokud bychom v��ili z�znam�m, tak p�edt�m ne� bylo m�sto prokleto tu zu�ila d�siv� ob�ansk� v�lka.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_05");	//Cesty byly v plamenech a hltaj�c� p��liv nakonec zpe�etil osudy stavitel�.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_06");	//T�ch p�r, co p�e�ili tohle peklo, uzav�elo tuto ��st ostrova s nad�j�, �e zde s n�m uzamknou i zlo.
	Info_ClearChoices(dia_addon_nefarius_neues);
	Info_AddChoice(dia_addon_nefarius_neues,"Co mysl�, �e tady najdeme?",dia_addon_nefarius_neues_find);
	Info_AddChoice(dia_addon_nefarius_neues,"A my hlup�ci znovu otev�eme port�l.",dia_addon_nefarius_neues_auf);
	Info_AddChoice(dia_addon_nefarius_neues,"Tak co rozru�ilo stavitele?",dia_addon_nefarius_neues_was);
	Info_AddChoice(dia_addon_nefarius_neues,"��kal jsi, �e p�i�el p��liv?",dia_addon_nefarius_neues_flut);
};

func void dia_addon_nefarius_neues_find()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_find_15_00");	//Co mysl�, �e tady najdeme?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_find_05_01");	//To m��eme jenom h�dat. M�l by sis promluvit sp� se Saturasem.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_find_05_02");	//M�me n�pad.
	Log_CreateTopic(TOPIC_ADDON_FLUT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_FLUT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_FLUT,"Nefarius si mysl�, �e bych si m�l promluvit se Saturasem o tomhle zruinovan�m m�st�.");
	NEFARIUSADW_TALK2SATURAS = TRUE;
};

func void dia_addon_nefarius_neues_flut()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_flut_15_00");	//��kal jsi, �e p�i�el p��liv?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_flut_05_01");	//Adanos se jim s�m zjevil za ��elem p�eru�it to ��lenstv�.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_flut_05_02");	//Zatopil m�sto.
};

func void dia_addon_nefarius_neues_was()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_was_15_00");	//Tak co rozru�ilo stavitele?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_was_05_01");	//N�kdo z nich sv��il svou du�i zlu. Byl to skv�l� velitel Quarhodron.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_was_05_02");	//Kdy� se vr�til z jedn� �sp�n� bitvy, p�inesl s sebou i zlo.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_was_05_03");	//V�ichni jeho p��vr�enci za�ali m�t sklon k ��lenstv� a za�ali bojovat proti sv�m vlastn�m lidem.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_was_05_04");	//A nast�v�j�ci ob�ansk� v�lka zni�ila v�echno.
};

func void dia_addon_nefarius_neues_auf()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_auf_15_00");	//A my hlup�ci znovu otev�eme port�l.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_auf_05_01");	//C�t�m se jinak ne� obvykle. To je divn�.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_auf_05_02");	//Ale m�me na v�b�r?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_auf_05_03");	//Pokud se n�m nepoda�� zastavit to, co se tady d�je, tak to snad v Khorinisu pochop�.
};


instance DIA_ADDON_NEFARIUS_PERMADW(C_INFO)
{
	npc = kdw_14020_addon_nefarius_adw;
	nr = 10;
	condition = dia_addon_nefarius_permadw_condition;
	information = dia_addon_nefarius_permadw_info;
	permanent = TRUE;
	description = "Cesta port�lem je bezpe�n�?";
};


func int dia_addon_nefarius_permadw_condition()
{
	return TRUE;
};

func void dia_addon_nefarius_permadw_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_PermADW_15_00");	//Cesta port�lem je bezpe�n�?
	AI_Output(self,other,"DIA_Addon_Nefarius_PermADW_05_01");	//Dosud o tom nepochybuji.
};


instance DIA_ADDON_NEFARIUS_PRETEACH(C_INFO)
{
	npc = kdw_14020_addon_nefarius_adw;
	nr = 99;
	condition = dia_addon_nefarius_preteach_condition;
	information = dia_addon_nefarius_preteach_info;
	description = "Mohl bys m� zasv�tit do taj� magie?";
};


func int dia_addon_nefarius_preteach_condition()
{
	if((hero.guild == GIL_KDF) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_preteach_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_PreTeach_15_00");	//Mohl bys m� zasv�tit do taj� magie?
	AI_Output(self,other,"DIA_Addon_Nefarius_PreTeach_05_01");	//M��u t� nau�it vyr�b�t n�jak� runy a Cronos ti na n� m��e prodat suroviny.
	AI_Output(self,other,"DIA_Addon_Nefarius_PreTeach_05_02");	//V�dycky u sebe m� knihu o run�ch.
	NEFARIUS_ADDON_TEACHRUNES = TRUE;
	Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_KDWTEACHER,LOGTEXT_ADDON_NEFARIUSTEACH);
};


instance DIA_ADDON_NEFARIUS_ADW_RUNEN(C_INFO)
{
	npc = kdw_14020_addon_nefarius_adw;
	nr = 99;
	condition = dia_addon_nefarius_adw_runen_condition;
	information = dia_addon_nefarius_adw_runen_info;
	permanent = TRUE;
	description = "U� m� (tvorba run)";
};


func int dia_addon_nefarius_adw_runen_condition()
{
	if(NEFARIUS_ADDON_TEACHRUNES == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_adw_runen_info()
{
	Info_ClearChoices(dia_addon_nefarius_adw_runen);
	Info_AddChoice(dia_addon_nefarius_adw_runen,DIALOG_BACK,dia_addon_nefarius_adw_runen_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,"6. Kruh magie",dia_addon_nefarius_adw_runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,"5. Kruh magie",dia_addon_nefarius_adw_runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,"4. Kruh magie",dia_addon_nefarius_adw_runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,"3. Kruh magie",dia_addon_nefarius_adw_runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,"2. Kruh magie",dia_addon_nefarius_adw_runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,"1. Kruh magie",dia_addon_nefarius_adw_runen_1);
	};
};

func void dia_addon_nefarius_adw_runen_back()
{
	Info_ClearChoices(dia_addon_nefarius_adw_runen);
};

func void dia_addon_nefarius_adw_runen_1()
{
	Info_ClearChoices(dia_addon_nefarius_adw_runen);
	Info_AddChoice(dia_addon_nefarius_adw_runen,DIALOG_BACK,dia_addon_nefarius_adw_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_SUMMONGOBLINSKELETON] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_SUMMONGOBLINSKELETON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONGOBLINSKELETON)),dia_addon_nefarius_adw_runen_circle_1_spl_summongoblinskeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_LIGHTHEAL] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_LIGHTHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHTHEAL)),dia_addon_nefarius_adw_runen_circle_1_spl_lightheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_ZAP] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_ZAP,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ZAP)),dia_addon_nefarius_adw_runen_circle_1_spl_zap);
	};
	if(PLAYER_TALENT_RUNES[SPL_FIREBOLT] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_FIREBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIREBOLT)),dia_addon_nefarius_adw_runen_circle_1_spl_firebolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_LIGHT] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_LIGHT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHT)),dia_addon_nefarius_adw_runen_circle_1_spl_light);
	};
};

func void dia_addon_nefarius_adw_runen_2()
{
	Info_ClearChoices(dia_addon_nefarius_adw_runen);
	Info_AddChoice(dia_addon_nefarius_adw_runen,DIALOG_BACK,dia_addon_nefarius_adw_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_INSTANTFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_INSTANTFIREBALL)),dia_addon_nefarius_adw_runen_circle_2_spl_instantfireball);
	};
	if(PLAYER_TALENT_RUNES[SPL_ICEBOLT] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_ICEBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEBOLT)),dia_addon_nefarius_adw_runen_circle_2_spl_icebolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_SUMMONWOLF] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_SUMMONWOLF,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONWOLF)),dia_addon_nefarius_adw_runen_circle_2_spl_summonwolf);
	};
	if(PLAYER_TALENT_RUNES[SPL_WINDFIST] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_WINDFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_WINDFIST)),dia_addon_nefarius_adw_runen_circle_2_spl_windfist);
	};
	if(PLAYER_TALENT_RUNES[SPL_SLEEP] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_SLEEP,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SLEEP)),dia_addon_nefarius_adw_runen_circle_2_spl_sleep);
	};
	if(PLAYER_TALENT_RUNES[SPL_WHIRLWIND] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_WHIRLWIND,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_WHIRLWIND)),dia_addon_nefarius_adw_runen_circle_2_spl_whirlwind);
	};
	if(PLAYER_TALENT_RUNES[SPL_ICELANCE] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_ICELANCE,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICELANCE)),dia_addon_nefarius_adw_runen_circle_2_spl_icelance);
	};
};

func void dia_addon_nefarius_adw_runen_3()
{
	Info_ClearChoices(dia_addon_nefarius_adw_runen);
	Info_AddChoice(dia_addon_nefarius_adw_runen,DIALOG_BACK,dia_addon_nefarius_adw_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_MEDIUMHEAL] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_MEDIUMHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_MEDIUMHEAL)),dia_addon_nefarius_adw_runen_circle_3_spl_mediumheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_CHARGEZAP] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_CHARGEZAP,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_CHARGEZAP)),dia_addon_nefarius_adw_runen_circle_3_spl_thunderball);
	};
	if(PLAYER_TALENT_RUNES[SPL_FIRESTORM] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_FIRESTORM,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIRESTORM)),dia_addon_nefarius_adw_runen_circle_3_spl_firestorm);
	};
	if(PLAYER_TALENT_RUNES[SPL_SUMMONSKELETON] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_SUMMONSKELETON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONSKELETON)),dia_addon_nefarius_adw_runen_circle_3_spl_summonskeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_FEAR] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_FEAR,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FEAR)),dia_addon_nefarius_adw_runen_circle_3_spl_fear);
	};
	if(PLAYER_TALENT_RUNES[SPL_ICECUBE] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_ICECUBE,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICECUBE)),dia_addon_nefarius_adw_runen_circle_3_spl_icecube);
	};
	if(PLAYER_TALENT_RUNES[SPL_THUNDERSTORM] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_THUNDERSTORM,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_THUNDERSTORM)),dia_addon_nefarius_adw_runen_circle_3_spl_thunderstorm);
	};
	if(PLAYER_TALENT_RUNES[SPL_GEYSER] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_GEYSER,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_GEYSER)),dia_addon_nefarius_adw_runen_circle_3_spl_geyser);
	};
};

func void dia_addon_nefarius_adw_runen_4()
{
	Info_ClearChoices(dia_addon_nefarius_adw_runen);
	Info_AddChoice(dia_addon_nefarius_adw_runen,DIALOG_BACK,dia_addon_nefarius_adw_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_SUMMONGOLEM] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_SUMMONGOLEM,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONGOLEM)),dia_addon_nefarius_adw_runen_circle_4_spl_summongolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_DESTROYUNDEAD] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_DESTROYUNDEAD,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_DESTROYUNDEAD)),dia_addon_nefarius_adw_runen_circle_4_spl_destroyundead);
	};
	if(PLAYER_TALENT_RUNES[SPL_LIGHTNINGFLASH] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_LIGHTNINGFLASH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHTNINGFLASH)),dia_addon_nefarius_adw_runen_circle_4_spl_lightningflash);
	};
	if(PLAYER_TALENT_RUNES[SPL_CHARGEFIREBALL] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_CHARGEFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_CHARGEFIREBALL)),dia_addon_nefarius_adw_runen_circle_4_spl_chargefireball);
	};
	if(PLAYER_TALENT_RUNES[SPL_WATERFIST] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_WATERFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_WATERFIST)),dia_addon_nefarius_adw_runen_circle_4_spl_waterfist);
	};
};

func void dia_addon_nefarius_adw_runen_5()
{
	Info_ClearChoices(dia_addon_nefarius_adw_runen);
	Info_AddChoice(dia_addon_nefarius_adw_runen,DIALOG_BACK,dia_addon_nefarius_adw_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_ICEWAVE] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_ICEWAVE,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEWAVE)),dia_addon_nefarius_adw_runen_circle_5_spl_icewave);
	};
	if(PLAYER_TALENT_RUNES[SPL_SUMMONDEMON] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_SUMMONDEMON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONDEMON)),dia_addon_nefarius_adw_runen_circle_5_spl_summondemon);
	};
	if(PLAYER_TALENT_RUNES[SPL_FULLHEAL] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_FULLHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FULLHEAL)),dia_addon_nefarius_adw_runen_circle_5_spl_fullheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PYROKINESIS] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_PYROKINESIS,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PYROKINESIS)),dia_addon_nefarius_adw_runen_circle_5_spl_pyrokinesis);
	};
};

func void dia_addon_nefarius_adw_runen_6()
{
	Info_ClearChoices(dia_addon_nefarius_adw_runen);
	Info_AddChoice(dia_addon_nefarius_adw_runen,DIALOG_BACK,dia_addon_nefarius_adw_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_FIRERAIN] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_FIRERAIN,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIRERAIN)),dia_addon_nefarius_adw_runen_circle_6_spl_firerain);
	};
	if(PLAYER_TALENT_RUNES[SPL_BREATHOFDEATH] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_BREATHOFDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_BREATHOFDEATH)),dia_addon_nefarius_adw_runen_circle_6_spl_breathofdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_MASSDEATH] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_MASSDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_MASSDEATH)),dia_addon_nefarius_adw_runen_circle_6_spl_massdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_ARMYOFDARKNESS] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_ARMYOFDARKNESS,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ARMYOFDARKNESS)),dia_addon_nefarius_adw_runen_circle_6_spl_armyofdarkness);
	};
	if(PLAYER_TALENT_RUNES[SPL_SHRINK] == FALSE)
	{
		Info_AddChoice(dia_addon_nefarius_adw_runen,b_buildlearnstring(NAME_SPL_SHRINK,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SHRINK)),dia_addon_nefarius_adw_runen_circle_6_spl_shrink);
	};
};

func void dia_addon_nefarius_adw_runen_circle_1_spl_light()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHT);
};

func void dia_addon_nefarius_adw_runen_circle_1_spl_firebolt()
{
	b_teachplayertalentrunes(self,other,SPL_FIREBOLT);
};

func void dia_addon_nefarius_adw_runen_circle_1_spl_zap()
{
	b_teachplayertalentrunes(self,other,SPL_ZAP);
};

func void dia_addon_nefarius_adw_runen_circle_1_spl_lightheal()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTHEAL);
};

func void dia_addon_nefarius_adw_runen_circle_1_spl_summongoblinskeleton()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOBLINSKELETON);
};

func void dia_addon_nefarius_adw_runen_circle_2_spl_whirlwind()
{
	b_teachplayertalentrunes(self,other,SPL_WHIRLWIND);
};

func void dia_addon_nefarius_adw_runen_circle_2_spl_icelance()
{
	b_teachplayertalentrunes(self,other,SPL_ICELANCE);
};

func void dia_addon_nefarius_adw_runen_circle_2_spl_instantfireball()
{
	b_teachplayertalentrunes(self,other,SPL_INSTANTFIREBALL);
};

func void dia_addon_nefarius_adw_runen_circle_2_spl_icebolt()
{
	b_teachplayertalentrunes(self,other,SPL_ICEBOLT);
};

func void dia_addon_nefarius_adw_runen_circle_2_spl_summonwolf()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONWOLF);
};

func void dia_addon_nefarius_adw_runen_circle_2_spl_windfist()
{
	b_teachplayertalentrunes(self,other,SPL_WINDFIST);
};

func void dia_addon_nefarius_adw_runen_circle_2_spl_sleep()
{
	b_teachplayertalentrunes(self,other,SPL_SLEEP);
};

func void dia_addon_nefarius_adw_runen_circle_3_spl_thunderstorm()
{
	b_teachplayertalentrunes(self,other,SPL_THUNDERSTORM);
};

func void dia_addon_nefarius_adw_runen_circle_3_spl_geyser()
{
	b_teachplayertalentrunes(self,other,SPL_GEYSER);
};

func void dia_addon_nefarius_adw_runen_circle_3_spl_mediumheal()
{
	b_teachplayertalentrunes(self,other,SPL_MEDIUMHEAL);
};

func void dia_addon_nefarius_adw_runen_circle_3_spl_summonskeleton()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONSKELETON);
};

func void dia_addon_nefarius_adw_runen_circle_3_spl_fear()
{
	b_teachplayertalentrunes(self,other,SPL_FEAR);
};

func void dia_addon_nefarius_adw_runen_circle_3_spl_icecube()
{
	b_teachplayertalentrunes(self,other,SPL_ICECUBE);
};

func void dia_addon_nefarius_adw_runen_circle_3_spl_thunderball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEZAP);
};

func void dia_addon_nefarius_adw_runen_circle_3_spl_firestorm()
{
	b_teachplayertalentrunes(self,other,SPL_FIRESTORM);
};

func void dia_addon_nefarius_adw_runen_circle_4_spl_lightningflash()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTNINGFLASH);
};

func void dia_addon_nefarius_adw_runen_circle_4_spl_chargefireball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEFIREBALL);
};

func void dia_addon_nefarius_adw_runen_circle_4_spl_waterfist()
{
	b_teachplayertalentrunes(self,other,SPL_WATERFIST);
};

func void dia_addon_nefarius_adw_runen_circle_4_spl_summongolem()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOLEM);
};

func void dia_addon_nefarius_adw_runen_circle_4_spl_destroyundead()
{
	b_teachplayertalentrunes(self,other,SPL_DESTROYUNDEAD);
};

func void dia_addon_nefarius_adw_runen_circle_5_spl_pyrokinesis()
{
	b_teachplayertalentrunes(self,other,SPL_PYROKINESIS);
};

func void dia_addon_nefarius_adw_runen_circle_5_spl_icewave()
{
	b_teachplayertalentrunes(self,other,SPL_ICEWAVE);
};

func void dia_addon_nefarius_adw_runen_circle_5_spl_summondemon()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONDEMON);
};

func void dia_addon_nefarius_adw_runen_circle_5_spl_fullheal()
{
	b_teachplayertalentrunes(self,other,SPL_FULLHEAL);
};

func void dia_addon_nefarius_adw_runen_circle_6_spl_firerain()
{
	b_teachplayertalentrunes(self,other,SPL_FIRERAIN);
};

func void dia_addon_nefarius_adw_runen_circle_6_spl_breathofdeath()
{
	b_teachplayertalentrunes(self,other,SPL_BREATHOFDEATH);
};

func void dia_addon_nefarius_adw_runen_circle_6_spl_massdeath()
{
	b_teachplayertalentrunes(self,other,SPL_MASSDEATH);
};

func void dia_addon_nefarius_adw_runen_circle_6_spl_armyofdarkness()
{
	b_teachplayertalentrunes(self,other,SPL_ARMYOFDARKNESS);
};

func void dia_addon_nefarius_adw_runen_circle_6_spl_shrink()
{
	b_teachplayertalentrunes(self,other,SPL_SHRINK);
};

