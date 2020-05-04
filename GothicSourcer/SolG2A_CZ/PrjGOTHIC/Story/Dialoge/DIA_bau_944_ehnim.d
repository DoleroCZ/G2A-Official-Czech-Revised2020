
instance DIA_EHNIM_EXIT(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 999;
	condition = dia_ehnim_exit_condition;
	information = dia_ehnim_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ehnim_exit_condition()
{
	return TRUE;
};

func void dia_ehnim_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_HALLO(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 3;
	condition = dia_ehnim_hallo_condition;
	information = dia_ehnim_hallo_info;
	description = "Kdo jsi?";
};


func int dia_ehnim_hallo_condition()
{
	return TRUE;
};

func void dia_ehnim_hallo_info()
{
	AI_Output(other,self,"DIA_Ehnim_HALLO_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Ehnim_HALLO_12_01");	//Jmenuju se Ehnim. Jsem jedn�m z n�mezdn�ch roln�k�.
	if(Hlp_IsValidNpc(egill) && !c_npcisdown(egill))
	{
		AI_Output(self,other,"DIA_Ehnim_HALLO_12_02");	//A t�mhleten prcek je m�j bratr Egill.
	};
	AI_Output(self,other,"DIA_Ehnim_HALLO_12_03");	//U� tady na farm� pracuju pro Akila n�kolik let.
};


instance DIA_EHNIM_FELDARBEIT(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 4;
	condition = dia_ehnim_feldarbeit_condition;
	information = dia_ehnim_feldarbeit_info;
	description = "Jak jdou poln� pr�ce?";
};


func int dia_ehnim_feldarbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_ehnim_hallo))
	{
		return TRUE;
	};
};

func void dia_ehnim_feldarbeit_info()
{
	AI_Output(other,self,"DIA_Ehnim_FELDARBEIT_15_00");	//Jak jdou poln� pr�ce?
	AI_Output(self,other,"DIA_Ehnim_FELDARBEIT_12_01");	//Chce� pomoct? T�mhle je dal�� motyka. Vezmi si ji a vyraz na pole.
	AI_Output(self,other,"DIA_Ehnim_FELDARBEIT_12_02");	//M�l by ses jen m�t na pozoru p�ed poln�mi �k�dci. Utrhnou ti ruku, ani nemrkne�.
};


instance DIA_EHNIM_FELDRAEUBER(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 5;
	condition = dia_ehnim_feldraeuber_condition;
	information = dia_ehnim_feldraeuber_info;
	description = "Pro� s t�mi �k�dci n�co neud�l�te?";
};


func int dia_ehnim_feldraeuber_condition()
{
	if(Npc_KnowsInfo(other,dia_ehnim_feldarbeit))
	{
		return TRUE;
	};
};

func void dia_ehnim_feldraeuber_info()
{
	AI_Output(other,self,"DIA_Ehnim_FELDRAEUBER_15_00");	//Pro� s t�mi �k�dci n�co neud�l�te?
	AI_Output(self,other,"DIA_Ehnim_FELDRAEUBER_12_01");	//Zabil u� jsem jich v�c, ne� dok�u spo��tat. Jedinej probl�m je, �e zase p�ijdou dal��.
};


instance DIA_EHNIM_STREIT1(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 6;
	condition = dia_ehnim_streit1_condition;
	information = dia_ehnim_streit1_info;
	description = "Tv�j bratr mi ��kal to sam�.";
};


func int dia_ehnim_streit1_condition()
{
	if(Npc_KnowsInfo(other,dia_egill_feldraeuber) && Npc_KnowsInfo(other,dia_ehnim_feldraeuber) && (Npc_KnowsInfo(other,dia_egill_streit2) == FALSE) && (Hlp_IsValidNpc(egill) && !c_npcisdown(egill)))
	{
		return TRUE;
	};
};

