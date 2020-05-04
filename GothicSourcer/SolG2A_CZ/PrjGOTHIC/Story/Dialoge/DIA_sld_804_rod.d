
instance DIA_ROD_EXIT(C_INFO)
{
	npc = sld_804_rod;
	nr = 999;
	condition = dia_rod_exit_condition;
	information = dia_rod_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rod_exit_condition()
{
	return TRUE;
};

func void dia_rod_exit_info()
{
	AI_EquipBestMeleeWeapon(self);
	AI_StopProcessInfos(self);
};


instance DIA_ROD_HELLO(C_INFO)
{
	npc = sld_804_rod;
	nr = 1;
	condition = dia_rod_hello_condition;
	information = dia_rod_hello_info;
	permanent = FALSE;
	description = "Jak se vede?";
};


func int dia_rod_hello_condition()
{
	return TRUE;
};

func void dia_rod_hello_info()
{
	AI_Output(other,self,"DIA_Rod_Hello_15_00");	//Jak se vede?
	if(other.guild != GIL_SLD)
	{
		AI_Output(self,other,"DIA_Rod_Hello_06_01");	//(pohrdav�) Co ode mne chce�, blbe�ku?
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Rod_Hello_06_02");	//Nemohli pro tebe naj�t v kl�te�e m�sto?
		};
	};
};


var int rod_schwachgesagt;

instance DIA_ROD_WANNALEARN(C_INFO)
{
	npc = sld_804_rod;
	nr = 2;
	condition = dia_rod_wannalearn_condition;
	information = dia_rod_wannalearn_info;
	permanent = TRUE;
	description = "Nem��e� m� nau�it, jak zach�zet s obouru�n�mi zbran�mi?";
};


func int dia_rod_wannalearn_condition()
{
	if(ROD_TEACH2H == FALSE)
	{
		return TRUE;
	};
};

func void dia_rod_wannalearn_info()
{
	AI_Output(other,self,"DIA_Rod_WannaLearn_15_00");	//Nem��e� m� nau�it, jak zach�zet s obouru�n�mi zbran�mi?
	if((ROD_WETTEGEWONNEN == TRUE) || (self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_01");	//Nejsem �patn� bojovn�k, ale to neznamen�, �e jsem dobr� u�itel.
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_02");	//Ale i tak ti m��u uk�zat z�klady boje s obouru�n�mi zbran�mi.
		if(Npc_HasItems(self,itmw_2h_rod) == 0)
		{
			AI_Output(self,other,"DIA_Rod_WannaLearn_06_03");	//Tak to jo, pokud mi vr�t� m�j me�.
		}
		else
		{
			ROD_TEACH2H = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_04");	//Poslouchej, chlap�e. K tomu, abys mohl nosit obouru�n� zbra�, pot�ebuje� m�t velkou s�lu.
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_05");	//Pro� se neodplaz� na pastvinu a nezahraje� si tam s ove�kama chod� pe�ek okolo?
		ROD_SCHWACHGESAGT = TRUE;
	};
};


var int rod_merke_2h;

instance DIA_ROD_TEACH(C_INFO)
{
	npc = sld_804_rod;
	nr = 3;
	condition = dia_rod_teach_condition;
	information = dia_rod_teach_info;
	permanent = TRUE;
	description = "Chci si zdokonalit sv� bojov� dovednosti v obouru�n�ch zbran�ch!";
};


func int dia_rod_teach_condition()
{
	if(ROD_TEACH2H == TRUE)
	{
		return TRUE;
	};
};

func void dia_rod_teach_info()
{
	AI_Output(other,self,"DIA_Rod_Teach_15_00");	//Chci si zdokonalit sv� bojov� dovednosti v obouru�n�ch zbran�ch!
	ROD_MERKE_2H = other.hitchance[NPC_TALENT_2H];
	Info_ClearChoices(dia_rod_teach);
	Info_AddChoice(dia_rod_teach,DIALOG_BACK,dia_rod_teach_back);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_rod_teach_2h_1);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_rod_teach_2h_5);
};

func void dia_rod_teach_back()
{
	if(ROD_MERKE_2H < other.hitchance[NPC_TALENT_2H])
	{
		AI_Output(self,other,"DIA_Rod_Teach_BACK_06_00");	//U� se za��n� lep�it.
	};
	Info_ClearChoices(dia_rod_teach);
};

func void dia_rod_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,90);
	Info_ClearChoices(dia_rod_teach);
	Info_AddChoice(dia_rod_teach,DIALOG_BACK,dia_rod_teach_back);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_rod_teach_2h_1);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_rod_teach_2h_5);
};

