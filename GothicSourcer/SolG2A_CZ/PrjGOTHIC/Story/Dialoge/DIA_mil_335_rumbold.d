
instance DIA_RUMBOLD_EXIT(C_INFO)
{
	npc = mil_335_rumbold;
	nr = 999;
	condition = dia_rumbold_exit_condition;
	information = dia_rumbold_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rumbold_exit_condition()
{
	return TRUE;
};

func void dia_rumbold_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RUMBOLD_PREPERM(C_INFO)
{
	npc = mil_335_rumbold;
	nr = 1;
	condition = dia_rumbold_preperm_condition;
	information = dia_rumbold_preperm_info;
	permanent = TRUE;
	description = "Co tady d�l�?";
};


func int dia_rumbold_preperm_condition()
{
	if(!Npc_KnowsInfo(other,dia_bengar_milizklatschen))
	{
		return TRUE;
	};
};

func void dia_rumbold_preperm_info()
{
	AI_Output(other,self,"DIA_Rumbold_PrePerm_15_00");	//Co tady d�l�?
	AI_Output(self,other,"DIA_Rumbold_PrePerm_10_01");	//Ztra� se! Rozum�?
	AI_StopProcessInfos(self);
};


instance DIA_RUMBOLD_HALLO(C_INFO)
{
	npc = mil_335_rumbold;
	nr = 1;
	condition = dia_rumbold_hallo_condition;
	information = dia_rumbold_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_rumbold_hallo_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_milizklatschen))
	{
		return TRUE;
	};
};

func void dia_rumbold_hallo_info()
{
	AI_Output(self,other,"DIA_Rumbold_Hallo_10_00");	//No pod�vejte na tohohle. Dal�� vtip�lek. Co tady d�l�, hm?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Rumbold_Hallo_10_01");	//Kdo sakra jsi?
	}
	else
	{
		AI_Output(self,other,"DIA_Rumbold_Hallo_10_02");	//Jsi jeden z t�ch �pinav�ch �old�k�!
	};
	Info_ClearChoices(dia_rumbold_hallo);
	Info_AddChoice(dia_rumbold_hallo,"J� nejsem nikdo.",dia_rumbold_hallo_schwanzeinziehen);
	Info_AddChoice(dia_rumbold_hallo,"Chci, abyste odsud zmizeli.",dia_rumbold_hallo_verschwindet);
	Info_AddChoice(dia_rumbold_hallo,"Jsem tvoje nejhor�� no�n� m�ra.",dia_rumbold_hallo_attack);
};

func void dia_rumbold_hallo_attack()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_Attack_15_00");	//Jsem tvoje nejhor�� no�n� m�ra.
	AI_Output(self,other,"DIA_Rumbold_HALLO_Attack_10_01");	//Jsi mrtvola!
	Info_ClearChoices(dia_rumbold_hallo);
	Info_AddChoice(dia_rumbold_hallo,DIALOG_ENDE,dia_rumbold_hallo_endattack);
};

func void dia_rumbold_hallo_verschwindet()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_verschwindet_15_00");	//Chci, abyste odsud zmizeli.
	AI_Output(self,other,"DIA_Rumbold_HALLO_verschwindet_10_01");	//Hle�me, hle�me. Tak�e ty chce�, abychom zmizeli.
	AI_Output(self,other,"DIA_Rumbold_HALLO_verschwindet_10_02");	//(v�hr��n�) A co se stane, kdy� z�staneme?
	Info_ClearChoices(dia_rumbold_hallo);
	Info_AddChoice(dia_rumbold_hallo,"Kolik v�m mus�m zaplatit, abyste se ztratili?",dia_rumbold_hallo_geld);
	Info_AddChoice(dia_rumbold_hallo,"V tom p��pad� to je naposledy, co jste ty farm��e obt�ovali.",dia_rumbold_hallo_aufsmaul);
};

func void dia_rumbold_hallo_aufsmaul()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_AufsMaul_15_00");	//V tom p��pad� to je naposledy, co jste ty farm��e obt�ovali.
	AI_Output(self,other,"DIA_Rumbold_HALLO_AufsMaul_10_01");	//Ukousl sis tro�ku v�t�� sousto, ne� dok�e� spolknout, pitom�e!
	Info_ClearChoices(dia_rumbold_hallo);
	Info_AddChoice(dia_rumbold_hallo,DIALOG_ENDE,dia_rumbold_hallo_endattack);
};

func void dia_rumbold_hallo_geld()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_geld_15_00");	//Kolik v�m mus�m zaplatit, abyste se ztratili?
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_01");	//Chce� zaplatit za Bengara? To je n�co jin�ho.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_02");	//Nech m� p�em��let. Se v�emi t�mi obrovsk�mi v�lohami n�m Bengar dlu�� je�t� 65 zlat�ch.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_03");	//Bu� vysol� prachy na d�evo, nebo se do ni�eho nem�chej.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_04");	//Tak. Ty jsi Bengar�v pokladn�, nebo co?
	Info_ClearChoices(dia_rumbold_hallo);
	Info_AddChoice(dia_rumbold_hallo,"Zbl�znil ses? To je tro�ku moc, ne?",dia_rumbold_hallo_geld_toomuch);
	if(Npc_HasItems(other,itmi_gold) >= 65)
	{
		Info_AddChoice(dia_rumbold_hallo,"Tady m� prachy a te� odsud zmizni.",dia_rumbold_hallo_geld_ok);
	};
};

