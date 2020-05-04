
func void b_daronsegen()
{
	var string concattext;
	var int bonus_1;
	var int bonus_2;
	var int bonus_3;
	DARON_SEGEN = TRUE;
	if(DARON_SPENDE < 100)
	{
		if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
		{
			other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
			PrintScreen(PRINT_FULLYHEALED,-1,-1,FONT_SCREEN,2);
		};
	}
	else if((DARON_SPENDE < 250) && (bonus_1 == FALSE))
	{
		b_raiseattribute(other,ATR_MANA_MAX,2);
		other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
		bonus_1 = TRUE;
	}
	else if((DARON_SPENDE < 500) && (bonus_2 == FALSE))
	{
		b_giveplayerxp(XP_AMBIENT);
		bonus_2 = TRUE;
	}
	else if((DARON_SPENDE >= 750) && (DARON_SPENDE < 1000) && (bonus_3 == FALSE))
	{
		other.lp = other.lp + 1;
		concattext = ConcatStrings(PRINT_LEARNLP,IntToString(1));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
		bonus_3 = TRUE;
	}
	else
	{
		other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
		other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
		other.attribute[ATR_HITPOINTS_MAX] = other.attribute[ATR_HITPOINTS_MAX] + 5;
		concattext = ConcatStrings(PRINT_LEARNHITPOINTS_MAX,IntToString(5));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
	};
};