func void dia_rod_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,90);
	Info_ClearChoices(dia_rod_teach);
	Info_AddChoice(dia_rod_teach,DIALOG_BACK,dia_rod_teach_back);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_rod_teach_2h_1);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_rod_teach_2h_5);
};


instance DIA_ROD_WANNAJOIN(C_INFO)
{
	npc = sld_804_rod;
	nr = 4;
	condition = dia_rod_wannajoin_condition;
	information = dia_rod_wannajoin_info;
	permanent = TRUE;
	description = "Chci se p�idat k �oldn���m!";
};


func int dia_rod_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_rod_wannajoin_info()
{
	AI_Output(other,self,"DIA_Rod_WannaJoin_15_00");	//Chci se p�idat k �oldn���m!
	if(Npc_HasItems(self,itmw_2h_rod) == 0)
	{
		AI_Output(self,other,"DIA_Rod_WannaJoin_06_01");	//Tak�e co kdybys mi pro za��tek vr�til zp�tky m�j me�, co?
	}
	else if((self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (ROD_WETTEGEWONNEN == TRUE))
	{
		if(self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_02");	//Fajn. Nem�m nic proti tomu.
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_03");	//M��e� bojovat a to je to, co se po��t�.
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_04");	//V�t�ina hoch� tady si z men��ch �arv�tek mezi p��teli ned�l� t�kou hlavu. Na to si brzy zvykne�.
		}
		else
		{
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_05");	//No dob�e, m� po��dn� me�. Zbytek se nau��.
		};
		AI_Output(self,other,"DIA_Rod_WannaJoin_06_06");	//Co se m� t��e, tak j� t� beru.
		b_logentry(TOPIC_SLDRESPEKT,"Budu-li se cht�t p�ipojit k �oldn���m, Rod se za m� p�imluv�.");
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_WannaJoin_06_07");	//Tady nen� m�sto pro ��dn�ho stra�pytla!
		ROD_SCHWACHGESAGT = TRUE;
	};
};


instance DIA_ROD_DUELL(C_INFO)
{
	npc = sld_804_rod;
	nr = 6;
	condition = dia_rod_duell_condition;
	information = dia_rod_duell_info;
	permanent = TRUE;
	description = "Vypad� to, �e ti budu muset uk�zat n�kolik trik�, �e jo?";
};


func int dia_rod_duell_condition()
{
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		if((ROD_WETTEGEWONNEN == FALSE) && (ROD_SCHWACHGESAGT == TRUE))
		{
			return TRUE;
		};
		if(MIS_JARVIS_SLDKO == LOG_RUNNING)
		{
			return TRUE;
		};
	};
};

func void dia_rod_duell_info()
{
	AI_Output(other,self,"DIA_Rod_Duell_15_00");	//Vypad� to, �e ti budu muset uk�zat n�kolik trik�, �e jo?
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE)
	{
		AI_Output(self,other,"DIA_Rod_Duell_06_01");	//No tak to zkus!
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_Duell_06_02");	//Ty se tohle st�� nau��!
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ROD_STARKGENUG(C_INFO)
{
	npc = sld_804_rod;
	nr = 5;
	condition = dia_rod_starkgenug_condition;
	information = dia_rod_starkgenug_info;
	permanent = FALSE;
	description = "Jsem dost silnej!";
};


func int dia_rod_starkgenug_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (ROD_WETTEGEWONNEN == FALSE) && (ROD_SCHWACHGESAGT == TRUE))
	{
		return TRUE;
	};
};

func void dia_rod_starkgenug_info()
{
	AI_Output(other,self,"DIA_Rod_StarkGenug_15_00");	//Jsem dost silnej!
	AI_Output(self,other,"DIA_Rod_StarkGenug_06_01");	//Blbost! Ty bys nemohl uzvednout dokonce ani me�, jako je ten m�j!
	Log_CreateTopic(TOPIC_RODWETTE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RODWETTE,LOG_RUNNING);
	b_logentry(TOPIC_RODWETTE,"�oldn�� Rod si mysl�, �e nedok�u uzvednout jeho me�.");
};


instance DIA_ROD_BINSTARKGENUG(C_INFO)
{
	npc = sld_804_rod;
	nr = 5;
	condition = dia_rod_binstarkgenug_condition;
	information = dia_rod_binstarkgenug_info;
	permanent = FALSE;
	description = "�ekl jsem, �e JSEM dost silnej!";
};


func int dia_rod_binstarkgenug_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (ROD_WETTEGEWONNEN == FALSE) && Npc_KnowsInfo(other,dia_rod_starkgenug))
	{
		return TRUE;
	};
};

