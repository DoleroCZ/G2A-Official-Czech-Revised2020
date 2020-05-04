
instance DIA_ADDON_FRANCIS_EXIT(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 999;
	condition = dia_addon_francis_exit_condition;
	information = dia_addon_francis_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_francis_exit_condition()
{
	if(GREGISBACK == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_francis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FRANCIS_FIRST(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 1;
	condition = dia_addon_francis_first_condition;
	information = dia_addon_francis_first_info;
	permanent = FALSE;
	description = "To je tv� chatr�?";
};


func int dia_addon_francis_first_condition()
{
	if((KNOWS_GREGSHUT == FALSE) && (FRANCIS_AUSGESCHISSEN == FALSE) && Npc_HasItems(self,itke_greg_addon_mis))
	{
		return TRUE;
	};
};

func void dia_addon_francis_first_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_GregsHut_15_00");	//To je tv� chatr�?
	AI_Output(self,other,"DIA_Addon_Francis_GregsHut_13_01");	//Ne, pat�� Gregovi.
	KNOWS_GREGSHUT = TRUE;
};


instance DIA_ADDON_FRANCIS_LETMEIN(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 2;
	condition = dia_addon_francis_letmein_condition;
	information = dia_addon_francis_letmein_info;
	permanent = FALSE;
	description = "Mus�m se dostat dovnit� do Gregovy chatr�e.";
};


func int dia_addon_francis_letmein_condition()
{
	if((Npc_KnowsInfo(other,dia_addon_francis_first) || (KNOWS_GREGSHUT == TRUE)) && (FRANCIS_AUSGESCHISSEN == FALSE) && Npc_HasItems(self,itke_greg_addon_mis))
	{
		return TRUE;
	};
};

func void dia_addon_francis_letmein_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_LetMeIn_15_00");	//Mus�m se dostat dovnit� do Gregovy chatr�e.
	AI_Output(self,other,"DIA_Addon_Francis_LetMeIn_13_01");	//Nikdy!
	AI_Output(self,other,"DIA_Addon_Francis_LetMeIn_13_02");	//Greg tu nen�. Zamkl jsem dve�e a ujistil se, �e nikdo nedostane n�pad se tam vloupat.
	AI_Output(self,other,"DIA_Addon_Francis_LetMeIn_13_03");	//Odje� nebo nedopadne� dob�e.
};


instance DIA_ADDON_FRANCIS_ABOUTGREG(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 3;
	condition = dia_addon_francis_aboutgreg_condition;
	information = dia_addon_francis_aboutgreg_info;
	permanent = FALSE;
	description = "Greg je tv�j ��f?";
};


func int dia_addon_francis_aboutgreg_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_francis_letmein) && (FRANCIS_AUSGESCHISSEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_francis_aboutgreg_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_AboutGreg_15_00");	//Greg je tv�j ��f?
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_01");	//Nyn� tu nen�, ale zn�m ho!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_02");	//Ka�d� n�mo�n�k, jak ��k�m, ka�d� suchozemec na tomto ostrov� zn� stra�n�ho kapit�na Grega!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_03");	//(nad�azen�) Sv��il mi zde velen�!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_04");	//Jsem zodpov�dn� za tento t�bor, kter� mi byl sv��en!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_05");	//N�kte�� ho�i si mysl�, �e si mohou d�lat, co cht�j�, kdy� tu kapit�n Greg nen�.
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_06");	//Ale budou velice p�ekvapeni, a� se Greg vr�t�.
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_07");	//�eknu mu v�e, co se zde stalo, sly��?
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_08");	//A taky v�ci, jako kdo chce vstoupit do jeho chatr�e.
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_09");	//Tak rad�i vypadni, jestli je ti �ivot mil�.
};


var int francis_bezahlt;