func void dia_rumbold_hallo_geld_ok()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_geld_ok_15_00");	//Tady jsou va�e prachy. Te� zmizte.
	b_giveinvitems(other,self,itmi_gold,65);
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_ok_10_01");	//Mn� je jedno, kdo za Bengara zaplat�. P�eji hezk� den. (k sob�) Pitom�e!
	AI_StopProcessInfos(self);
	RUMBOLD_BEZAHLT = TRUE;
	Npc_ExchangeRoutine(self,"Start");
	if(Hlp_IsValidNpc(rick) && !Npc_IsDead(rick))
	{
		Npc_ExchangeRoutine(rick,"Start");
		AI_ContinueRoutine(rick);
	};
	if(Hlp_IsValidNpc(bengar) && !Npc_IsDead(bengar))
	{
		Npc_ExchangeRoutine(bengar,"Start");
		AI_ContinueRoutine(bengar);
	};
};

func void dia_rumbold_hallo_geld_toomuch()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_geld_TooMuch_15_00");	//Zbl�znil ses? To je tro�ku moc, ne?
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_TooMuch_10_01");	//V tom p��pad� se do ni�eho neple�!
	AI_StopProcessInfos(self);
};

func void dia_rumbold_hallo_schwanzeinziehen()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_schwanzeinziehen_15_00");	//J� nejsem nikdo.
	AI_Output(self,other,"DIA_Rumbold_HALLO_schwanzeinziehen_10_01");	//Tak mi jdi z cesty!
	AI_StopProcessInfos(self);
};

func void dia_rumbold_hallo_endattack()
{
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,1);
	if(Hlp_IsValidNpc(rick) && !c_npcisdown(rick))
	{
		b_attack(rick,other,AR_KILL,1);
	};
};


instance DIA_RUMBOLD_FIGHTNOW(C_INFO)
{
	npc = mil_335_rumbold;
	nr = 1;
	condition = dia_rumbold_fightnow_condition;
	information = dia_rumbold_fightnow_info;
	permanent = TRUE;
	description = "Nechte toho farm��e b�t!";
};


func int dia_rumbold_fightnow_condition()
{
	if(Npc_KnowsInfo(other,dia_rumbold_hallo) && (RUMBOLD_BEZAHLT == FALSE))
	{
		return TRUE;
	};
};

func void dia_rumbold_fightnow_info()
{
	AI_Output(other,self,"DIA_Rumbold_FightNow_15_00");	//Nechte toho farm��e b�t!
	AI_Output(self,other,"DIA_Rumbold_FightNow_10_01");	//M� snad n�co s u�ima, chlap�e?
	Info_ClearChoices(dia_rumbold_fightnow);
	Info_AddChoice(dia_rumbold_fightnow,DIALOG_ENDE,dia_rumbold_fightnow_endattack);
};

func void dia_rumbold_fightnow_endattack()
{
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,1);
	if(Hlp_IsValidNpc(rick) && !c_npcisdown(rick))
	{
		b_attack(rick,other,AR_KILL,1);
	};
};


instance DIA_RUMBOLD_STILLTHERE(C_INFO)
{
	npc = mil_335_rumbold;
	nr = 1;
	condition = dia_rumbold_stillthere_condition;
	information = dia_rumbold_stillthere_info;
	permanent = TRUE;
	description = "Hele, jak to, �e jsi je�t� tady!";
};


func int dia_rumbold_stillthere_condition()
{
	if(Npc_KnowsInfo(other,dia_rumbold_hallo) && (RUMBOLD_BEZAHLT == TRUE))
	{
		return TRUE;
	};
};

func void dia_rumbold_stillthere_info()
{
	AI_Output(other,self,"DIA_Rumbold_StillThere_15_00");	//Hele, jak to, �e jsi je�t� tady!
	AI_Output(self,other,"DIA_Rumbold_StillThere_10_01");	//Vy��d�m si to s v�mi!
	Info_ClearChoices(dia_rumbold_stillthere);
	Info_AddChoice(dia_rumbold_stillthere,DIALOG_ENDE,dia_rumbold_stillthere_endattack);
};

func void dia_rumbold_stillthere_endattack()
{
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,1);
	if(Hlp_IsValidNpc(rick) && !c_npcisdown(rick))
	{
		b_attack(rick,other,AR_KILL,1);
	};
};


instance DIA_RUMBOLD_PICKPOCKET(C_INFO)
{
	npc = mil_335_rumbold;
	nr = 900;
	condition = dia_rumbold_pickpocket_condition;
	information = dia_rumbold_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_rumbold_pickpocket_condition()
{
	return c_beklauen(24,45);
};

func void dia_rumbold_pickpocket_info()
{
	Info_ClearChoices(dia_rumbold_pickpocket);
	Info_AddChoice(dia_rumbold_pickpocket,DIALOG_BACK,dia_rumbold_pickpocket_back);
	Info_AddChoice(dia_rumbold_pickpocket,DIALOG_PICKPOCKET,dia_rumbold_pickpocket_doit);
};

func void dia_rumbold_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rumbold_pickpocket);
};

func void dia_rumbold_pickpocket_back()
{
	Info_ClearChoices(dia_rumbold_pickpocket);
};

