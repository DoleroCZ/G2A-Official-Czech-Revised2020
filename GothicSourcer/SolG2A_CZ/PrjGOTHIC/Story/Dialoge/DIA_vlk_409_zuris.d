
instance DIA_ZURIS_EXIT(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 999;
	condition = dia_zuris_exit_condition;
	information = dia_zuris_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_zuris_exit_condition()
{
	return TRUE;
};

func void dia_zuris_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ZURIS_PICKPOCKET(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 900;
	condition = dia_zuris_pickpocket_condition;
	information = dia_zuris_pickpocket_info;
	permanent = TRUE;
	description = "(Lektvar mu m��e� ukr�st velmi snadno.)";
};


func int dia_zuris_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (40 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_zuris_pickpocket_info()
{
	Info_ClearChoices(dia_zuris_pickpocket);
	Info_AddChoice(dia_zuris_pickpocket,DIALOG_BACK,dia_zuris_pickpocket_back);
	Info_AddChoice(dia_zuris_pickpocket,DIALOG_PICKPOCKET,dia_zuris_pickpocket_doit);
};

func void dia_zuris_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		CreateInvItems(self,itpo_health_03,1);
		b_giveinvitems(self,other,itpo_health_03,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_zuris_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_zuris_pickpocket_back()
{
	Info_ClearChoices(dia_zuris_pickpocket);
};


instance DIA_ZURIS_SPERRE(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 2;
	condition = dia_zuris_sperre_condition;
	information = dia_zuris_sperre_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_zuris_sperre_condition()
{
	if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_zuris_sperre_info()
{
	AI_Output(self,other,"DIA_Zuris_Sperre_14_00");	//Jsi b�val� trestanec z t�a�sk� kolonie. Odpal!
	AI_StopProcessInfos(self);
};


instance DIA_ZURIS_GREET(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 2;
	condition = dia_zuris_greet_condition;
	information = dia_zuris_greet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_zuris_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CANTHAR_SPERRE == FALSE) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_zuris_greet_info()
{
	AI_Output(self,other,"DIA_Zuris_GREET_14_00");	//Jsem Zuris, mistr lektvar�.
	AI_Output(self,other,"DIA_Zuris_GREET_14_01");	//Pot�ebuje� esenci hojiv� s�ly nebo n�jak� magick� elix�r? Pak jsi na spr�vn�m m�st�.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Zuris prod�v� na tr�i�ti lektvary.");
};


var int zuris_einmal;

instance DIA_ZURIS_WAREZ(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 2;
	condition = dia_zuris_warez_condition;
	information = dia_zuris_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Uka� mi sv� zbo��.";
};


func int dia_zuris_warez_condition()
{
	return TRUE;
};

func void dia_zuris_warez_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Zuris_WAREZ_15_00");	//Uka� mi sv� zbo��.
	if((ZURIS_EINMAL == FALSE) && !Npc_KnowsInfo(other,dia_zuris_potions))
	{
		AI_Output(self,other,"DIA_Zuris_GREET_14_02");	//Pr�v� jsem dostal n�jak� nov� lektvary. M�j host - ohniv� m�g, mistr Daron - mi je donesl p��mo z kl�tera.
		ZURIS_EINMAL = TRUE;
	};
};


instance DIA_ZURIS_POTIONS(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 2;
	condition = dia_zuris_potions_condition;
	information = dia_zuris_potions_info;
	permanent = FALSE;
	description = "M�ch� si tak� n�jak� vlastn� elix�ry?";
};


func int dia_zuris_potions_condition()
{
	if(Npc_KnowsInfo(hero,dia_zuris_greet))
	{
		return TRUE;
	};
};

func void dia_zuris_potions_info()
{
	AI_Output(other,self,"DIA_Zuris_POTIONS_15_00");	//M�ch� si tak� n�jak� vlastn� elix�ry?
	AI_Output(self,other,"DIA_Zuris_POTIONS_14_01");	//Ne, bu� je dost�v�m z kl�tera, nebo si je kupuji u alchymisty Constantina.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Zuris_POTIONS_14_02");	//Pokud t� zaj�m� m�ch�n� lektvar�, pak nev�hej a promluv si s n�m. N�jak�ho pomocn�ka jist� pot�ebuje.
		AI_Output(self,other,"DIA_Zuris_POTIONS_14_03");	//Ale je moc um�n�n�, ne� aby si n�koho najal s�m. Je pali�at� jak mezek.
	};
	AI_Output(self,other,"DIA_Zuris_Add_14_00");	//Kdy� jde trhat ty sv� rostliny, v�dycky proch�z� p��mo kolem m�.
};


instance DIA_ZURIS_KRAUT(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 2;
	condition = dia_zuris_kraut_condition;
	information = dia_zuris_kraut_info;
	permanent = FALSE;
	description = "Kde p�esn� Constantino ty sv� byliny sb�r�?";
};


func int dia_zuris_kraut_condition()
{
	if(Npc_KnowsInfo(other,dia_zuris_potions))
	{
		return TRUE;
	};
};

func void dia_zuris_kraut_info()
{
	AI_Output(other,self,"DIA_Zuris_Add_15_01");	//Kde p�esn� Constantino ty sv� byliny sb�r�?
	AI_Output(self,other,"DIA_Zuris_Add_14_02");	//Poka�d� projde tady v�chodn� branou a pak zmiz� v divo�in� nalevo.
	AI_Output(self,other,"DIA_Zuris_Add_14_03");	//Jednou mi vykl�dal, �e tu roste skoro v�echno krom� kr�lovsk�ho ��ov�ku.
	Wld_InsertItem(itpl_mana_herb_01,"FP_ITEM_HERB_01");
	Wld_InsertItem(itpl_mana_herb_02,"FP_ITEM_HERB_02");
	Wld_InsertItem(itpl_mana_herb_03,"FP_ITEM_HERB_03");
	Wld_InsertItem(itpl_health_herb_01,"FP_ITEM_HERB_04");
	Wld_InsertItem(itpl_health_herb_02,"FP_ITEM_HERB_05");
	Wld_InsertItem(itpl_health_herb_03,"FP_ITEM_HERB_06");
	Wld_InsertItem(itpl_speed_herb_01,"FP_ITEM_HERB_07");
	Wld_InsertItem(itpl_temp_herb,"FP_ITEM_HERB_08");
	Wld_InsertItem(itpl_strength_herb_01,"FP_ITEM_HERB_09");
	Wld_InsertItem(itpl_dex_herb_01,"FP_ITEM_HERB_10");
};


instance DIA_ZURIS_KRONSTOECKEL(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 2;
	condition = dia_zuris_kronstoeckel_condition;
	information = dia_zuris_kronstoeckel_info;
	permanent = FALSE;
	description = "Zm�nil se Constantino n�kdy, kde hledat kr�lovsk� ��ov�k?";
};


func int dia_zuris_kronstoeckel_condition()
{
	if(Npc_KnowsInfo(other,dia_zuris_kraut))
	{
		return TRUE;
	};
};

func void dia_zuris_kronstoeckel_info()
{
	AI_Output(other,self,"DIA_Zuris_Add_15_04");	//Zm�nil se Constantino n�kdy, kde hledat kr�lovsk� ��ov�k?
	AI_Output(self,other,"DIA_Zuris_Add_14_05");	//Jednou jsem sly�el, jak ��k�, �e ten nejlep�� roste pobl� kamenn�ch kruh�.
	AI_Output(self,other,"DIA_Zuris_Add_14_06");	//U Lobartova statku - to je kousek od druh� br�ny - se jeden takov� kamenn� kruh nach�z�.
	AI_Output(self,other,"DIA_Zuris_Add_14_07");	//Mysl�m, �e le�� na kopci. D��v to b�valo n�jak� poh�ebi�t� nebo tak n�co.
	Wld_InsertItem(itpl_perm_herb,"FP_ITEM_HERB_11");
};


instance DIA_ZURIS_WHERE(C_INFO)
{
	npc = vlk_409_zuris;
	condition = dia_zuris_where_condition;
	information = dia_zuris_where_info;
	permanent = FALSE;
	description = "Kde bych Constantina na�el?";
};


func int dia_zuris_where_condition()
{
	if(Npc_KnowsInfo(hero,dia_zuris_potions) && (constantino.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_zuris_where_info()
{
	AI_Output(other,self,"DIA_Zuris_WHERE_15_00");	//Kde bych Constantina na�el?
	AI_Output(self,other,"DIA_Zuris_WHERE_14_01");	//Jeho obydl� najde� v pr�chodu pobl� Haradovy kov�rny. Ur�it� ho nemine�.
};


instance DIA_ZURIS_KLOSTER(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 2;
	condition = dia_zuris_kloster_condition;
	information = dia_zuris_kloster_info;
	description = "Pov�z mi n�co o kl�te�e.";
};


func int dia_zuris_kloster_condition()
{
	if(ZURIS_EINMAL == TRUE)
	{
		return FALSE;
	};
};

func void dia_zuris_kloster_info()
{
	AI_Output(other,self,"DIA_Zuris_Kloster_14_00");	//Pov�z mi n�co o kl�te�e.
	AI_Output(self,other,"DIA_Zuris_Kloster_14_01");	//O tom by sis m�l rad�i pohovo�it p��mo s Daronem. Ten v� daleko v�c ne� j�.
};


instance DIA_ZURIS_MINENANTEIL(C_INFO)
{
	npc = vlk_409_zuris;
	nr = 3;
	condition = dia_zuris_minenanteil_condition;
	information = dia_zuris_minenanteil_info;
	description = "Ty prod�v� d�ln� akcie?";
};


func int dia_zuris_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_zuris_minenanteil_info()
{
	AI_Output(other,self,"DIA_Zuris_Minenanteil_15_00");	//Ty prod�v� d�ln� akcie?
	AI_Output(self,other,"DIA_Zuris_Minenanteil_14_01");	//Ano, n�kter� �ly ale rapidn� dol�. To je naposled, co jsem se pustil do n��eho takhle podez�el�ho!
	b_giveplayerxp(XP_AMBIENT);
};

