
instance DIA_BALTHASAR_EXIT(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 999;
	condition = dia_balthasar_exit_condition;
	information = dia_balthasar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_balthasar_exit_condition()
{
	return TRUE;
};

func void dia_balthasar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BALTHASAR_HALLO(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 3;
	condition = dia_balthasar_hallo_condition;
	information = dia_balthasar_hallo_info;
	description = "Jak se vede?";
};


func int dia_balthasar_hallo_condition()
{
	return TRUE;
};

func void dia_balthasar_hallo_info()
{
	AI_Output(other,self,"DIA_Balthasar_HALLO_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_01");	//Ach, nov� tv�� na farm�. �e by mi nakonec ta star� dr�gre�le p�ece jen sehnala u�edn�ka?
	AI_Output(other,self,"DIA_Balthasar_HALLO_15_02");	//Nejsem ��dn� u�edn�k.
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_03");	//�, to vid�m. Nejsem u� tak mlad� jako d��v, v�ak v�. A u� l�ta �ek�m na n�koho, kdo by to po mn� p�evzal.
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_04");	//Ty tu asi nejse� kv�li tomu, �e jsou na�i sousedi na�tvan�, co?
};


instance DIA_BALTHASAR_WASMACHSTDU(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 4;
	condition = dia_balthasar_wasmachstdu_condition;
	information = dia_balthasar_wasmachstdu_info;
	description = "Co je tvoje pr�ce?";
};


func int dia_balthasar_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_hallo))
	{
		return TRUE;
	};
};

func void dia_balthasar_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Balthasar_WASMACHSTDU_15_00");	//Co je tvoje pr�ce?
	AI_Output(self,other,"DIA_Balthasar_WASMACHSTDU_05_01");	//�, hl�d�m ovce a d�l�m to tak dlouho, co si jen pamatuju.
	AI_Output(self,other,"DIA_Balthasar_WASMACHSTDU_05_02");	//Ta zv��ata jsou velmi oddan� a chytr�, v�ak v�. Kdy� se o n� dob�e star�, budou t� poslouchat a� do konce �ivota.
};


instance DIA_ADDON_BALTHASAR_RANGERBANDITS(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 5;
	condition = dia_addon_balthasar_rangerbandits_condition;
	information = dia_addon_balthasar_rangerbandits_info;
	description = "Nevid�ls kolem proj�d�t n�jak� bandity?";
};


func int dia_addon_balthasar_rangerbandits_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_hallo) && ((MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING) || (SC_KNOWSLUCIACAUGHTBYBANDITS == TRUE)))
	{
		return TRUE;
	};
};

func void dia_addon_balthasar_rangerbandits_info()
{
	AI_Output(other,self,"DIA_Addon_Balthasar_Rangerbandits_15_00");	//Nevid�ls kolem proj�d�t n�jak� bandity?
	AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_01");	//Najisto. Jeli kolem Sekobovy farmy n�kam na sever do les�.
	if(MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_02");	//Vezli mnoho a mnoho zbran�. Vypadali jako by cht�li vyhr�t sk�et� v�lku sami!
	};
	if(SC_KNOWSLUCIACAUGHTBYBANDITS == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_03");	//A jestli m� o�i nezklamaly, ti bastardi s sebou vlekli je�t� n�jakou mladou �enu.
		AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_04");	//Douf�m, �e j� neubl�ili.
	};
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_05");	//Jsem r�d, �e na�i farmu nechali napokoji.
};


instance DIA_BALTHASAR_AERGERMITNACHBARN(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 5;
	condition = dia_balthasar_aergermitnachbarn_condition;
	information = dia_balthasar_aergermitnachbarn_info;
	description = "Co m� za probl�my se sousedy?";
};


func int dia_balthasar_aergermitnachbarn_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_wasmachstdu) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && ((Npc_IsDead(balthasarsheep1) == FALSE) || (Npc_IsDead(balthasarsheep2) == FALSE) || (Npc_IsDead(balthasarsheep3) == FALSE)))
	{
		return TRUE;
	};
};

