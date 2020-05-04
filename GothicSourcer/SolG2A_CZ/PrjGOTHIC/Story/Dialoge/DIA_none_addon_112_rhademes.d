
instance DIA_ADDON_RHADEMES_EXIT(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 999;
	condition = dia_addon_rhademes_exit_condition;
	information = dia_addon_rhademes_exit_info;
	permanent = TRUE;
	description = "Nájdu si vlastní cestu! (Konec)";
};


func int dia_addon_rhademes_exit_condition()
{
	return TRUE;
};

func void dia_addon_rhademes_exit_info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_EXIT_15_00");	//Nájdu si vlastní cestu!
	AI_Output(self,other,"DIA_Addon_Rhademes_EXIT_03_01");	//Ako chceš...
	AI_StopProcessInfos(self);
};


var int rhademes_understood;

instance DIA_ADDON_RHADEMES_FIRST(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 1;
	condition = dia_addon_rhademes_first_condition;
	information = dia_addon_rhademes_first_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_rhademes_first_condition()
{
	if(Npc_IsInState(self,zs_talk) && (RHADEMES_UNDERSTOOD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_rhademes_first_info()
{
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_00");	//Moja mágia bola zadržaná na veèné èasy.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_01");	//Koneène som volný. Meè má nového majitela.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_02");	//Posledná komora sa otvorila.
		AI_Output(other,self,"DIA_Addon_Rhademes_First_15_03");	//Ale brána vyzerá pre mòa zatvorená.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_04");	//Toto nie je brána do poslednej komory.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_05");	//Táto brána a zavedie do izby predtým.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_06");	//Majitel... zavrel to pred ním.
		RHADEMES_UNDERSTOOD = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_07");	//Ghanima en Kandra Adanos?
		b_say(other,self,"$CANTUNDERSTANDTHIS");
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_08");	//(zúrivo) Bengla anthani!
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_RHADEMES_PFORTE(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 2;
	condition = dia_addon_rhademes_pforte_condition;
	information = dia_addon_rhademes_pforte_info;
	permanent = FALSE;
	description = "Jak otevøu bránu?";
};


func int dia_addon_rhademes_pforte_condition()
{
	return TRUE;
};

func void dia_addon_rhademes_pforte_info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_Pforte_15_00");	//Jak otevøu bránu?
	AI_Output(self,other,"DIA_Addon_Rhademes_Pforte_03_01");	//Potiahni... jednu z pák.
	AI_Output(other,self,"DIA_Addon_Rhademes_Pforte_15_02");	//Nìkterou?
	AI_Output(self,other,"DIA_Addon_Rhademes_Pforte_03_03");	//Všetky páky otvoria bránu.
};


instance DIA_ADDON_RHADEMES_HEBEL(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 3;
	condition = dia_addon_rhademes_hebel_condition;
	information = dia_addon_rhademes_hebel_info;
	permanent = FALSE;
	description = "Ne, všecky páky spustí past, že?";
};


func int dia_addon_rhademes_hebel_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_rhademes_pforte) && !Npc_KnowsInfo(other,dia_addon_rhademes_deinvater))
	{
		return TRUE;
	};
};

func void dia_addon_rhademes_hebel_info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_Hebel_15_00");	//Ne, všecky páky spustí past, že?
	AI_Output(self,other,"DIA_Addon_Rhademes_Hebel_03_01");	//áno!
};


instance DIA_ADDON_RHADEMES_DONTBELIEVE(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 4;
	condition = dia_addon_rhademes_dontbelieve_condition;
	information = dia_addon_rhademes_dontbelieve_info;
	permanent = FALSE;
	description = "Nevìøím ti!";
};


func int dia_addon_rhademes_dontbelieve_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_rhademes_pforte) && !Npc_KnowsInfo(other,dia_addon_rhademes_deinvater))
	{
		return TRUE;
	};
};

func void dia_addon_rhademes_dontbelieve_info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DontBelieve_15_00");	//Nevìøím ti!
	AI_Output(self,other,"DIA_Addon_Rhademes_DontBelieve_03_01");	//Nie... ja nikdy neklamem.
};


instance DIA_ADDON_RHADEMES_DEINVATER(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 5;
	condition = dia_addon_rhademes_deinvater_condition;
	information = dia_addon_rhademes_deinvater_info;
	permanent = FALSE;
	description = "Tvùj otec postavil tuto past. Co chceš vìdìt o jejím fungovaní?";
};


func int dia_addon_rhademes_deinvater_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_rhademes_pforte) && (Npc_HasItems(other,itmi_addon_stone_04) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_rhademes_deinvater_info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_15_00");	//Tvùj otec postavil tuto past. Co víš o jejím fungovaní?
	AI_Output(self,other,"DIA_Addon_Rhademes_DeinVater_03_01");	//QUARHODRON!Stále poèujem údery kladiva.... na druhej strane brány... tak dávno...
	AI_Output(self,other,"DIA_Addon_Rhademes_DeinVater_03_02");	//Meè... ukáž... jeho pomsta... za moju chybu...
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_15_03");	//Takže si vidìl která páka je ta správná?
	AI_Output(self,other,"DIA_Addon_Rhademes_DeinVater_03_04");	//Už dávno som to zabudol.
	Info_ClearChoices(dia_addon_rhademes_deinvater);
	Info_AddChoice(dia_addon_rhademes_deinvater,"Hádej!",dia_addon_rhademes_deinvater_guess);
	Info_AddChoice(dia_addon_rhademes_deinvater,"Zkus si na to vzpomenout.",dia_addon_rhademes_deinvater_remember);
	Info_AddChoice(dia_addon_rhademes_deinvater,"Premýšlej!",dia_addon_rhademes_deinvater_think);
};


var int rhademes_fertig;

func void b_addon_rhademes_lever(var int choice)
{
	AI_Output(self,other,"DIA_Addon_Rhademes_Lever_03_00");	//Bolo to tak dávno...
	AI_StopProcessInfos(self);
	if(choice <= 1)
	{
		AI_GotoWP(self,"ADW_ADANOSTEMPEL_RHADEMES_04");
	}
	else if(choice == 2)
	{
		AI_GotoWP(self,"ADW_ADANOSTEMPEL_RHADEMES_04");
	}
	else
	{
		AI_GotoWP(self,"ADW_ADANOSTEMPEL_RHADEMES_04");
	};
	AI_UseMob(self,"LEVER",1);
	RHADEMES_FERTIG = TRUE;
};

func void dia_addon_rhademes_deinvater_think()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Think_15_00");	//Premýšlej!
	b_addon_rhademes_lever(1);
};

func void dia_addon_rhademes_deinvater_remember()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Remember_15_00");	//Zkus si na to vzpomenout.
	b_addon_rhademes_lever(2);
};

func void dia_addon_rhademes_deinvater_guess()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Guess_15_00");	//Hádej!
	b_addon_rhademes_lever(3);
};


instance DIA_ADDON_RHADEMES_PERM(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 2;
	condition = dia_addon_rhademes_perm_condition;
	information = dia_addon_rhademes_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_rhademes_perm_condition()
{
	if(Npc_IsInState(self,zs_talk) && (RHADEMES_FERTIG == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_rhademes_perm_info()
{
	AI_Output(self,other,"DIA_Addon_Rhademes_PERM_03_00");	//Ak máš svoju silu... použi ju... do hlbín mora...
	SC_TOOKRHADEMESTRAP = TRUE;
	SC_TALKEDTORHADEMAFTER = TRUE;
	AI_StopProcessInfos(self);
};

