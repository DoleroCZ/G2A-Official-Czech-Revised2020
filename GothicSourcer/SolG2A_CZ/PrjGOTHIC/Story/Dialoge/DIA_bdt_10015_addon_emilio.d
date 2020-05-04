
instance DIA_ADDON_EMILIO_EXIT(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 999;
	condition = dia_addon_emilio_exit_condition;
	information = dia_addon_emilio_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_emilio_exit_condition()
{
	return TRUE;
};

func void dia_addon_emilio_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_EMILIO_PICKPOCKET(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 900;
	condition = dia_addon_emilio_pickpocket_condition;
	information = dia_addon_emilio_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_addon_emilio_pickpocket_condition()
{
	return c_beklauen(76,112);
};

func void dia_addon_emilio_pickpocket_info()
{
	Info_ClearChoices(dia_addon_emilio_pickpocket);
	Info_AddChoice(dia_addon_emilio_pickpocket,DIALOG_BACK,dia_addon_emilio_pickpocket_back);
	Info_AddChoice(dia_addon_emilio_pickpocket,DIALOG_PICKPOCKET,dia_addon_emilio_pickpocket_doit);
};

func void dia_addon_emilio_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_emilio_pickpocket);
};

func void dia_addon_emilio_pickpocket_back()
{
	Info_ClearChoices(dia_addon_emilio_pickpocket);
};


instance DIA_ADDON_BDT_10015_EMILIO_HI(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 1;
	condition = dia_addon_emilio_hi_condition;
	information = dia_addon_emilio_hi_info;
	permanent = FALSE;
	description = "Vypad� jako kop��.";
};


func int dia_addon_emilio_hi_condition()
{
	return TRUE;
};

func void dia_addon_emilio_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Hi_15_00");	//Vypad� jako kop��.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Hi_10_01");	//J� JSEM kop��. Kdy� jsem byl naposled v dole, namakal jsem se jako k��.
	if(SC_KNOWSRAVENSGOLDMINE == FALSE)
	{
		b_logentry(TOPIC_ADDON_RAVENKDW,LOGTEXT_ADDON_RAVENSGOLDMINE);
		Log_AddEntry(TOPIC_ADDON_SKLAVEN,LOGTEXT_ADDON_RAVENSGOLDMINE);
		b_logentry(TOPIC_ADDON_SCOUTBANDITS,LOG_TEXT_ADDON_SCOUTBANDITS);
	};
	SC_KNOWSRAVENSGOLDMINE = TRUE;
};


instance DIA_ADDON_BDT_10015_EMILIO_GOLD(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 2;
	condition = dia_addon_emilio_gold_condition;
	information = dia_addon_emilio_gold_info;
	permanent = FALSE;
	description = "Co se d�je se zlatem z dolu?";
};


func int dia_addon_emilio_gold_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bdt_10015_emilio_hi))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_gold_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Gold_15_00");	//Co se d�je se zlatem z dolu?
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Gold_10_01");	//Thorus ho hl�d� a pos�l� d�l.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Gold_10_02");	//Ka�d� dost�v� pouze ��st zlata - tak aby lovci a str�e neode�li s pr�zdn�ma rukama.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Gold_10_03");	//�ekl bych, �e je to v pohod�. Od t� doby, co m�me tohle pravidlo, je tu m�n� vra�d a kop��i po��d dost�vaj� v�ce ne� ti, co se tu jen poflakuj�.
};


instance DIA_ADDON_BDT_10015_EMILIO_STEIN(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 3;
	condition = dia_addon_emilio_stein_condition;
	information = dia_addon_emilio_stein_info;
	permanent = FALSE;
	description = "A ty �erven� kameny?";
};


func int dia_addon_emilio_stein_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_emilio_jetzt))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_stein_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Stein_15_00");	//A ty �erven� kameny?
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_01");	//To vymyslel Thorus s Estebanem.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_02");	//Thorus ��d� rozd�lov�n� zlata a Esteban organizuje d�ln�ky v dole.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_03");	//Samo�rejm� nechce b�hat za Thorusem poka�d�, kdy� po�le n�koho do dolu.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_04");	//Takhle mu d� jeden z t�ch �erven�ch kamen� a Thorus ho pust�. Je to jako vstupenka.
};