func void dia_balthasar_aergermitnachbarn_info()
{
	AI_Output(other,self,"DIA_Balthasar_AERGERMITNACHBARN_15_00");	//Co m� za probl�my se sousedy?
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_01");	//Tr�va na t�hle stran� l�nu je v�dycky zakrsl� a such�. Tak v�t�inou chod�m na pastviny jin�ch farm���.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_02");	//Velkostatk��i to nevad�, ale Bengar, farm�� z n�horn�ch pastvin, d�l� hroznej virv�l, kdy� tam vezmu na�e zv��ata.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_03");	//��k�, �e by mu m�l Sekob platit za to, �e beru ovce na Bengarovy pastviny.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_04");	//Ale Sekob na to nechce d�t ani zl�manou gre�li, tak�e u� d�l nem��u nahoru chodit.
};


instance DIA_BALTHASAR_WOBENGAR(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 10;
	condition = dia_balthasar_wobengar_condition;
	information = dia_balthasar_wobengar_info;
	description = "Kde bych na�el horn� pastviny a Bengarovu farmu?";
};


func int dia_balthasar_wobengar_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_aergermitnachbarn) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_balthasar_wobengar_info()
{
	AI_Output(other,self,"DIA_Balthasar_WOBENGAR_15_00");	//Kde bych na�el horn� pastviny a Bengarovu farmu?
	AI_Output(self,other,"DIA_Balthasar_WOBENGAR_05_01");	//Jdi po t�hle cest�, a� naraz� na k�i�ovatku.
	AI_Output(self,other,"DIA_Balthasar_WOBENGAR_05_02");	//Kdy� se d� napravo, uvid� hromadu balvan�. Napravo za nimi jsou n�horn� pastviny a pr�smyk.
};


instance DIA_BALTHASAR_TALKTOBENGAR(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 6;
	condition = dia_balthasar_talktobengar_condition;
	information = dia_balthasar_talktobengar_info;
	description = "Mo�n� bych si m�l promluvit s Bengarem.";
};


func int dia_balthasar_talktobengar_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_aergermitnachbarn) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && ((Npc_IsDead(balthasarsheep1) == FALSE) || (Npc_IsDead(balthasarsheep2) == FALSE) || (Npc_IsDead(balthasarsheep3) == FALSE)))
	{
		return TRUE;
	};
};

func void dia_balthasar_talktobengar_info()
{
	AI_Output(other,self,"DIA_Balthasar_TALKTOBENGAR_15_00");	//Mo�n� bych si m�l promluvit s Bengarem.
	AI_Output(self,other,"DIA_Balthasar_TALKTOBENGAR_05_01");	//Ty bys to pro m� ud�lal? Co mu �ekne�? Toti�, necht�l bych ��dn� probl�my, rozum�?
	AI_Output(other,self,"DIA_Balthasar_TALKTOBENGAR_15_02");	//Uvid�me.
	Log_CreateTopic(TOPIC_BALTHASARSSCHAFE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BALTHASARSSCHAFE,LOG_RUNNING);
	b_logentry(TOPIC_BALTHASARSSCHAFE,"Sedl�k Bengar zak�zal ov��ku Balthazarovi, aby sv� ovce vedl nahoru na pastviny.");
	MIS_BALTHASAR_BENGARSWEIDE = LOG_RUNNING;
};


instance DIA_BALTHASAR_BENGARUEBERREDET(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 8;
	condition = dia_balthasar_bengarueberredet_condition;
	information = dia_balthasar_bengarueberredet_info;
	description = "U� zase m��e� svoje ovce br�t na Bengarovy pastviny.";
};


func int dia_balthasar_bengarueberredet_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_talktobengar) && (MIS_BALTHASAR_BENGARSWEIDE == LOG_SUCCESS) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && ((Npc_IsDead(balthasarsheep1) == FALSE) || (Npc_IsDead(balthasarsheep2) == FALSE) || (Npc_IsDead(balthasarsheep3) == FALSE)))
	{
		return TRUE;
	};
};