instance DIA_DARON_EXIT(C_INFO)
{
	npc = kdf_511_daron;
	nr = 999;
	condition = dia_daron_exit_condition;
	information = dia_daron_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_daron_exit_condition()
{
	return TRUE;
};

func void dia_daron_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DARON_HALLO(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_daron_hallo_condition;
	information = dia_daron_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_daron_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_daron_hallo_info()
{
	AI_Output(self,other,"DIA_Daron_Hallo_10_00");	//Co pro tebe mohu ud�lat? Hled� duchovn� �t�chu?
	AI_Output(self,other,"DIA_Daron_Hallo_10_01");	//Chce� odeslat modlitbu na�emu P�nu Innosovi, nebo darovat kostelu n�jak� pen�ze?
};


instance DIA_DARON_PALADINE(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_daron_paladine_condition;
	information = dia_daron_paladine_info;
	permanent = FALSE;
	description = "Pot�eboval bych si promluvit s paladiny...";
};


func int dia_daron_paladine_condition()
{
	if((other.guild != GIL_KDF) && (KAPITEL < 2))
	{
		return TRUE;
	};
};

func void dia_daron_paladine_info()
{
	AI_Output(other,self,"DIA_Daron_Paladine_15_00");	//Pot�eboval bych si promluvit s paladiny. M��e� m� k nim n�jak dostat?
	AI_Output(self,other,"DIA_Daron_Paladine_10_01");	//No, bude� pot�ebovat povolen� ke vstupu do horn� ��sti m�sta. To v�ak maj� jen ob�an� m�sta a m�stsk� str�.
	AI_Output(self,other,"DIA_Daron_Paladine_10_02");	//A pochopiteln� my, ohniv� m�gov�.
	AI_Output(other,self,"DIA_Daron_Paladine_15_03");	//Jak bych se mohl st�t ohniv�m m�gem?
	AI_Output(self,other,"DIA_Daron_Paladine_10_04");	//Mus� se p�ipojit k na�emu ��du jako novic. A� bude� slou�it ur�it� �as, mo�n� bude� p�ijat do �ad m�g�.
	AI_Output(self,other,"DIA_Daron_Paladine_10_05");	//Tahle cesta je ov�em dlouh� a pln� pr�ce a studia.
};


instance DIA_DARON_ABOUTSEGEN(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_daron_aboutsegen_condition;
	information = dia_daron_aboutsegen_info;
	permanent = FALSE;
	description = "P�i�el jsem si pro tv� po�ehn�n�!";
};


func int dia_daron_aboutsegen_condition()
{
	if((MIS_THORBEN_GETBLESSINGS == LOG_RUNNING) && (PLAYER_ISAPPRENTICE == APP_NONE) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_daron_aboutsegen_info()
{
	AI_Output(other,self,"DIA_Daron_AboutSegen_15_00");	//P�i�el jsem si pro tv� po�ehn�n�!
	AI_Output(self,other,"DIA_Daron_AboutSegen_10_01");	//To je dob�e, to je dob�e - v tom p��pad� bys jist� cht�l p�isp�t n�jak�m t�m zla��kem ve prosp�ch svat� c�rkve Innosovy, �e?
	AI_Output(other,self,"DIA_Daron_AboutSegen_15_02");	//No, ve skute�nosti bych r�d dostal tv� po�ehn�n�, abych se mohl zapsat jako u�edn�k v doln� ��sti m�sta.
	if(DARON_SEGEN == TRUE)
	{
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_03");	//Ale j� u� ti sv� po�ehn�n� dal, m�j synu.
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_04");	//Nech� t� Innos doprov�z�, m�j synu!
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_05");	//Ale m�j synu! Bez p�im��en�ho daru c�rkvi ti po�ehn�n� d�t nemohu.
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_06");	//Jak jinak bych si mohl b�t jist� tv�mi dobr�mi �mysly?
	};
};


instance DIA_DARON_SPENDEN(C_INFO)
{
	npc = kdf_511_daron;
	nr = 3;
	condition = dia_daron_spenden_condition;
	information = dia_daron_spenden_info;
	permanent = FALSE;
	description = "Tak�e jak vysok� dar se tady v�t�inou d�v�?";
};


func int dia_daron_spenden_condition()
{
	if(hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_daron_spenden_info()
{
	AI_Output(other,self,"DIA_Daron_Spenden_15_00");	//Tak�e jak vysok� dar se tady v�t�inou d�v�?
	AI_Output(self,other,"DIA_Daron_Spenden_10_01");	//No, to z�le�� na tom, jak velk� majetek m�. Nech m� se pod�vat, kolik u sebe m�.
	AI_Output(self,other,"DIA_Daron_Spenden_10_02");	//(nahl�� do m�ce) Mmmmh hmmm...
	if(Npc_HasItems(other,itmi_gold) < 10)
	{
		AI_Output(self,other,"DIA_Daron_Spenden_10_03");	//Hm, jsi uboh� du�e, �e? Nech si to m�lo, co m�.
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron, m�g ohn�, mi necht�l po�ehnat. Nejsp� mu budu muset nejd��v poskytnout n�jak� zlato jako milodar.");
		};
	}
	else
	{
		if(Npc_HasItems(other,itmi_gold) < 50)
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_04");	//No, nem� mnoho, ale ani nejsi chud�. 10 zlat�ch pro Innose - �ijeme skromn�.
			b_giveinvitems(other,self,itmi_gold,10);
		}
		else if(Npc_HasItems(other,itmi_gold) < 100)
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_05");	//M� v�c ne� 50 zlat�ch. Daruj Innosovi 25 a dostane� jeho po�ehn�n�.
			b_giveinvitems(other,self,itmi_gold,25);
		}
		else
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_06");	//M� v�c ne� sto zlat�ch - P�n ��k�, �e kdy� m�, m�l bys d�t.
			AI_Output(self,other,"DIA_Daron_Spenden_10_07");	//C�rkev p�ij�m� tv�j �t�dr� dar.
			b_giveinvitems(other,self,itmi_gold,50);
		};
		AI_Output(self,other,"DIA_Daron_Spenden_10_08");	//�ehn�m ti ve jm�nu Innosov�. On je sv�tlo a spravedlnost.
		DARON_SEGEN = TRUE;
		b_giveplayerxp(XP_INNOSSEGEN);
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron, m�g ohn�, mi dal sv� po�ehn�n�.");
		};
	};
};


instance DIA_DARON_WOHER(C_INFO)
{
	npc = kdf_511_daron;
	nr = 9;
	condition = dia_daron_woher_condition;
	information = dia_daron_woher_info;
	permanent = FALSE;
	description = "Odkud jsi p�i�el?";
};


func int dia_daron_woher_condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_daron_woher_info()
{
	AI_Output(other,self,"DIA_Daron_Woher_15_00");	//Odkud jsi p�i�el?
	AI_Output(self,other,"DIA_Daron_Woher_10_01");	//P�ich�z�m z kl�tera m�g�, kter� le�� v hor�ch.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Daron_Woher_10_02");	//U n�s je v�t�n ka�d�, jeho� srdce je �ist� a c�t� pot�ebu slou�it na�emu v�emocn�mu P�nu Innosovi.
	};
};