func void dia_ehnim_streit1_info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT1_15_00");	//Tv�j bratr mi ��kal to sam�.
	AI_Output(self,other,"DIA_Ehnim_STREIT1_12_01");	//Co? Ten sralbotka? V�dycky se vytrat� hned, jak se ty bestie objev� na na�em pozemku.
	AI_Output(self,other,"DIA_Ehnim_STREIT1_12_02");	//Nem�l by ��kat takov� nesmysly.
};


instance DIA_EHNIM_STREIT3(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 7;
	condition = dia_ehnim_streit3_condition;
	information = dia_ehnim_streit3_info;
	description = "Tv�j bratr si mysl�, �e se akor�t vytahuje�.";
};


func int dia_ehnim_streit3_condition()
{
	if(Npc_KnowsInfo(other,dia_egill_streit2) && (Hlp_IsValidNpc(egill) && !c_npcisdown(egill)))
	{
		return TRUE;
	};
};

func void dia_ehnim_streit3_info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT3_15_00");	//Tv�j bratr si mysl�, �e se akor�t vytahuje�.
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_01");	//Co? To m� v�n� odvahu tohle ��ct?
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_02");	//Rad�j by si m�l d�vat pozor, ne� mu u�t�d��m po��dnou lekci.
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_03");	//Tak mu to b� ��ct.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_STREIT5(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 8;
	condition = dia_ehnim_streit5_condition;
	information = dia_ehnim_streit5_info;
	permanent = TRUE;
	description = "M�m dojem, �e byste se m�li oba trochu zklidnit.";
};


var int dia_ehnim_streit5_noperm;