func void dia_rod_binstarkgenug_info()
{
	AI_Output(other,self,"DIA_Rod_BINStarkGenug_15_00");	//�ekl jsem, �e JSEM dost silnej!
	AI_Output(self,other,"DIA_Rod_BINStarkGenug_06_01");	//Chach�a, asi um�u sm�chy. Chce� se vsadit?
};


var int rod_wettegewonnen;
var int rod_wetteangenommen;

instance DIA_ROD_WETTE(C_INFO)
{
	npc = sld_804_rod;
	nr = 5;
	condition = dia_rod_wette_condition;
	information = dia_rod_wette_info;
	permanent = TRUE;
	description = "Vsad�m se, �e zvl�dnu tv�j me�!";
};


func int dia_rod_wette_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (ROD_WETTEGEWONNEN == FALSE) && Npc_KnowsInfo(other,dia_rod_binstarkgenug) && (Npc_HasItems(self,itmw_2h_rod) > 0) && (ROD_WETTEANGENOMMEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_rod_wette_info()
{
	AI_Output(other,self,"DIA_Rod_Wette_15_00");	//Vsad�m se, �e zvl�dnu tv�j me�!
	AI_Output(self,other,"DIA_Rod_Wette_06_01");	//Opravdu? Hmm... (p�em��l�) O kolik se vsad�me?
	AI_Output(self,other,"DIA_Rod_Wette_06_02");	//No vypad�, jako ubohej za��te�n�k. Vsa�me se o 30 zlat�ch! M� v�bec tolik?
	Info_ClearChoices(dia_rod_wette);
	Info_AddChoice(dia_rod_wette,"Ne.",dia_rod_wette_no);
	Info_AddChoice(dia_rod_wette,"Jasn�.",dia_rod_wette_yes);
	b_logentry(TOPIC_RODWETTE,"Rod se se mnou vsadil o 30 zla��k�, �e neuzvednu jeho me�.");
};

func void dia_rod_wette_no()
{
	AI_Output(other,self,"DIA_Rod_Wette_No_15_00");	//Ne.
	AI_Output(self,other,"DIA_Rod_Wette_No_06_01");	//No, tak vypadni.
	Info_ClearChoices(dia_rod_wette);
};

func void dia_rod_wette_yes()
{
	AI_Output(other,self,"DIA_Rod_Wette_Yes_15_00");	//Jasn�.
	AI_Output(self,other,"DIA_Rod_Wette_Yes_06_01");	//Nejd��v se kouknu...
	if(b_giveinvitems(other,self,itmi_gold,30))
	{
		ROD_WETTEANGENOMMEN = TRUE;
		AI_Output(other,self,"DIA_Rod_Wette_Yes_15_02");	//Tady jsou!
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_03");	//(�kodolib�) V po��dku, pod�v�me se tedy jak si silnej...
		b_giveinvitems(self,other,itmw_2h_rod,1);
		if(other.attribute[ATR_STRENGTH] >= 30)
		{
			AI_UnequipWeapons(other);
			AI_EquipBestMeleeWeapon(other);
			AI_ReadyMeleeWeapon(other);
			AI_Output(other,self,"DIA_Rod_Wette_Yes_15_04");	//Tak co ��k� na moj� s�lu?!
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_05");	//(zmaten�) Vypad� to, �es m� dostal.
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_06");	//Tohle sem v�bec ne�ekal. Opravdu nevypad� na to, �e m� v sob� tolik s�ly.
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_07");	//No - �ekl bych, �e jsem pr�v� p�i�el o 30 zlat�ch. Tady jsou.
			b_giveinvitems(self,other,itmi_gold,60);
			ROD_WETTEGEWONNEN = TRUE;
			b_giveplayerxp(XP_ROD);
		}
		else
		{
			AI_Output(other,self,"DIA_Rod_Wette_Yes_15_08");	//Tuhle zbra� neudr��m.
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_09");	//(sm�je se) To ti p�ece ��k�m!
		};
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_10");	//A te� mi dej zp�tky m�j me�.
		Info_ClearChoices(dia_rod_wette);
		Info_AddChoice(dia_rod_wette,"Mysl�m, �e ne.",dia_rod_wette_keepit);
		Info_AddChoice(dia_rod_wette,"Tum�.",dia_rod_wette_giveback);
	}
	else
	{
		AI_Output(other,self,"DIA_Rod_Wette_Yes_15_11");	//Kam jsem ho tak mohl d�t...
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_12");	//To d�v� smysl. Vra� se zp�tky a� bude� m�t pen�ze na s�zku.
		Info_ClearChoices(dia_rod_wette);
	};
};

func void dia_rod_wette_giveback()
{
	AI_RemoveWeapon(other);
	AI_Output(other,self,"DIA_Rod_Wette_GiveBack_15_00");	//Tum�.
	Info_ClearChoices(dia_rod_wette);
	Info_AddChoice(dia_rod_wette,"(D�t mu zbra�.)",dia_rod_wette_giveback2);
};

func void dia_rod_wette_giveback2()
{
	b_giveinvitems(other,self,itmw_2h_rod,1);
	if(ROD_WETTEGEWONNEN == FALSE)
	{
		AI_Output(self,other,"DIA_Rod_Wette_GiveBack_06_01");	//Nakonec nejsi stejn� nic jin�ho ne� stra�pytel!
	};
	Info_ClearChoices(dia_rod_wette);
};

func void dia_rod_wette_keepit()
{
	AI_Output(other,self,"DIA_Rod_Wette_KeepIt_15_00");	//Mysl�m, �e ne.
	AI_Output(self,other,"DIA_Rod_Wette_KeepIt_06_01");	//(v�hru�n�) Co to bylo?
	AI_Output(other,self,"DIA_Rod_Wette_KeepIt_15_02");	//Mysl�m, �e si ho ponech�m je�t� o trochu d�le.
	AI_Output(self,other,"DIA_Rod_Wette_KeepIt_06_03");	//Po�kej, ty parchante!
	Info_ClearChoices(dia_rod_wette);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


var int rod_schwertxpgiven;

instance DIA_ROD_GIVEITBACK(C_INFO)
{
	npc = sld_804_rod;
	nr = 7;
	condition = dia_rod_giveitback_condition;
	information = dia_rod_giveitback_info;
	permanent = TRUE;
	description = "Tady m� me� zp�tky!";
};


func int dia_rod_giveitback_condition()
{
	if(Npc_HasItems(other,itmw_2h_rod) > 0)
	{
		return TRUE;
	};
};

func void dia_rod_giveitback_info()
{
	b_giveinvitems(other,self,itmw_2h_rod,1);
	AI_Output(other,self,"DIA_Rod_GiveItBack_15_00");	//Tady m� me� zp�tky!
	AI_Output(self,other,"DIA_Rod_GiveItBack_06_01");	//Byl nejvy��� �as!
	if(ROD_SCHWERTXPGIVEN == FALSE)
	{
		b_giveplayerxp(XP_AMBIENT);
		ROD_SCHWERTXPGIVEN = TRUE;
	};
};


instance DIA_ROD_PERM(C_INFO)
{
	npc = sld_804_rod;
	nr = 1;
	condition = dia_rod_perm_condition;
	information = dia_rod_perm_info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int dia_rod_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_rod_hello))
	{
		return TRUE;
	};
};