instance DIA_DARON_INNOS(C_INFO)
{
	npc = kdf_511_daron;
	nr = 9;
	condition = dia_daron_innos_condition;
	information = dia_daron_innos_info;
	permanent = FALSE;
	description = "�ekni mi n�co o Innosovi.";
};


func int dia_daron_innos_condition()
{
	if(Npc_KnowsInfo(other,dia_daron_woher) && (other.guild != GIL_KDF) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_daron_innos_info()
{
	AI_Output(other,self,"DIA_Daron_Innos_15_00");	//�ekni mi n�co o Innosovi.
	AI_Output(self,other,"DIA_Daron_Innos_10_01");	//Innos, n� v�emocn� p�n, je sv�tlo a ohe�.
	AI_Output(self,other,"DIA_Daron_Innos_10_02");	//Rozhodl se, �e lid� budou jeho n�strojem, a dal jim magii a z�kony.
	AI_Output(self,other,"DIA_Daron_Innos_10_03");	//Jedn�me jeho jm�nem. Vykon�v�me spravedlnost dle jeho v�le a k�eme jeho slovo.
};


instance DIA_DARON_KLOSTER(C_INFO)
{
	npc = kdf_511_daron;
	nr = 9;
	condition = dia_daron_kloster_condition;
	information = dia_daron_kloster_info;
	permanent = FALSE;
	description = "Pov�z mi o kl�te�e.";
};


func int dia_daron_kloster_condition()
{
	if(Npc_KnowsInfo(other,dia_daron_woher) || (Npc_KnowsInfo(other,dia_daron_paladine) && (other.guild != GIL_NOV) && (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_daron_kloster_info()
{
	AI_Output(other,self,"DIA_Daron_Kloster_15_00");	//Pov�z mi o kl�te�e.
	AI_Output(self,other,"DIA_Daron_Kloster_10_01");	//U��me na�e studenty v�echny formy magie. Ale um�n� ohniv�ch m�g� spo��v� i v n��em jin�m ne� jen v tomhle.
	AI_Output(self,other,"DIA_Daron_Kloster_10_02");	//Jsme t� zb�hl� v um�n� alchymie a ve vytv��en� mocn�ch run.
	AI_Output(self,other,"DIA_Daron_Kloster_10_03");	//Tak� d�l�me skv�l� v�no.
};


instance DIA_DARON_STADT(C_INFO)
{
	npc = kdf_511_daron;
	nr = 99;
	condition = dia_daron_stadt_condition;
	information = dia_daron_stadt_info;
	permanent = FALSE;
	description = "Co d�l� ve m�st�?";
};


func int dia_daron_stadt_condition()
{
	if(Npc_KnowsInfo(other,dia_daron_woher))
	{
		return TRUE;
	};
};

func void dia_daron_stadt_info()
{
	AI_Output(other,self,"DIA_Daron_Stadt_15_00");	//Co d�l� ve m�st�?
	AI_Output(self,other,"DIA_Daron_Stadt_10_01");	//Vedu jedn�n� s paladiny a jsem n�pomocen ob�an�m radou a m��u tu tam ztratit slovo.
	AI_Output(self,other,"DIA_Daron_Stadt_10_02");	//Obzvl�t� v takov�chto t�k�ch dob�ch je na�� povinnost� b�t lidu ku pomoci a starat se o chud�.
};


instance DIA_ADDON_DARON_GUILDHELP(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_addon_daron_guildhelp_condition;
	information = dia_addon_daron_guildhelp_info;
	description = "Sly�el jsem n�co o t� so�ce. Jedin�, co to bylo je, �e jsi ji ztratil.";
};


func int dia_addon_daron_guildhelp_condition()
{
	if((MIS_ADDON_VATRAS_GO2DARON == LOG_RUNNING) && Npc_KnowsInfo(other,dia_daron_stadt))
	{
		return TRUE;
	};
};

func void dia_addon_daron_guildhelp_info()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_15_00");	//Sly�el jsem n�co o t� so�ce. Jedin�, co to bylo je, �e jsi ji ztratil.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_01");	//Taktak. Tos mohl sly�et pouze od m�ga Vody Vatrase.
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_15_02");	//Jak� je probl�m?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_03");	//Cenn� so�ka byla posl�na do kl�tera z pevniny. Nikdy jsem ji ale nedonesl do kl�tera.
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_15_04");	//Byla lo� vylod�na?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_05");	//(vyveden z m�ry) Ne. P�ist�la bezpe�n� v Khorinisu a bezpe�n� jsem ji vyzvedl.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_06");	//Nicm�n� skon�ila v rukou n�jak�ch goblin�, kdy� jsem ji nesl do kl�tera.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_07");	//(nevrle) Ned�vej se na m� takto. My m�gov� tak� nejsme neomyln�.
	MIS_ADDON_VATRAS_GO2DARON = LOG_SUCCESS;
	MIS_ADDON_DARON_GETSTATUE = LOG_RUNNING;
	Info_ClearChoices(dia_addon_daron_guildhelp);
	Info_AddChoice(dia_addon_daron_guildhelp,"��k�, �e ji nyn� maj� goblini?",dia_addon_daron_guildhelp_gobbos);
	Info_AddChoice(dia_addon_daron_guildhelp,"Kde jsi tu so�ku ztratil?",dia_addon_daron_guildhelp_wo);
	Info_AddChoice(dia_addon_daron_guildhelp,"Nezkou�els dostat tu so�ku zp�t?",dia_addon_daron_guildhelp_wiederholen);
};

func void dia_addon_daron_guildhelp_wiederholen()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_wiederholen_15_00");	//Nezkou�els dostat tu so�ku zp�tky?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_wiederholen_10_01");	//Samoz�ejm�! Prozkoumal jsem vstup do jeskyn�, ale bez �sp�chu.
};