func int dia_ehnim_streit5_condition()
{
	if(Npc_KnowsInfo(other,dia_egill_streit4) && (Hlp_IsValidNpc(egill) && !c_npcisdown(egill)) && (DIA_EHNIM_STREIT5_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_ehnim_streit5_info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_15_00");	//M�m dojem, �e byste se m�li oba trochu zklidnit.
	AI_Output(self,other,"DIA_Ehnim_STREIT5_12_01");	//Ten bastard to je�t� nevzdal, co?
	AI_Output(self,other,"DIA_Ehnim_STREIT5_12_02");	//J� ho roztrhnu. �ekni mu to.
	Info_ClearChoices(dia_ehnim_streit5);
	Info_AddChoice(dia_ehnim_streit5,"D�lej si, co chce�. Odch�z�m.",dia_ehnim_streit5_gehen);
	Info_AddChoice(dia_ehnim_streit5,"Pro� mu to ne�ekne� s�m?",dia_ehnim_streit5_attack);
};

func void dia_ehnim_streit5_attack()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_Attack_15_00");	//Pro� mu to ne�ekne� s�m?
	AI_Output(self,other,"DIA_Ehnim_STREIT5_Attack_12_01");	//To p�esn� ud�l�m.
	AI_StopProcessInfos(self);
	DIA_EHNIM_STREIT5_NOPERM = TRUE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	b_attack(self,egill,AR_NONE,0);
	b_giveplayerxp(XP_EGILLEHNIMSTREIT);
};

func void dia_ehnim_streit5_gehen()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_gehen_15_00");	//D�lej si, co chce�. Odch�z�m.
	AI_Output(self,other,"DIA_Ehnim_STREIT5_gehen_12_01");	//Jo, jen se rychle ztra�.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_PERMKAP1(C_INFO)
{
	npc = bau_944_ehnim;
	condition = dia_ehnim_permkap1_condition;
	information = dia_ehnim_permkap1_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_ehnim_permkap1_condition()
{
	if((DIA_EHNIM_STREIT5_NOPERM == TRUE) && Npc_IsInState(self,zs_talk) && ((KAPITEL < 3) || (hero.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_ehnim_permkap1_info()
{
	AI_Output(self,other,"DIA_Ehnim_PERMKAP1_12_00");	//Chce� d�lat dal�� probl�my? M�m dojem, �e bude lep��, kdy� se hned ztrat�.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_MOLERATFETT(C_INFO)
{
	npc = bau_944_ehnim;
	condition = dia_ehnim_moleratfett_condition;
	information = dia_ehnim_moleratfett_info;
	important = TRUE;
};


func int dia_ehnim_moleratfett_condition()
{
	if((DIA_EHNIM_STREIT5_NOPERM == TRUE) && (KAPITEL >= 3) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_ehnim_moleratfett_info()
{
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_00");	//Ty jsi tu JE�T�.
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_15_01");	//Vypad� to tak. Po��d vyto�enej?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_02");	//Nic se ned�je, zapome� na to. �ekni, byl jsi posledn� dobou na Lobartov� farm�?
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_15_03");	//Mo�n�. Pro�?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_04");	//�, nic d�le�it�ho. Jen jsem cht�l mluvit s Vinem o jeho pal�rn�.
	Info_ClearChoices(dia_ehnim_moleratfett);
	Info_AddChoice(dia_ehnim_moleratfett,"Pr�v� te� nem�m �as.",dia_ehnim_moleratfett_nein);
	Info_AddChoice(dia_ehnim_moleratfett,"Pal�rna? Jak� pal�rna?",dia_ehnim_moleratfett_was);
	if(Npc_IsDead(vino))
	{
		Info_AddChoice(dia_ehnim_moleratfett,"Vino je mrtv�.",dia_ehnim_moleratfett_tot);
	};
};

func void dia_ehnim_moleratfett_tot()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_tot_15_00");	//Vino je mrtv�.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_tot_12_01");	//Proboha. No nic. Tak to se ned� nic d�lat.
};

func void dia_ehnim_moleratfett_was()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_15_00");	//Pal�rna? Jak� pal�rna?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_01");	//�. Asi jsem to nem�l ��kat. Vino byl na to sv� mal� tajemstv� v�dycky hodn� citliv�.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_02");	//Ale te� jsem si to nechal vyklouznout. Tam vzadu v lese si Vino za��dil tajnou pal�rnu.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_03");	//Ned�vno m� ��dal o n�co, ��m by mohl promazat padac� m��.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_04");	//V posledn� dob� hodn� pr�elo a za�ala ho zlobit rez. Te� je navij�k zaseknut� a nikdo u� se tam nedostane. To jsme v p�kn� brynd�.
	Log_CreateTopic(TOPIC_FOUNDVINOSKELLEREI,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FOUNDVINOSKELLEREI,LOG_RUNNING);
	b_logentry(TOPIC_FOUNDVINOSKELLEREI,"Podle Ehnima se Vino st�le ukr�v� v les�ch pobl� Akilova statku. Ale mechanismus dve�� je zad�en� a dokud jej nenama�u krysokrt�m s�dlem, dovnit� se nedostanu.");
	Info_AddChoice(dia_ehnim_moleratfett,"A? M� n�jak� mazivo?",dia_ehnim_moleratfett_was_fett);
};

func void dia_ehnim_moleratfett_was_fett()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_15_00");	//A? M� n�jak� mazivo?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_12_01");	//Jo, jasn�. Nejlep��, co se tu d� sehnat. Krysokrt� s�dlo. P��ern� v�c, to ti pov�m. Taky se pou��v� na promaz�n� lodn�ch d�l.
	Info_AddChoice(dia_ehnim_moleratfett,"Prodej mi ten tuk.",dia_ehnim_moleratfett_was_fett_habenwill);
};


var int ehnim_moleratfettoffer;

func void dia_ehnim_moleratfett_was_fett_habenwill()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_00");	//Prodej mi ten tuk.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_01");	//To nebude levn�, k�mo. V tomhle kraji to je zatracen� vz�cn� v�c.
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_02");	//Kolik?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_03");	//Mmh. 100 zlat�ch?
	EHNIM_MOLERATFETTOFFER = 100;
	Info_ClearChoices(dia_ehnim_moleratfett);
	Info_AddChoice(dia_ehnim_moleratfett,"To je p��li�.",dia_ehnim_moleratfett_was_fett_habenwill_zuviel);
	Info_AddChoice(dia_ehnim_moleratfett,"Dohodnuto.",dia_ehnim_moleratfett_was_fett_habenwill_ja);
};

