
instance DIA_MIL_333_STADTWACHE_EXIT(C_INFO)
{
	npc = mil_333_stadtwache;
	nr = 999;
	condition = dia_mil_333_stadtwache_exit_condition;
	information = dia_mil_333_stadtwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_333_stadtwache_exit_condition()
{
	return TRUE;
};

func void dia_mil_333_stadtwache_exit_info()
{
	AI_StopProcessInfos(self);
};


const string MIL_333_CHECKPOINT = "NW_CITY_MERCHANT_PATH_29";

var int mil_333_personal_absolutionlevel;

instance DIA_MIL_333_STADTWACHE_FIRSTWARN(C_INFO)
{
	npc = mil_333_stadtwache;
	nr = 1;
	condition = dia_mil_333_stadtwache_firstwarn_condition;
	information = dia_mil_333_stadtwache_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_333_stadtwache_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,MIL_333_CHECKPOINT) <= 1000)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((b_getgreatestpetzcrime(self) >= CRIME_ATTACK) && (b_getcurrentabsolutionlevel(self) == MIL_333_PERSONAL_ABSOLUTIONLEVEL))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(MIL_333_SCHONMALREINGELASSEN == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_333_stadtwache_firstwarn_info()
{
	var C_ITEM itm;
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_00");	//ST¡T!
	if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
	{
		AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_01");	//(vzdychne si) Co je?
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_02");	//Moc dob¯e vÌö co!
		if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_03");	//Po mÏstÏ jsi hledan˝ pro vraûdu!
		};
		if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_04");	//Nechceme tady û·dn˝ praöiv˝ zlodÏje!
		};
		if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_05");	//Pro potÌûisty nenÌ ve mÏstÏ mÌsto!
		};
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_06");	//ProË myslÌö, ûe bychom tÏ mÏli nechat jÌt d·l?
	}
	else
	{
		itm = Npc_GetEquippedArmor(other);
		if((Npc_HasEquippedArmor(other) == FALSE) || (Hlp_IsItem(itm,itar_bau_l) == TRUE) || (Hlp_IsItem(itm,itar_bau_m) == TRUE))
		{
			AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_07");	//Ano?
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_08");	//Vypad·ö jako naprost˝ somr·k. V tomhle mÏstÏ nem·me mÌsto pro lidi bez penÏz.
			if(Npc_HasItems(other,itwr_passierschein))
			{
				AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_09");	//Ale j· m·m propustku!
				AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_10");	//Tahle platÌ jenom pro tu druhou br·nu!
			};
			if(Npc_KnowsInfo(other,dia_mil_310_stadtwache_milizwerden))
			{
				AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_11");	//Ale j· se chci p¯idat k mÏstskÈ str·ûi!
				AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_12");	//Haha! NechtÏj mÏ rozesm·t! BÏû ke druhÈ br·nÏ a zkus vÏöet bulÌky na nos zase JIM.
				AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_13");	//Tam uû jsem byl - a oni mÏ poslali sem.
				AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_14");	//(oöklivÏ se zasmÏje) No potÏö! ée oni n·m sem posÌlajÌ vûdycky samou smet·nku.
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_15");	//(tiöe) Coûe?
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_16");	//Jen jsem se chtÏl na tebe podÌvat. Tak dobr·, zd· se, ûe nÏjakÈ ty penÌze m·ö. M˘ûeö jÌt.
			self.aivar[AIV_PASSGATE] = TRUE;
			stadtwache_310.aivar[AIV_PASSGATE] = TRUE;
			MIL_333_SCHONMALREINGELASSEN = TRUE;
			AI_StopProcessInfos(self);
		};
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_333_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};


instance DIA_MIL_333_STADTWACHE_SECONDWARN(C_INFO)
{
	npc = mil_333_stadtwache;
	nr = 2;
	condition = dia_mil_333_stadtwache_secondwarn_condition;
	information = dia_mil_333_stadtwache_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_333_stadtwache_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_333_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_mil_333_stadtwache_secondwarn_info()
{
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_SecondWarn_06_00");	//M·ö snad nÏco s uöima? JeötÏ jeden krok a ochutn·ö m˘j meË!
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_333_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_MIL_333_STADTWACHE_ATTACK(C_INFO)
{
	npc = mil_333_stadtwache;
	nr = 3;
	condition = dia_mil_333_stadtwache_attack_condition;
	information = dia_mil_333_stadtwache_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_333_stadtwache_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_333_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_mil_333_stadtwache_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_Attack_06_00");	//ÿekl sis o to.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};


instance DIA_MIL_333_STADTWACHE_BRIBE(C_INFO)
{
	npc = mil_333_stadtwache;
	nr = 5;
	condition = dia_mil_333_stadtwache_bribe_condition;
	information = dia_mil_333_stadtwache_bribe_info;
	permanent = TRUE;
	description = "Tady je 100 zlat˝ch. Nech mÏ projÌt!";
};


func int dia_mil_333_stadtwache_bribe_condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void dia_mil_333_stadtwache_bribe_info()
{
	AI_Output(other,self,"DIA_Mil_333_Stadtwache_Bribe_15_00");	//Tady je 100 zlat˝ch. Nech mÏ projÌt!
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_Bribe_06_01");	//(lakomÏ) 100 zlat˝ch znÌ hezky. Tak bÏû dovnit¯.
		if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_Bribe_06_02");	//A jdi rovnou za Andrem! Nebo po tobÏ budu p¯ÌötÏ chtÌt dalöÌch 100 zlat˝ch!
		};
		self.aivar[AIV_PASSGATE] = TRUE;
		stadtwache_310.aivar[AIV_PASSGATE] = TRUE;
		MIL_333_SCHONMALREINGELASSEN = TRUE;
		b_checklog();
		MIL_333_PERSONAL_ABSOLUTIONLEVEL = b_getcurrentabsolutionlevel(self) + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_Bribe_06_03");	//Co?! Kde?! NevidÌm û·dnÈ zlaù·ky. Zmiz!
	};
	AI_StopProcessInfos(self);
};


instance DIA_MIL_333_STADTWACHE_PERM(C_INFO)
{
	npc = mil_333_stadtwache;
	nr = 5;
	condition = dia_mil_333_stadtwache_perm_condition;
	information = dia_mil_333_stadtwache_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_333_stadtwache_perm_condition()
{
	if((self.aivar[AIV_PASSGATE] == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_mil_333_stadtwache_perm_info()
{
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_PERM_06_00");	//Hni se!
	AI_StopProcessInfos(self);
};