func void dia_addon_daron_guildhelp_gobbos()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_gobbos_15_00");	//��k�, �e ji nyn� maj� goblini?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_gobbos_10_01");	//Vzali ji a zmizeli s n� kdesi v k�ov�.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_gobbos_10_02");	//U� jsem ji znovu nevid�l. Mohli se odplazit do n�jak� d�ry.
};

func void dia_addon_daron_guildhelp_wo()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_wo_15_00");	//Kde jsi tu so�ku ztratil?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_wo_10_01");	//Bl�zko Orlanovy hospody. Je to na cest� do kl�tera.
	Info_AddChoice(dia_addon_daron_guildhelp,"Sly�el jsem dost. Najdu to pro tebe.",dia_addon_daron_guildhelp_auftrag);
	Info_AddChoice(dia_addon_daron_guildhelp,"Orlanova hospoda? Kde je to?",dia_addon_daron_guildhelp_wotaverne);
};

func void dia_addon_daron_guildhelp_wotaverne()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_woTaverne_15_00");	//Orlanova hospoda? Kde to je?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_woTaverne_10_01");	//Vyjde� tady tou branou a p�jde� dokud neuvid� osam�l� bar�k.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_woTaverne_10_02");	//To je Orlanova hospoda. 'U mrtv� harpyje'.
};

func void dia_addon_daron_guildhelp_auftrag()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_auftrag_15_00");	//Sly�el jsem u� dost. Najdu tu so�ku.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_auftrag_10_01");	//A� t� Innos vede a odvr�t� od tebe v�echna nebezpe��, kter� na tebe ��haj� za t�mito vraty.
	Info_ClearChoices(dia_addon_daron_guildhelp);
	Log_CreateTopic(TOPIC_ADDON_RANGERHELPKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPKDF,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RANGERHELPKDF,"Daron byl okraden n�jak�mi gobliny. Od t� doby postr�d� cennou so�ku, kter� n�co pro kl�ter znamenala. Daron v���, �e goblini se skr�vaj� nedaleko hospody 'U mrtv� harpyje'.");
};


instance DIA_ADDON_DARON_FOUNDSTATUE(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_addon_daron_foundstatue_condition;
	information = dia_addon_daron_foundstatue_info;
	description = "Na�el jsem tvou so�ku.";
};