instance DIA_ADDON_FRANCIS_KEY(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 4;
	condition = dia_addon_francis_key_condition;
	information = dia_addon_francis_key_info;
	permanent = TRUE;
	description = "Dej mi kl�� od Gregovy chatr�e!";
};


func int dia_addon_francis_key_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_francis_letmein) && Npc_HasItems(self,itke_greg_addon_mis))
	{
		return TRUE;
	};
};

func void dia_addon_francis_key_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_15_00");	//Dej mi kl�� od Gregovy chatr�e!
	AI_Output(self,other,"DIA_Addon_Francis_Key_13_01");	//Mus� si d�lat legraci!
	Info_ClearChoices(dia_addon_francis_key);
	Info_AddChoice(dia_addon_francis_key,"Pop�em��l�m o tom...",dia_addon_francis_key_back);
	Info_AddChoice(dia_addon_francis_key,"D�m ti 2000 zlata!",dia_addon_francis_key_2000gold);
	Info_AddChoice(dia_addon_francis_key,"D�m ti 1000 zlata!",dia_addon_francis_key_1000gold);
};

func void dia_addon_francis_key_back()
{
	Info_ClearChoices(dia_addon_francis_key);
};

func void dia_addon_francis_key_1000gold()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_1000Gold_15_00");	//D�m ti 1000 zlata!
	AI_Output(self,other,"DIA_Addon_Francis_Key_1000Gold_13_01");	//To je trochu m�lo za zradu kapit�na, nemysl�?
	AI_Output(self,other,"DIA_Addon_Francis_Key_1000Gold_13_02");	//D�vej si v�c pozor, co ��k�! Jinak bych ti byl nucen d�t asi po��dn� v�prask!
};

func void dia_addon_francis_key_2000gold()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_2000Gold_15_00");	//D�m ti 2000 zlata!
	if(Npc_HasItems(other,itmi_gold) >= 2000)
	{
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_01");	//Chlape, ty po mn� ��d� vzpouru!
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_02");	//(k sob�) Ale kdy� se nad t�m zamysl�m ...
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_03");	//Ah, ruku na to, nikdo na to nep�ijde.
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_04");	//Tu je kl��!
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_05");	//Ale rychle, dokud se Greg nevr�til! A ani slovo ostatn�m, sly��?!
		b_giveinvitems(other,self,itmi_gold,2000);
		b_giveinvitems(self,other,itke_greg_addon_mis,1);
		FRANCIS_BEZAHLT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_FrancisNotEnoughGold_13_05");	//(sm�je se) Ha! Ty nem� tolik pen�z!
	};
	Info_ClearChoices(dia_addon_francis_key);
};


instance DIA_ADDON_FRANCIS_AUFSMAUL(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 5;
	condition = dia_addon_francis_aufsmaul_condition;
	information = dia_addon_francis_aufsmaul_info;
	permanent = TRUE;
	description = "Dob�e, pod�v�me se, jak na tom jsi.";
};


func int dia_addon_francis_aufsmaul_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_francis_letmein) && Npc_HasItems(self,itke_greg_addon_mis))
	{
		return TRUE;
	};
};

func void dia_addon_francis_aufsmaul_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_AufsMaul_15_00");	//Dob�e, pod�v�me se, jak na tom jsi.
	AI_Output(self,other,"DIA_Addon_Francis_AufsMaul_13_01");	//(pronikav�) Co? J� jsem tady kapit�n!
	AI_Output(self,other,"DIA_Addon_Francis_AufsMaul_13_02");	//J� t� nau��m zp�sob�m, ty suchozemsk� kryso!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ADDON_FRANCIS_BUCH(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 5;
	condition = dia_addon_francis_buch_condition;
	information = dia_addon_francis_buch_info;
	permanent = TRUE;
	description = "Na�el jsem tvoje mal� doup�...";
};


func int dia_addon_francis_buch_condition()
{
	if(Npc_HasItems(other,itwr_addon_francisabrechnung_mis))
	{
		return TRUE;
	};
};