func void dia_balthasar_bengarueberredet_info()
{
	AI_Output(other,self,"DIA_Balthasar_BENGARUEBERREDET_15_00");	//U� zase m��e� svoje ovce br�t na Bengarovy pastviny. Pr�v� jsem s n�m mluvil.
	AI_Output(self,other,"DIA_Balthasar_BENGARUEBERREDET_05_01");	//D�ky. Hned vyraz�m na cestu.
	AI_Output(self,other,"DIA_Balthasar_BENGARUEBERREDET_05_02");	//Tady, vezmi si na d�kaz m� vd��nosti tuhle ov�� k��i.
	b_giveinvitems(self,other,itat_sheepfur,10);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"BengarsWeide");
	b_giveplayerxp(XP_BALTHASAR_BENGARSWEIDE);
	Wld_InsertNpc(sheep,"NW_BIGMILL_FARM3_BALTHASAR");
	Wld_InsertNpc(sheep,"NW_BIGMILL_FARM3_BALTHASAR");
	Wld_InsertNpc(hammel,"NW_BIGMILL_FARM3_BALTHASAR");
	BALTHASARSHEEP1 = Hlp_GetNpc(balthasar_sheep1);
	if(Hlp_IsValidNpc(balthasarsheep1) && !Npc_IsDead(balthasarsheep1))
	{
		AI_StartState(balthasarsheep1,zs_mm_rtn_follow_sheep_balthasar,1,"");
	};
	BALTHASARSHEEP2 = Hlp_GetNpc(balthasar_sheep2);
	if(Hlp_IsValidNpc(balthasarsheep2) && !Npc_IsDead(balthasarsheep2))
	{
		AI_StartState(balthasarsheep2,zs_mm_rtn_follow_sheep_balthasar,1,"");
	};
	BALTHASARSHEEP3 = Hlp_GetNpc(balthasar_sheep3);
	if(Hlp_IsValidNpc(balthasarsheep3) && !Npc_IsDead(balthasarsheep3))
	{
		AI_StartState(balthasarsheep3,zs_mm_rtn_follow_sheep_balthasar,1,"");
	};
};


instance DIA_BALTHASAR_PERMKAP1(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 70;
	condition = dia_balthasar_permkap1_condition;
	information = dia_balthasar_permkap1_info;
	permanent = TRUE;
	description = "A co jinak. V�echno v po��dku?";
};


func int dia_balthasar_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_balthasar_permkap1_info()
{
	AI_Output(other,self,"DIA_Balthasar_PERMKAP1_15_00");	//A co jinak. V�echno v po��dku?
	Npc_PerceiveAll(self);
	if((Wld_DetectNpc(self,balthasar_sheep1,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,balthasar_sheep2,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,balthasar_sheep3,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,hammel,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)))
	{
		AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_01");	//Nem��u si st�ovat. D�ky za opt�n�.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_02");	//Jsou to te� t�k� �asy. Nem��u naj�t sv� ovce!
		if(Npc_IsDead(sekob) == FALSE)
		{
			AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_03");	//H�d�m, �e bych o tom m�l ��ct Sekobovi.
		};
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	};
};


instance DIA_BALTHASAR_PICKPOCKET(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 900;
	condition = dia_balthasar_pickpocket_condition;
	information = dia_balthasar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_balthasar_pickpocket_condition()
{
	return c_beklauen(10,10);
};

func void dia_balthasar_pickpocket_info()
{
	Info_ClearChoices(dia_balthasar_pickpocket);
	Info_AddChoice(dia_balthasar_pickpocket,DIALOG_BACK,dia_balthasar_pickpocket_back);
	Info_AddChoice(dia_balthasar_pickpocket,DIALOG_PICKPOCKET,dia_balthasar_pickpocket_doit);
};

func void dia_balthasar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_balthasar_pickpocket);
};

func void dia_balthasar_pickpocket_back()
{
	Info_ClearChoices(dia_balthasar_pickpocket);
};

