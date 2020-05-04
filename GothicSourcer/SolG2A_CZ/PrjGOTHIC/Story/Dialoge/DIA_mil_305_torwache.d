
instance DIA_MIL_305_TORWACHE_EXIT(C_INFO)
{
	npc = mil_305_torwache;
	nr = 999;
	condition = dia_mil_305_torwache_exit_condition;
	information = dia_mil_305_torwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_305_torwache_exit_condition()
{
	return TRUE;
};

func void dia_mil_305_torwache_exit_info()
{
	AI_StopProcessInfos(self);
};


const string MIL_305_CHECKPOINT = "NW_CITY_UPTOWN_PATH_02";

instance DIA_MIL_305_TORWACHE_FIRSTWARN(C_INFO)
{
	npc = mil_305_torwache;
	nr = 1;
	condition = dia_mil_305_torwache_firstwarn_condition;
	information = dia_mil_305_torwache_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_305_torwache_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,MIL_305_CHECKPOINT) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((b_getgreatestpetzcrime(self) >= CRIME_ATTACK) && (MIL_305_SCHONMALREINGELASSEN == TRUE))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(MIL_305_SCHONMALREINGELASSEN == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_firstwarn_info()
{
	AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_00");	//ST¡T!
	if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
	{
		if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_01");	//Ve mÏstÏ jsi hled·n pro vraûdu! Neû se to vy¯eöÌ, nemohu tÏ vpustit do hornÌ Ë·sti mÏsta.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_02");	//Dokud jsi obvinÏn˝ z kr·deûe, nesmÌö vstoupit do hornÌ Ë·sti mÏsta!
		};
		if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_03");	//PotÌûista jako ty nem· v hornÌ Ë·sti mÏsta co pohled·vat.
		};
		AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_04");	//BÏû za lordem Andrem a urovnej celou tu z·leûitost!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_05");	//Do hornÌ Ë·sti mÏsta majÌ p¯Ìstup jen obËanÈ mÏsta a kr·lovötÌ voj·ci!
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_305_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};