func void dia_addon_francis_buch_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_Business_15_03");	//Na�el jsem tvoje mal� doup�. Tv�j poklad a v�platn� listinu. To je tv� kn�e�ka, nebo ne?
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_01");	//Er ... Nikdy jsem tu kn�ku nevid�l ...
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_02");	//A ... er ... a kdyby to bylo moje ...
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_03");	//A ty si skute�n� mysl�, �e ho�i uv��� n�jak�mu za�loutl�mu kusu pap�ru?
	AI_Output(other,self,"DIA_Addon_Francis_Key_Business_15_01");	//Ty jsi je o�idil o ��st jejich pod�lu!
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_04");	//Er ... Po�kej ...
	if(Npc_HasItems(self,itke_greg_addon_mis))
	{
		if(Npc_KnowsInfo(other,dia_addon_francis_letmein))
		{
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_05");	//(ti�e) Necht�ls kl�� od Gregovy chatr�e ...
		};
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_06");	//D�m ti kl�� ke Gregov� chatr�i!
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_07");	//M��e� tam vz�t mnoho zaj�mav�ch v�c�...
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_08");	//(rozru�en�) Ale d� mi tu knihu a bude� o tom ml�et, jasn�?
		b_giveinvitems(other,self,itwr_addon_francisabrechnung_mis,1);
		b_giveinvitems(self,other,itke_greg_addon_mis,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_09");	//Jen neud�lej nic hloup�ho!
		if((FRANCIS_BEZAHLT == TRUE) && (Npc_HasItems(self,itmi_gold) >= 2000))
		{
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_10");	//Tady m� 2000 zlata!
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_11");	//A 500 nav�c.
			b_giveinvitems(self,other,itmi_gold,2500);
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_12");	//Tady m� 500 zlata!
			b_giveinvitems(self,other,itmi_gold,500);
		};
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_13");	//(na�tvan�) A nyn� m� nech ...
		b_giveinvitems(other,self,itwr_addon_francisabrechnung_mis,1);
	};
	AI_StopProcessInfos(self);
};


instance DIA_FRANCIS_PICKPOCKET(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 900;
	condition = dia_francis_pickpocket_condition;
	information = dia_francis_pickpocket_info;
	permanent = TRUE;
	description = "(Ukr�st tento kl�� bude jednoduch�.)";
};


func int dia_francis_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_greg_addon_mis) >= 1) && (other.attribute[ATR_DEXTERITY] >= (40 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_francis_pickpocket_info()
{
	Info_ClearChoices(dia_francis_pickpocket);
	Info_AddChoice(dia_francis_pickpocket,DIALOG_BACK,dia_francis_pickpocket_back);
	Info_AddChoice(dia_francis_pickpocket,DIALOG_PICKPOCKET,dia_francis_pickpocket_doit);
};

func void dia_francis_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		b_giveinvitems(self,other,itke_greg_addon_mis,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		Info_ClearChoices(dia_francis_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
	Info_ClearChoices(dia_francis_pickpocket);
};

func void dia_francis_pickpocket_back()
{
	Info_ClearChoices(dia_francis_pickpocket);
};


instance DIA_FRANCIS_AUSGESCHISSEN(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 900;
	condition = dia_francis_ausgeschissen_condition;
	information = dia_francis_ausgeschissen_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_francis_ausgeschissen_condition()
{
	if((FRANCIS_AUSGESCHISSEN == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_francis_ausgeschissen_info()
{
	if(!Npc_IsDead(greg))
	{
		AI_Output(self,other,"DIA_Addon_Francis_Ausgeschissen_13_00");	//(nahlas) Proto�e by m� Greg  jinak nechal k�cet stromy do posedn�ho zbyl�ho ke���ku!
	};
	AI_Output(self,other,"DIA_Addon_Francis_Ausgeschissen_13_01");	//Ztra� se!
	AI_StopProcessInfos(self);
};

