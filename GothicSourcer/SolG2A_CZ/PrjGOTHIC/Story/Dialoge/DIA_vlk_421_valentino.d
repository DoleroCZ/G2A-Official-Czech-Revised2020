
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
	description = "Takže copak to tu máme?";
};


func int dia_valentino_hallo_condition()
{
	return TRUE;
};

func void dia_valentino_hallo_info()
{
	AI_Output(other,self,"DIA_Valentino_HALLO_15_00");	//Takže copak to tu máme?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Valentino_HALLO_03_01");	//Jmenuji se Valentino. Snažím se, abych tento den, který mi Innos dal, neznesvìtil žádnou prací.
		AI_Output(other,self,"DIA_Valentino_HALLO_15_02");	//Dávej pozor na to, co øíkáš.
		AI_Output(self,other,"DIA_Valentino_HALLO_03_03");	//Ach, omluv mì. Nechtìl jsem Tvou Milost nijak urazit, ó, prosím za odpuštìní, pane.
	}
	else
	{
		AI_Output(self,other,"DIA_Valentino_HALLO_03_04");	//Copak se neumíš chovat? To je nechutné!
		AI_Output(self,other,"DIA_Valentino_HALLO_03_05");	//Poøád tahle špinavá chátra! Nemáš být náhodou nìkde v práci?
		AI_Output(self,other,"DIA_Valentino_HALLO_03_06");	//Ale poèítám, že takového ošuntìlého chlápka jako ty si každý všimne, co?
		AI_Output(self,other,"DIA_Valentino_HALLO_03_07");	//No, až budeš mít tolik zlata jako já, taky nebudeš muset vùbec pracovat. Ale ty nikdy takhle bohatý nebudeš.
		AI_Output(other,self,"DIA_Valentino_HALLO_15_08");	//Vidím, že s tebou si užiju poøádnou srandu.
	};
};


instance DIA_VALENTINO_WHOAGAIN(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 2;
	condition = dia_valentino_whoagain_condition;
	information = dia_valentino_whoagain_info;
	permanent = FALSE;
	description = "Ptal jsem se tì, kdo jsi!";
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
	AI_Output(other,self,"DIA_Valentino_Add_15_01");	//Ptal jsem se tì, kdo jsi!
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_01");	//Jsem švihák Valentino. Bonviván a miláèek žen!
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_02");	//Trápení neznám, však moudrostí a zlatem oplývám a ženy mi padají k nohám, sotva mne spatøí.
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_03");	//Jestli máš problémy, nech si je pro sebe, já je nepotøebuju.
};


instance DIA_VALENTINO_MANIEREN(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 3;
	condition = dia_valentino_manieren_condition;
	information = dia_valentino_manieren_info;
	permanent = FALSE;
	description = "Zdá se mi, že bych ti mìl uštìdøit menší lekci slušného chování!";
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
	AI_Output(other,self,"DIA_Valentino_Add_15_02");	//Zdá se mi, že bych ti mìl uštìdøit menší lekci slušného chování!
	AI_Output(self,other,"DIA_Valentino_HALLO_klappe_03_01");	//Mnì to nevadí. Jen si mne klidnì zbij. Až se zítra ráno probudím, zase mi bude dobøe.
	AI_Output(self,other,"DIA_Valentino_HALLO_klappe_03_02");	//Ale ty s tímhle ksichtem budeš muset chodit celý život.
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
	description = "Chceš mi øíci ještì nìco jiného?";
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
	AI_Output(other,self,"DIA_Valentino_Add_15_03");	//(klidnì) Chceš mi øíci ještì nìco jiného?
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		b_say(self,other,"$NOTNOW");
	}
	else if((VALENTINO_LO_PERM == FALSE) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_01");	//Získej si vìhlas, nikdy nikomu nic neslibuj, ber si, co chceš, a dávej si pozor, aby ses nedostal do sporu s domobranou.
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_02");	//Nebo se žárlivými manželi, samozøejmì - ti jsou ze všech nejhorší, to ti povím.
		VALENTINO_LO_PERM = TRUE;
	}
	else if((VALENTINO_HI_PERM == FALSE) && ((other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_03");	//Pro muže tvého postavení není nic nemožné. Prostì jen musíš poznat, kdy je èas k èinu.
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_04");	//Tak neztrácej èas a jednej!
		VALENTINO_HI_PERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_05");	//Už jsem ti øekl všechno, co potøebuješ vìdìt - zbytek je na tobì.
	};
};


instance DIA_VALENTINO_PICKPOCKET(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 900;
	condition = dia_valentino_pickpocket_condition;
	information = dia_valentino_pickpocket_info;
	permanent = TRUE;
	description = "(Tenhle klíè lze snadno ukrást)";
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

