
instance DIA_ADDON_RHADEMES_EXIT(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 999;
	condition = dia_addon_rhademes_exit_condition;
	information = dia_addon_rhademes_exit_info;
	permanent = TRUE;
	description = "N�jdu si vlastn� cestu! (Konec)";
};


func int dia_addon_rhademes_exit_condition()
{
	return TRUE;
};

func void dia_addon_rhademes_exit_info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_EXIT_15_00");	//N�jdu si vlastn� cestu!
	AI_Output(self,other,"DIA_Addon_Rhademes_EXIT_03_01");	//Ako chce�...
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
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_00");	//Moja m�gia bola zadr�an� na ve�n� �asy.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_01");	//Kone�ne som voln�. Me� m� nov�ho majitela.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_02");	//Posledn� komora sa otvorila.
		AI_Output(other,self,"DIA_Addon_Rhademes_First_15_03");	//Ale br�na vyzer� pre m�a zatvoren�.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_04");	//Toto nie je br�na do poslednej komory.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_05");	//T�to br�na �a zavedie do izby predt�m.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_06");	//Majitel... zavrel to pred n�m.
		RHADEMES_UNDERSTOOD = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_07");	//Ghanima en Kandra Adanos?
		b_say(other,self,"$CANTUNDERSTANDTHIS");
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_08");	//(z�rivo) Bengla anthani!
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
	description = "Jak otev�u br�nu?";
};


func int dia_addon_rhademes_pforte_condition()
{
	return TRUE;
};

func void dia_addon_rhademes_pforte_info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_Pforte_15_00");	//Jak otev�u br�nu?
	AI_Output(self,other,"DIA_Addon_Rhademes_Pforte_03_01");	//Potiahni... jednu z p�k.
	AI_Output(other,self,"DIA_Addon_Rhademes_Pforte_15_02");	//N�kterou?
	AI_Output(self,other,"DIA_Addon_Rhademes_Pforte_03_03");	//V�etky p�ky otvoria br�nu.
};


instance DIA_ADDON_RHADEMES_HEBEL(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 3;
	condition = dia_addon_rhademes_hebel_condition;
	information = dia_addon_rhademes_hebel_info;
	permanent = FALSE;
	description = "Ne, v�ecky p�ky spust� past, �e?";
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
	AI_Output(other,self,"DIA_Addon_Rhademes_Hebel_15_00");	//Ne, v�ecky p�ky spust� past, �e?
	AI_Output(self,other,"DIA_Addon_Rhademes_Hebel_03_01");	//�no!
};


instance DIA_ADDON_RHADEMES_DONTBELIEVE(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 4;
	condition = dia_addon_rhademes_dontbelieve_condition;
	information = dia_addon_rhademes_dontbelieve_info;
	permanent = FALSE;
	description = "Nev���m ti!";
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
	AI_Output(other,self,"DIA_Addon_Rhademes_DontBelieve_15_00");	//Nev���m ti!
	AI_Output(self,other,"DIA_Addon_Rhademes_DontBelieve_03_01");	//Nie... ja nikdy neklamem.
};


instance DIA_ADDON_RHADEMES_DEINVATER(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 5;
	condition = dia_addon_rhademes_deinvater_condition;
	information = dia_addon_rhademes_deinvater_info;
	permanent = FALSE;
	description = "Tv�j otec postavil tuto past. Co chce� v�d�t o jej�m fungovan�?";
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
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_15_00");	//Tv�j otec postavil tuto past. Co v� o jej�m fungovan�?
	AI_Output(self,other,"DIA_Addon_Rhademes_DeinVater_03_01");	//QUARHODRON!St�le po�ujem �dery kladiva.... na druhej strane br�ny... tak d�vno...
	AI_Output(self,other,"DIA_Addon_Rhademes_DeinVater_03_02");	//Me�... uk�... jeho pomsta... za moju chybu...
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_15_03");	//Tak�e si vid�l kter� p�ka je ta spr�vn�?
	AI_Output(self,other,"DIA_Addon_Rhademes_DeinVater_03_04");	//U� d�vno som to zabudol.
	Info_ClearChoices(dia_addon_rhademes_deinvater);
	Info_AddChoice(dia_addon_rhademes_deinvater,"H�dej!",dia_addon_rhademes_deinvater_guess);
	Info_AddChoice(dia_addon_rhademes_deinvater,"Zkus si na to vzpomenout.",dia_addon_rhademes_deinvater_remember);
	Info_AddChoice(dia_addon_rhademes_deinvater,"Prem��lej!",dia_addon_rhademes_deinvater_think);
};


var int rhademes_fertig;

func void b_addon_rhademes_lever(var int choice)
{
	AI_Output(self,other,"DIA_Addon_Rhademes_Lever_03_00");	//Bolo to tak d�vno...
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
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Think_15_00");	//Prem��lej!
	b_addon_rhademes_lever(1);
};

func void dia_addon_rhademes_deinvater_remember()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Remember_15_00");	//Zkus si na to vzpomenout.
	b_addon_rhademes_lever(2);
};

func void dia_addon_rhademes_deinvater_guess()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Guess_15_00");	//H�dej!
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
	AI_Output(self,other,"DIA_Addon_Rhademes_PERM_03_00");	//Ak m� svoju silu... pou�i ju... do hlb�n mora...
	SC_TOOKRHADEMESTRAP = TRUE;
	SC_TALKEDTORHADEMAFTER = TRUE;
	AI_StopProcessInfos(self);
};