func void dia_rod_perm_info()
{
	AI_Output(other,self,"DIA_Rod_PERM_15_00");	//Jak se vede?
	if(KAPITEL <= 2)
	{
		if(other.guild == GIL_NONE)
		{
			if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (ROD_WETTEGEWONNEN == FALSE))
			{
				AI_Output(self,other,"DIA_Rod_PERM_06_01");	//To t� nemus� zaj�mat, padavko.
				ROD_SCHWACHGESAGT = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Rod_PERM_06_02");	//Jsem zv�dav�, jestli ti dovol� se k n�m p�idat.
			};
		}
		else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
		{
			AI_Output(self,other,"DIA_Rod_PERM_06_03");	//Jsi jedn�m z n�s, chlap�e. Tak se n�jak dohodneme.
		}
		else
		{
			AI_Output(self,other,"DIA_Rod_PERM_06_04");	//Ty sem nepat��, rad�i by ses m�l j�t poflakovat n�kam jinam!
		};
	};
	if(KAPITEL >= 3)
	{
		AI_Output(self,other,"DIA_Rod_PERM_06_05");	//Jestli v�echny ty pov�da�ky o drac�ch jsou skute�n� pravdiv�, m�li bychom d�t p�r lid� dohromady a j�t ty mrchy pozab�jet!
	};
};


instance DIA_RODSLD_PICKPOCKET(C_INFO)
{
	npc = sld_804_rod;
	nr = 900;
	condition = dia_rodsld_pickpocket_condition;
	information = dia_rodsld_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_rodsld_pickpocket_condition()
{
	return c_beklauen(15,35);
};

func void dia_rodsld_pickpocket_info()
{
	Info_ClearChoices(dia_rodsld_pickpocket);
	Info_AddChoice(dia_rodsld_pickpocket,DIALOG_BACK,dia_rodsld_pickpocket_back);
	Info_AddChoice(dia_rodsld_pickpocket,DIALOG_PICKPOCKET,dia_rodsld_pickpocket_doit);
};

func void dia_rodsld_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rodsld_pickpocket);
};

func void dia_rodsld_pickpocket_back()
{
	Info_ClearChoices(dia_rodsld_pickpocket);
};