var int emilio_switch;

instance DIA_ADDON_EMILIO_ATTENTAT(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 4;
	condition = dia_addon_emilio_attentat_condition;
	information = dia_addon_emilio_attentat_info;
	permanent = TRUE;
	description = "Co v� o tom atent�tu?";
};


func int dia_addon_emilio_attentat_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_emilio_vonemilio) && Npc_IsDead(senyan))
	{
		return FALSE;
	}
	else if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func void dia_addon_emilio_attentat_info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_Attentat_15_00");	//Co v� o tom atent�tu?
	if(EMILIO_SWITCH == 0)
	{
		AI_Output(self,other,"DIA_Addon_Emilio_Attentat_10_01");	//(�zkustliv�) Hej, j� s t�m nic nem�m!
		EMILIO_SWITCH = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Emilio_Attentat_10_02");	//(�zkostliv�) PRANIC!!
		EMILIO_SWITCH = 0;
	};
};


instance DIA_ADDON_BDT_10015_EMILIO_SENYAN(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 1;
	condition = dia_addon_emilio_senyan_condition;
	information = dia_addon_emilio_senyan_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_emilio_senyan_condition()
{
	if(Npc_IsDead(senyan))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_senyan_info()
{
	if(SENYAN_CALLED == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_00");	//(t�zav�) �ekni mi PRO� Senyan volal: 'Pod�vejme se kohopak to tu m�me'?
		AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Senyan_15_01");	//(su�e) Nevyrovnan� ��ty.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_02");	//Tys zabil Senyana!
	};
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Senyan_15_03");	//A jako co?
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_04");	//(usp�chan�) Bez probl�mu.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_05");	//Na druhou stranu. (sarkasticky) Je to kus pr�ce pro Estebana.
	SENYAN_CONTRA = LOG_SUCCESS;
	b_logentry(TOPIC_ADDON_ESTEBAN,"Emilio nen� na Estebanov� stran�.");
};


instance DIA_ADDON_EMILIO_JETZT(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 5;
	condition = dia_addon_emilio_jetzt_condition;
	information = dia_addon_emilio_jetzt_info;
	permanent = FALSE;
	description = "Pro� nejsi v dole?";
};


func int dia_addon_emilio_jetzt_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bdt_10015_emilio_hi))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_jetzt_info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_Jetzt_15_00");	//Pro� te� nejsi v dole?
	AI_Output(self,other,"DIA_Addon_Emilio_Jetzt_10_01");	//Byl jsem v dole dost dlouho. Nyn� si pot�ebuji p�r dn� odpo�inout.
	AI_Output(self,other,"DIA_Addon_Emilio_Jetzt_10_02");	//Tedy dokud nedostanu dal�� �erven� k�men.
};


instance DIA_ADDON_EMILIO_VONEMILIO(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 6;
	condition = dia_addon_emilio_vonemilio_condition;
	information = dia_addon_emilio_vonemilio_info;
	permanent = FALSE;
	description = "Lennar mi neco o tob� �ekl ...";
};


func int dia_addon_emilio_vonemilio_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_emilio_jetzt) && Npc_KnowsInfo(other,dia_addon_lennar_attentat))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_vonemilio_info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_VonEmilio_15_00");	//Lennar mi n�co o tob� �ekl ...
	AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_01");	//Lennar? Ten chlap je idiot! To mus� uznat.
	AI_Output(other,self,"DIA_Addon_Emilio_VonEmilio_15_02");	//�ekl �es nebyl v dole od toho pokusu o atent�t.
	AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_03");	//(vystra�en�) J� ... nic nev�m!
	if(!Npc_IsDead(senyan))
	{
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_04");	//Pracuje� s Senyanem, nebo ne?
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_05");	//Oba jste se spojili s Estebanem. Sly�el jsem, co jste si pov�dali.
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_06");	//Dosud jsem s Estebanem nem�l nic spole�n�ho. Pro� bych m�l v��it jeho lidem?
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_07");	//Nech m� o samot�!
		AI_StopProcessInfos(self);
	};
	b_logentry(TOPIC_ADDON_ESTEBAN,"Emilio si mysl�, �e Lennar je idiot.");
};