func void dia_ehnim_moleratfett_was_fett_habenwill_ja()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_15_00");	//Dohodnuto.
	if(b_giveinvitems(other,self,itmi_gold,EHNIM_MOLERATFETTOFFER))
	{
		AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_01");	//Dobr�. Tady to m�.
		if(Npc_HasItems(self,itmi_moleratlubric_mis))
		{
			b_giveinvitems(self,other,itmi_moleratlubric_mis,1);
			if(Npc_IsDead(vino) == FALSE)
			{
				AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_02");	//(pro sebe) Zatracen�. Vino m� zabije.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_03");	//Sakra, kam jsme se to dostali? To je zatracen� mrzut� v�c. Tak fajn, promi�. Jak se zd�, u� to nem�m. Vem si sv� prachy zp�tky.
			b_giveinvitems(self,other,itmi_gold,EHNIM_MOLERATFETTOFFER);
			if(Npc_IsDead(egill) == FALSE)
			{
				AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_04");	//Vsad�m se, �e to m�j br�cha ud�l� znovu. Ten bastard.
				AI_StopProcessInfos(self);
				other.aivar[AIV_INVINCIBLE] = FALSE;
				b_attack(self,egill,AR_NONE,0);
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_05");	//No to je bezvadn�. Nejd��v chce� ud�lat velkej k�eft a pak nem� dost prach�. Ztra� se.
	};
	AI_StopProcessInfos(self);
};

func void dia_ehnim_moleratfett_was_fett_habenwill_zuviel()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_15_00");	//To je p��li�.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_12_01");	//Fajn, fajn. Tak teda 70 zlat�ch. Ale to je moje posledn� nab�dka.
	EHNIM_MOLERATFETTOFFER = 70;
	Info_ClearChoices(dia_ehnim_moleratfett);
	Info_AddChoice(dia_ehnim_moleratfett,"To je je�t� po��d moc.",dia_ehnim_moleratfett_was_fett_habenwill_zuviel_immernoch);
	Info_AddChoice(dia_ehnim_moleratfett,"Dohodnuto.",dia_ehnim_moleratfett_was_fett_habenwill_ja);
};

func void dia_ehnim_moleratfett_was_fett_habenwill_zuviel_immernoch()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_immernoch_15_00");	//To je je�t� po��d moc.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_immernoch_12_01");	//(na�tvan�) Tak si trhni. M�j se.
	AI_StopProcessInfos(self);
};

func void dia_ehnim_moleratfett_nein()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_nein_15_00");	//Pr�v� te� nem�m �as.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_nein_12_01");	//Nenech se zdr�ovat, chlape.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_PERMKAP3(C_INFO)
{
	npc = bau_944_ehnim;
	condition = dia_ehnim_permkap3_condition;
	information = dia_ehnim_permkap3_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_ehnim_permkap3_condition()
{
	if(Npc_KnowsInfo(other,dia_ehnim_moleratfett) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_ehnim_permkap3_info()
{
	AI_Output(self,other,"DIA_Ehnim_PERMKAP3_12_00");	//Te� nem�m �as.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_PICKPOCKET(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 900;
	condition = dia_ehnim_pickpocket_condition;
	information = dia_ehnim_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_ehnim_pickpocket_condition()
{
	return c_beklauen(76,35);
};

func void dia_ehnim_pickpocket_info()
{
	Info_ClearChoices(dia_ehnim_pickpocket);
	Info_AddChoice(dia_ehnim_pickpocket,DIALOG_BACK,dia_ehnim_pickpocket_back);
	Info_AddChoice(dia_ehnim_pickpocket,DIALOG_PICKPOCKET,dia_ehnim_pickpocket_doit);
};

func void dia_ehnim_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ehnim_pickpocket);
};

func void dia_ehnim_pickpocket_back()
{
	Info_ClearChoices(dia_ehnim_pickpocket);
};