instance DIA_MIL_305_TORWACHE_SECONDWARN(C_INFO)
{
	npc = mil_305_torwache;
	nr = 2;
	condition = dia_mil_305_torwache_secondwarn_condition;
	information = dia_mil_305_torwache_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_305_torwache_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_305_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_secondwarn_info()
{
	AI_Output(self,other,"DIA_Mil_305_Torwache_SecondWarn_03_00");	//ÿÌk·m ti to naposledy. JeötÏ jeden krok a ocitneö se ve svÏtÏ bolesti.
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_305_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_MIL_305_TORWACHE_ATTACK(C_INFO)
{
	npc = mil_305_torwache;
	nr = 3;
	condition = dia_mil_305_torwache_attack_condition;
	information = dia_mil_305_torwache_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_305_torwache_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_305_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_305_Torwache_Attack_03_00");	//ÿekl sis o to.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};


instance DIA_MIL_305_TORWACHE_MESSAGE(C_INFO)
{
	npc = mil_305_torwache;
	nr = 1;
	condition = dia_mil_305_torwache_message_condition;
	information = dia_mil_305_torwache_message_info;
	permanent = FALSE;
	description = "P¯in·öÌm d˘leûitou zpr·vu pro lorda Hagena.";
};


func int dia_mil_305_torwache_message_condition()
{
	if((PLAYER_KNOWSLORDHAGEN == TRUE) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_message_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_MESSAGE_15_00");	//P¯in·öÌm d˘leûitou zpr·vu pro lorda Hagena.
	AI_Output(self,other,"DIA_Mil_305_Torwache_MESSAGE_03_01");	//Polovina mÏsta by chtÏla mluvit s lordem Hagenem v nÏjakÈ d˘leûitÈ z·leûitosti.
	AI_Output(self,other,"DIA_Mil_305_Torwache_MESSAGE_03_02");	//Kdybychom vpustili kaûdÈho ûadatele, nedÏlal by nic jinÈho, neû ûe by vy¯izoval podruûnÈ z·leûitosti mÏöùan˘.
};


instance DIA_MIL_305_TORWACHE_AUSNAHME(C_INFO)
{
	npc = mil_305_torwache;
	nr = 2;
	condition = dia_mil_305_torwache_ausnahme_condition;
	information = dia_mil_305_torwache_ausnahme_info;
	permanent = TRUE;
	description = "Neöla by udÏlat v˝jimka?";
};


func int dia_mil_305_torwache_ausnahme_condition()
{
	if(MIL_305_SCHONMALREINGELASSEN == FALSE)
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_ausnahme_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_Ausnahme_15_00");	//Neöla by udÏlat v˝jimka?
	AI_Output(self,other,"DIA_Mil_305_Torwache_Ausnahme_03_01");	//(vyk¯ikne) Coûe?! V tomhle mÏstÏ platÌ urËit· pravidla! Pravidla, kter· se vztahujÌ na kaûdÈho, bez v˝jimek!
	AI_Output(self,other,"DIA_Mil_305_Torwache_Ausnahme_03_02");	//Pokud bychom svolili k poruöenÌ tÏchto pravidel, bylo by to nespravedlivÈ ke vöem, kdo se jimi ¯ÌdÌ.
};


instance DIA_MIL_305_TORWACHE_PASSASCITIZEN(C_INFO)
{
	npc = mil_305_torwache;
	nr = 2;
	condition = dia_mil_305_torwache_passascitizen_condition;
	information = dia_mil_305_torwache_passascitizen_info;
	permanent = TRUE;
	description = "Jsem uzn·van˝ obËan Khorinisu! Nechte mÏ projÌt!";
};


func int dia_mil_305_torwache_passascitizen_condition()
{
	if((MIL_305_SCHONMALREINGELASSEN == FALSE) && (KAPITEL <= 1))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_passascitizen_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsCitizen_15_00");	//Jsem uzn·van˝ obËan Khorinisu! Nechte mÏ projÌt!
	if(PLAYER_ISAPPRENTICE > APP_NONE)
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_01");	//Aù uû KhorinisskÈ mistry p¯imÏlo ke tvÈmu zaps·nÌ mezi uËednÌky cokoliv - nechci to vÏdÏt.
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_02");	//M˘ûeö vstoupit! Ale chovej se sluönÏ! Jinak tÏ ËekajÌ nejvÏtöÌ trable tvÈho ûivota!
		self.aivar[AIV_PASSGATE] = TRUE;
		MIL_305_SCHONMALREINGELASSEN = TRUE;
		b_checklog();
		AI_StopProcessInfos(self);
	}
	else if((MIS_MATTEO_GOLD == LOG_SUCCESS) || (MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS) || (MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS) || (MIS_HARAD_ORC == LOG_SUCCESS) || (MIS_HAKONBANDITS == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_03");	//Moûn· sis naklonil na svou stranu nÏkterÈ mistry z dolnÌ Ë·sti mÏsta, ale kdybys byl obËanem tohoto mÏsta, vÏdÏl bych o tom!
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_04");	//NevÏs mi bulÌky na nos! Varuju tÏ!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_05");	//Jsi jen öpÌna za nehty! OkamûitÏ zmiz!
		AI_StopProcessInfos(self);
	};
};


instance DIA_MIL_305_TORWACHE_PASSASMIL(C_INFO)
{
	npc = mil_305_torwache;
	nr = 3;
	condition = dia_mil_305_torwache_passasmil_condition;
	information = dia_mil_305_torwache_passasmil_info;
	permanent = TRUE;
	description = "Pat¯Ìm k domobranÏ - nechte mÏ projÌt!";
};


func int dia_mil_305_torwache_passasmil_condition()
{
	if((other.guild == GIL_MIL) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_passasmil_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsMil_15_00");	//Pat¯Ìm k domobranÏ - nechte mÏ projÌt!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMil_03_01");	//Takûe Andre tÏ p¯ijal? V tom p¯ÌpadÏ nakonec asi nebudeö aû tak öpatn˝ chlap!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMil_03_02");	//Jsi teÔ jednÌm z ochr·nc˘ mÏsta! Tak se k obËan˘m chovej hezky p¯·telsky!
	self.aivar[AIV_PASSGATE] = TRUE;
	MIL_305_SCHONMALREINGELASSEN = TRUE;
	b_checklog();
	AI_StopProcessInfos(self);
};


instance DIA_MIL_305_TORWACHE_PASSASMAGE(C_INFO)
{
	npc = mil_305_torwache;
	nr = 3;
	condition = dia_mil_305_torwache_passasmage_condition;
	information = dia_mil_305_torwache_passasmage_info;
	permanent = TRUE;
	description = "Opovaûujeö se st·t v cestÏ Innosovu z·stupci?";
};


func int dia_mil_305_torwache_passasmage_condition()
{
	if((other.guild == GIL_KDF) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_passasmage_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsMage_15_00");	//Opovaûujeö se st·t v cestÏ Innosovu z·stupci?
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMage_03_01");	//Ehm... ne! Samoz¯ejmÏ ne! Innosov˝m vyvolen˝m je vstup povolen!
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsMage_15_02");	//Modli se k Innosovi, aù ti odpustÌ tvou troufalost!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMage_03_03");	//Ano, vyvolen˝!
	self.aivar[AIV_PASSGATE] = TRUE;
	MIL_305_SCHONMALREINGELASSEN = TRUE;
	b_checklog();
	AI_StopProcessInfos(self);
};


instance DIA_MIL_305_TORWACHE_PASSASSLD(C_INFO)
{
	npc = mil_305_torwache;
	nr = 3;
	condition = dia_mil_305_torwache_passassld_condition;
	information = dia_mil_305_torwache_passassld_info;
	permanent = TRUE;
	description = "Nesu d˘leûitou zpr·vu pro lorda Hagena!";
};


func int dia_mil_305_torwache_passassld_condition()
{
	if((other.guild == GIL_SLD) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_passassld_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsSld_15_00");	//Nesu d˘leûitou zpr·vu pro lorda Hagena!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsSld_03_01");	//Ty jsi jeden z tÈ ûold·ckÈ ch·try! Co bys ty mohl od lorda Hagena chtÌt?
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsSld_15_02");	//P¯in·öÌm nabÌdku p¯ÌmÏ¯Ì.
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsSld_03_03");	//Ha! Takûe jste vy mizerovÈ nakonec p¯ece jenom p¯iöli k rozumu. Tak bÏû za lordem Hagenem, ale chovej se pÏknÏ zdvo¯ile, nebo ti nakopu ten tv˘j tlustej blbej... zadek!
	self.aivar[AIV_PASSGATE] = TRUE;
	MIL_305_SCHONMALREINGELASSEN = TRUE;
	b_checklog();
	AI_StopProcessInfos(self);
};


instance DIA_MIL_305_TORWACHE_PERM(C_INFO)
{
	npc = mil_305_torwache;
	nr = 1;
	condition = dia_mil_305_torwache_perm_condition;
	information = dia_mil_305_torwache_perm_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_mil_305_torwache_perm_condition()
{
	if((MIL_305_SCHONMALREINGELASSEN == TRUE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_perm_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PERM_15_00");	//Jak se vede?
	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_01");	//Vöechno v pohodÏ, k·mo!
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_02");	//PlnÌme zde jen svou povinnost. DÏkuji, ûe sis mÏ vöiml, vyvolen˝!
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_03");	//Sice tÏ nech·m projÌt, ale to jeötÏ neznamen·, ûe s tebou chci mluvit!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_04");	//Co chceö?
	};
	AI_StopProcessInfos(self);
};

