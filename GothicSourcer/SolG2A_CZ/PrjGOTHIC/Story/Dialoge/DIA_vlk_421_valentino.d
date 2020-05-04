
instance DIA_VALENTINO_EXIT(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 999;
	condition = dia_valentino_exit_condition;
	information = dia_valentino_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_valentino_exit_condition()
{
	return TRUE;
};

func void dia_valentino_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VALENTINO_HALLO(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 1;
	condition = dia_valentino_hallo_condition;
	information = dia_valentino_hallo_info;
	permanent = FALSE;
	description = "Tak�e copak to tu m�me?";
};


func int dia_valentino_hallo_condition()
{
	return TRUE;
};

func void dia_valentino_hallo_info()
{
	AI_Output(other,self,"DIA_Valentino_HALLO_15_00");	//Tak�e copak to tu m�me?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Valentino_HALLO_03_01");	//Jmenuji se Valentino. Sna��m se, abych tento den, kter� mi Innos dal, neznesv�til ��dnou prac�.
		AI_Output(other,self,"DIA_Valentino_HALLO_15_02");	//D�vej pozor na to, co ��k�.
		AI_Output(self,other,"DIA_Valentino_HALLO_03_03");	//Ach, omluv m�. Necht�l jsem Tvou Milost nijak urazit, �, pros�m za odpu�t�n�, pane.
	}
	else
	{
		AI_Output(self,other,"DIA_Valentino_HALLO_03_04");	//Copak se neum� chovat? To je nechutn�!
		AI_Output(self,other,"DIA_Valentino_HALLO_03_05");	//Po��d tahle �pinav� ch�tra! Nem� b�t n�hodou n�kde v pr�ci?
		AI_Output(self,other,"DIA_Valentino_HALLO_03_06");	//Ale po��t�m, �e takov�ho o�unt�l�ho chl�pka jako ty si ka�d� v�imne, co?
		AI_Output(self,other,"DIA_Valentino_HALLO_03_07");	//No, a� bude� m�t tolik zlata jako j�, taky nebude� muset v�bec pracovat. Ale ty nikdy takhle bohat� nebude�.
		AI_Output(other,self,"DIA_Valentino_HALLO_15_08");	//Vid�m, �e s tebou si u�iju po��dnou srandu.
	};
};


instance DIA_VALENTINO_WHOAGAIN(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 2;
	condition = dia_valentino_whoagain_condition;
	information = dia_valentino_whoagain_info;
	permanent = FALSE;
	description = "Ptal jsem se t�, kdo jsi!";
};


func int dia_valentino_whoagain_condition()
{
	if(Npc_KnowsInfo(other,dia_valentino_hallo) && (other.guild != GIL_KDF) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_valentino_whoagain_info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_01");	//Ptal jsem se t�, kdo jsi!
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_01");	//Jsem �vih�k Valentino. Bonviv�n a mil��ek �en!
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_02");	//Tr�pen� nezn�m, v�ak moudrost� a zlatem opl�v�m a �eny mi padaj� k noh�m, sotva mne spat��.
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_03");	//Jestli m� probl�my, nech si je pro sebe, j� je nepot�ebuju.
};


instance DIA_VALENTINO_MANIEREN(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 3;
	condition = dia_valentino_manieren_condition;
	information = dia_valentino_manieren_info;
	permanent = FALSE;
	description = "Zd� se mi, �e bych ti m�l u�t�d�it men�� lekci slu�n�ho chov�n�!";
};


func int dia_valentino_manieren_condition()
{
	if(Npc_KnowsInfo(other,dia_valentino_hallo) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_valentino_manieren_info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_02");	//Zd� se mi, �e bych ti m�l u�t�d�it men�� lekci slu�n�ho chov�n�!
	AI_Output(self,other,"DIA_Valentino_HALLO_klappe_03_01");	//Mn� to nevad�. Jen si mne klidn� zbij. A� se z�tra r�no probud�m, zase mi bude dob�e.
	AI_Output(self,other,"DIA_Valentino_HALLO_klappe_03_02");	//Ale ty s t�mhle ksichtem bude� muset chodit cel� �ivot.
};


var int valentino_lo_perm;
var int valentino_hi_perm;

instance DIA_VALENTINO_WASNUETZLICHES(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 4;
	condition = dia_valentino_wasnuetzliches_condition;
	information = dia_valentino_wasnuetzliches_info;
	permanent = TRUE;
	description = "Chce� mi ��ci je�t� n�co jin�ho?";
};


func int dia_valentino_wasnuetzliches_condition()
{
	if(Npc_KnowsInfo(other,dia_valentino_hallo))
	{
		return TRUE;
	};
};

func void dia_valentino_wasnuetzliches_info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_03");	//(klidn�) Chce� mi ��ci je�t� n�co jin�ho?
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		b_say(self,other,"$NOTNOW");
	}
	else if((VALENTINO_LO_PERM == FALSE) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_01");	//Z�skej si v�hlas, nikdy nikomu nic neslibuj, ber si, co chce�, a d�vej si pozor, aby ses nedostal do sporu s domobranou.
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_02");	//Nebo se ��rliv�mi man�eli, samoz�ejm� - ti jsou ze v�ech nejhor��, to ti pov�m.
		VALENTINO_LO_PERM = TRUE;
	}
	else if((VALENTINO_HI_PERM == FALSE) && ((other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_03");	//Pro mu�e tv�ho postaven� nen� nic nemo�n�. Prost� jen mus� poznat, kdy je �as k �inu.
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_04");	//Tak neztr�cej �as a jednej!
		VALENTINO_HI_PERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_05");	//U� jsem ti �ekl v�echno, co pot�ebuje� v�d�t - zbytek je na tob�.
	};
};


instance DIA_VALENTINO_PICKPOCKET(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 900;
	condition = dia_valentino_pickpocket_condition;
	information = dia_valentino_pickpocket_info;
	permanent = TRUE;
	description = "(Tenhle kl�� lze snadno ukr�st)";
};


func int dia_valentino_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_valentino) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_valentino_pickpocket_info()
{
	Info_ClearChoices(dia_valentino_pickpocket);
	Info_AddChoice(dia_valentino_pickpocket,DIALOG_BACK,dia_valentino_pickpocket_back);
	Info_AddChoice(dia_valentino_pickpocket,DIALOG_PICKPOCKET,dia_valentino_pickpocket_doit);
};

func void dia_valentino_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itke_valentino,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		Info_ClearChoices(dia_valentino_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_valentino_pickpocket_back()
{
	Info_ClearChoices(dia_valentino_pickpocket);
};