func int dia_addon_daron_foundstatue_condition()
{
	if(Npc_HasItems(other,itmi_lostinnosstatue_daron) && (DIA_GORAX_GOLD_PERM == FALSE) && (MIS_ADDON_DARON_GETSTATUE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_daron_foundstatue_info()
{
	AI_Output(other,self,"DIA_Addon_Daron_FoundStatue_15_00");	//Na�el jsem tu so�ku.
	AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_01");	//D�ky Innosovi!
	AI_Output(other,self,"DIA_Addon_Daron_FoundStatue_15_02");	//Co s t�m bude� d�lat nyn�?
	AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_03");	//P�ineslo mi to pouze ne�t�st�.
	AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_04");	//Dones to do kl�tera, synu.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_05");	//(Uznale) M��e� b�t vpu�t�n dovnit� jestli zasv�t� zbytek sv�ho �ivota kl�teru.
		AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_06");	//Ale jsem si jist; kdy� jsi ��dn� splnil M�J po�adavek, jsi u� p�ipraven, nen�li� pravda?
	};
	AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_07");	//Innos s tebou, synu!
};


instance DIA_ADDON_DARON_RETURNEDSTATUE(C_INFO)
{
	npc = kdf_511_daron;
	nr = 5;
	condition = dia_addon_daron_returnedstatue_condition;
	information = dia_addon_daron_returnedstatue_info;
	description = "Donesl jsem tu so�ku do kl�tera, nyn� m��e� v klidu odpo��vat.";
};


func int dia_addon_daron_returnedstatue_condition()
{
	if((DIA_GORAX_GOLD_PERM == TRUE) && (MIS_ADDON_DARON_GETSTATUE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_daron_returnedstatue_info()
{
	AI_Output(other,self,"DIA_Addon_Daron_ReturnedStatue_15_00");	//Donesl jsem tu so�ku do kl�tera, nyn� m��e� v klidu odpo��vat.
	AI_Output(self,other,"DIA_Addon_Daron_ReturnedStatue_10_01");	//Kone�n� dobr� zpr�va. A� t� Innos ochra�uje.
	AI_Output(self,other,"DIA_Addon_Daron_ReturnedStatue_10_02");	//P�ijmi toto jako malou odm�nu, synu.
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	TOPIC_END_RANGERHELPKDF = TRUE;
	b_giveplayerxp(XP_ADDON_REPORTLOSTINNOSSTATUE2DARON);
};


instance DIA_DARON_ARM(C_INFO)
{
	npc = kdf_511_daron;
	nr = 10;
	condition = dia_daron_arm_condition;
	information = dia_daron_arm_info;
	permanent = FALSE;
	description = "J� jsem chud�!";
};


func int dia_daron_arm_condition()
{
	if(Npc_KnowsInfo(other,dia_daron_stadt) && (Npc_HasItems(other,itmi_gold) < 10) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_daron_arm_info()
{
	AI_Output(other,self,"DIA_Daron_arm_15_00");	//J� jsem chud�!
	AI_Output(self,other,"DIA_Daron_arm_10_01");	//Vida, jsi bez pen�z. ��dn� div, v takov�to dob�. Vezmi si tyhle zla��ky, snad ti budou ku prosp�chu.
	AI_Output(self,other,"DIA_Daron_arm_10_02");	//Ale m�l by ses pokusit naj�t si pr�ci, pen�ze se k tob� pak jen pohrnou. A pak bys mohl obdarovat Innosovu c�rkev, stejn� jako ona obdarovala tebe.
	b_giveinvitems(self,other,itmi_gold,20);
};


instance DIA_DARON_SPENDE(C_INFO)
{
	npc = kdf_511_daron;
	nr = 990;
	condition = dia_daron_spende_condition;
	information = dia_daron_spende_info;
	permanent = TRUE;
	description = "R�d bych v�noval n�jak� dar.";
};


var int dia_daron_spende_permanent;

func int dia_daron_spende_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_DARON_SPENDE_PERMANENT == FALSE) && Npc_KnowsInfo(other,dia_daron_spenden) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_daron_spende_info()
{
	AI_Output(other,self,"DIA_Daron_Spende_15_00");	//R�d bych v�noval n�jak� dar.
	Info_ClearChoices(dia_daron_spende);
	if(DARON_SPENDE < 1000)
	{
		Info_AddChoice(dia_daron_spende,"Ale nem�m dost zlata... (ZP�T)",dia_daron_spende_back);
		Info_AddChoice(dia_daron_spende,"(50 zlat�ch)",dia_daron_spende_50);
		Info_AddChoice(dia_daron_spende,"(100 zlat�ch)",dia_daron_spende_100);
		Info_AddChoice(dia_daron_spende,"(200 zlat�ch)",dia_daron_spende_200);
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_10_01");	//Celkem jsi mi daroval v�ce ne� 1000 zlat�ch.
		AI_Output(self,other,"DIA_Daron_Spende_10_02");	//Po�ehn�n� P�na Innose bude neust�le s tebou.
		DIA_DARON_SPENDE_PERMANENT = TRUE;
		b_daronsegen();
	};
};

func void dia_daron_spende_back()
{
	AI_Output(other,self,"DIA_Daron_Spende_BACK_15_00");	//Ale nep�inesl jsem dost pen�z.
	AI_Output(self,other,"DIA_Daron_Spende_BACK_10_01");	//To nevad�, m�j synu. M��e� d�t pozd�ji, kolik jen bude� cht�t.
	Info_ClearChoices(dia_daron_spende);
};


var int daron_spende;

func void dia_daron_spende_50()
{
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Daron_Spende_50_10_00");	//�ehn�m ti ve jm�nu Innosov�. On je sv�tlo a spravedlnost.
		DARON_SPENDE = DARON_SPENDE + 50;
		b_daronsegen();
		DARON_SEGEN = TRUE;
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron, m�g ohn�, mi dal sv� po�ehn�n�.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_50_10_01");	//Sv�j dar m��e� d�t kdykoliv pozd�ji, a� u sebe bude� m�t dost pen�z.
	};
	Info_ClearChoices(dia_daron_spende);
};

func void dia_daron_spende_100()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Daron_Spende_100_10_00");	//Innosi, jsi sv�tlo, je� z��� na cestu spravedliv�ch.
		AI_Output(self,other,"DIA_Daron_Spende_100_10_01");	//Tv�m jm�nem �ehn�m tomuto mu�i. Nech� na n�j z��� tv� sv�tlo.
		DARON_SPENDE = DARON_SPENDE + 100;
		b_daronsegen();
		DARON_SEGEN = TRUE;
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron, m�g ohn�, mi dal sv� po�ehn�n�.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_100_10_02");	//P�n ��k� - chce�-li se modlit, otev�i svou du�i. A chce�-li v�novat dar, p�ines jej s sebou.
	};
	Info_ClearChoices(dia_daron_spende);
};

func void dia_daron_spende_200()
{
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Daron_Spende_200_10_00");	//Innos, po�ehnej tomuto mu�i. Nech� na n�j z��� tv� sv�tlo.
		AI_Output(self,other,"DIA_Daron_Spende_200_10_01");	//Dej mu s�lu chovat se spravedliv�.
		DARON_SPENDE = DARON_SPENDE + 200;
		b_daronsegen();
		DARON_SEGEN = TRUE;
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron, m�g ohn�, mi dal sv� po�ehn�n�.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_200_10_02");	//Pokud bys cht�l darovat tolik pen�z, m�l bys je s sebou tak� p�in�st.
	};
	Info_ClearChoices(dia_daron_spende);
};


instance DIA_DARON_PICKPOCKET(C_INFO)
{
	npc = kdf_511_daron;
	nr = 900;
	condition = dia_daron_pickpocket_condition;
	information = dia_daron_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_daron_pickpocket_condition()
{
	return c_beklauen(47,80);
};

func void dia_daron_pickpocket_info()
{
	Info_ClearChoices(dia_daron_pickpocket);
	Info_AddChoice(dia_daron_pickpocket,DIALOG_BACK,dia_daron_pickpocket_back);
	Info_AddChoice(dia_daron_pickpocket,DIALOG_PICKPOCKET,dia_daron_pickpocket_doit);
};

func void dia_daron_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_daron_pickpocket);
};

func void dia_daron_pickpocket_back()
{
	Info_ClearChoices(dia_daron_pickpocket);
};