instance DIA_ADDON_EMILIO_HILFMIR(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 7;
	condition = dia_addon_emilio_hilfmir_condition;
	information = dia_addon_emilio_hilfmir_info;
	permanent = FALSE;
	description = "Pomoz mi naj�t lidi, co maj� n�co spole�n�ho s atent�tem na Estebana !";
};


func int dia_addon_emilio_hilfmir_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_emilio_vonemilio) && Npc_IsDead(senyan))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_hilfmir_info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_00");	//Pomoz mi naj�t toho, kdo cht�l sp�chat ten pokus o atent�t!
	AI_Output(self,other,"DIA_Addon_Emilio_HilfMir_10_01");	//Ne! Nechci s t�m nic m�t!
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_02");	//Jestli idiot jako Lennar zjist� n�co o tv�m podivn�m chov�n�, nebude to dlouho trvat a Esteban to zjist� taky.
	AI_Output(self,other,"DIA_Addon_Emilio_HilfMir_10_03");	//(p�ekvapen�) J� ... doprdele! �eknu pouze jm�no. Nic v�c.
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_04");	//Poslouch�m.
	AI_Output(self,other,"DIA_Addon_Emilio_HilfMir_10_05");	//Huno ... b� za Hunem. M�l by n�co v�d�t.
	EMILIO_TELLALL = TRUE;
	b_logentry(TOPIC_ADDON_ESTEBAN,"Emilio nakonec �ekl jedno jm�no - Huno.");
};


instance DIA_ADDON_EMILIO_GEGENESTEBAN(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 8;
	condition = dia_addon_emilio_gegenesteban_condition;
	information = dia_addon_emilio_gegenesteban_info;
	permanent = FALSE;
	description = "Co m� proti Estebanovi?";
};


func int dia_addon_emilio_gegenesteban_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bdt_10015_emilio_senyan))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_gegenesteban_info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_GegenEsteban_15_00");	//Co m� proti Estebanovi?
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_01");	//To prase mysl� jen na pen�ze.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_02");	//Ka�d� den je n�kdo se�r�n d�ln�mi �ervy.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_03");	//Ale Esteban nechce poslat do dolu bojovn�ky.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_04");	//A pro�? Proto�e chlapi jsou sou��st� "Ravenovy str�e" a on se boj� jim n�co p�ik�zat.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_05");	//Nam�sto toho n�s rad�ji nech� zat�epat ba�korama!
};


instance DIA_ADDON_BDT_10015_EMILIO_MINE(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 9;
	condition = dia_addon_emilio_mine_condition;
	information = dia_addon_emilio_mine_info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int dia_addon_emilio_mine_condition()
{
	if((MIS_SEND_BUDDLER == LOG_RUNNING) && (PLAYER_SENTBUDDLER < 3) && (Npc_HasItems(other,itmi_addon_stone_01) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_mine_info()
{
	b_say(other,self,"$MINE_ADDON_DESCRIPTION");
	b_giveinvitems(other,self,itmi_addon_stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Mine_10_00");	//Tak, nyn� jsi tu ��f ty. Dobr�, pak to ud�l�m posv�m.
	PLAYER_SENTBUDDLER = PLAYER_SENTBUDDLER + 1;
	b_giveplayerxp(XP_ADDON_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_ADDON_EMILIO_HACKER(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 9;
	condition = dia_addon_emilio_hacker_condition;
	information = dia_addon_emilio_hacker_info;
	permanent = TRUE;
	description = "Co je nov�ho?";
};


func int dia_addon_emilio_hacker_condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_09_PICK") <= 500)
	{
		return TRUE;
	};
};

func void dia_addon_emilio_hacker_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Emilio_Hacker_15_00");	//Co je nov�ho?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Emilio_Hacker_10_01");	//Pracuju tvrd�. Dob�e, nejd�le�it�j�� v�c je, �e se nestanu �r�dlem pro �ervy.
};

