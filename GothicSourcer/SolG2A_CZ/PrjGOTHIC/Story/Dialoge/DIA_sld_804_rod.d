
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
		AI_Output(self,other,"DIA_Rod_Hello_06_01");	//(pohrdavì) Co ode mne chceš, blbeèku?
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Rod_Hello_06_02");	//Nemohli pro tebe najít v klášteøe místo?
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
	description = "Nemùžeš mì nauèit, jak zacházet s obouruèními zbranìmi?";
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
	AI_Output(other,self,"DIA_Rod_WannaLearn_15_00");	//Nemùžeš mì nauèit, jak zacházet s obouruèními zbranìmi?
	if((ROD_WETTEGEWONNEN == TRUE) || (self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_01");	//Nejsem špatný bojovník, ale to neznamená, že jsem dobrý uèitel.
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_02");	//Ale i tak ti mùžu ukázat základy boje s obouruèními zbranìmi.
		if(Npc_HasItems(self,itmw_2h_rod) == 0)
		{
			AI_Output(self,other,"DIA_Rod_WannaLearn_06_03");	//Tak to jo, pokud mi vrátíš mùj meè.
		}
		else
		{
			ROD_TEACH2H = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_04");	//Poslouchej, chlapèe. K tomu, abys mohl nosit obouruèní zbraò, potøebuješ mít velkou sílu.
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_05");	//Proè se neodplazíš na pastvinu a nezahraješ si tam s oveèkama chodí pešek okolo?
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
	description = "Chci si zdokonalit své bojové dovednosti v obouruèních zbraních!";
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
	AI_Output(other,self,"DIA_Rod_Teach_15_00");	//Chci si zdokonalit své bojové dovednosti v obouruèních zbraních!
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
		AI_Output(self,other,"DIA_Rod_Teach_BACK_06_00");	//Už se zaèínáš lepšit.
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
	description = "Chci se pøidat k žoldnéøùm!";
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
	AI_Output(other,self,"DIA_Rod_WannaJoin_15_00");	//Chci se pøidat k žoldnéøùm!
	if(Npc_HasItems(self,itmw_2h_rod) == 0)
	{
		AI_Output(self,other,"DIA_Rod_WannaJoin_06_01");	//Takže co kdybys mi pro zaèátek vrátil zpátky mùj meè, co?
	}
	else if((self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (ROD_WETTEGEWONNEN == TRUE))
	{
		if(self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_02");	//Fajn. Nemám nic proti tomu.
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_03");	//Mùžeš bojovat a to je to, co se poèítá.
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_04");	//Vìtšina hochù tady si z menších šarvátek mezi pøáteli nedìlá tìžkou hlavu. Na to si brzy zvykneš.
		}
		else
		{
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_05");	//No dobøe, máš poøádný meè. Zbytek se nauèíš.
		};
		AI_Output(self,other,"DIA_Rod_WannaJoin_06_06");	//Co se mì týèe, tak já tì beru.
		b_logentry(TOPIC_SLDRESPEKT,"Budu-li se chtít pøipojit k žoldnéøùm, Rod se za mì pøimluví.");
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_WannaJoin_06_07");	//Tady není místo pro žádnýho strašpytla!
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
	description = "Vypadá to, že ti budu muset ukázat nìkolik trikù, že jo?";
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
	AI_Output(other,self,"DIA_Rod_Duell_15_00");	//Vypadá to, že ti budu muset ukázat nìkolik trikù, že jo?
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE)
	{
		AI_Output(self,other,"DIA_Rod_Duell_06_01");	//No tak to zkus!
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_Duell_06_02");	//Ty se tohle stìží nauèíš!
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
	AI_Output(self,other,"DIA_Rod_StarkGenug_06_01");	//Blbost! Ty bys nemohl uzvednout dokonce ani meè, jako je ten mùj!
	Log_CreateTopic(TOPIC_RODWETTE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RODWETTE,LOG_RUNNING);
	b_logentry(TOPIC_RODWETTE,"Žoldnéø Rod si myslí, že nedokážu uzvednout jeho meè.");
};


instance DIA_ROD_BINSTARKGENUG(C_INFO)
{
	npc = sld_804_rod;
	nr = 5;
	condition = dia_rod_binstarkgenug_condition;
	information = dia_rod_binstarkgenug_info;
	permanent = FALSE;
	description = "Øekl jsem, že JSEM dost silnej!";
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
	AI_Output(other,self,"DIA_Rod_BINStarkGenug_15_00");	//Øekl jsem, že JSEM dost silnej!
	AI_Output(self,other,"DIA_Rod_BINStarkGenug_06_01");	//Chacháa, asi umøu smíchy. Chceš se vsadit?
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
	description = "Vsadím se, že zvládnu tvùj meè!";
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
	AI_Output(other,self,"DIA_Rod_Wette_15_00");	//Vsadím se, že zvládnu tvùj meè!
	AI_Output(self,other,"DIA_Rod_Wette_06_01");	//Opravdu? Hmm... (pøemýšlí) O kolik se vsadíme?
	AI_Output(self,other,"DIA_Rod_Wette_06_02");	//No vypadáš, jako ubohej zaèáteèník. Vsaïme se o 30 zlatých! Máš vùbec tolik?
	Info_ClearChoices(dia_rod_wette);
	Info_AddChoice(dia_rod_wette,"Ne.",dia_rod_wette_no);
	Info_AddChoice(dia_rod_wette,"Jasnì.",dia_rod_wette_yes);
	b_logentry(TOPIC_RODWETTE,"Rod se se mnou vsadil o 30 zlaákù, že neuzvednu jeho meè.");
};

func void dia_rod_wette_no()
{
	AI_Output(other,self,"DIA_Rod_Wette_No_15_00");	//Ne.
	AI_Output(self,other,"DIA_Rod_Wette_No_06_01");	//No, tak vypadni.
	Info_ClearChoices(dia_rod_wette);
};

func void dia_rod_wette_yes()
{
	AI_Output(other,self,"DIA_Rod_Wette_Yes_15_00");	//Jasnì.
	AI_Output(self,other,"DIA_Rod_Wette_Yes_06_01");	//Nejdøív se kouknu...
	if(b_giveinvitems(other,self,itmi_gold,30))
	{
		ROD_WETTEANGENOMMEN = TRUE;
		AI_Output(other,self,"DIA_Rod_Wette_Yes_15_02");	//Tady jsou!
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_03");	//(škodolibì) V poøádku, podíváme se tedy jak si silnej...
		b_giveinvitems(self,other,itmw_2h_rod,1);
		if(other.attribute[ATR_STRENGTH] >= 30)
		{
			AI_UnequipWeapons(other);
			AI_EquipBestMeleeWeapon(other);
			AI_ReadyMeleeWeapon(other);
			AI_Output(other,self,"DIA_Rod_Wette_Yes_15_04");	//Tak co øíkáš na mojí sílu?!
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_05");	//(zmatený) Vypadá to, žes mì dostal.
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_06");	//Tohle sem vùbec neèekal. Opravdu nevypadáš na to, že máš v sobì tolik síly.
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_07");	//No - øekl bych, že jsem právì pøišel o 30 zlatých. Tady jsou.
			b_giveinvitems(self,other,itmi_gold,60);
			ROD_WETTEGEWONNEN = TRUE;
			b_giveplayerxp(XP_ROD);
		}
		else
		{
			AI_Output(other,self,"DIA_Rod_Wette_Yes_15_08");	//Tuhle zbraò neudržím.
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_09");	//(smìje se) To ti pøece øíkám!
		};
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_10");	//A teï mi dej zpátky mùj meè.
		Info_ClearChoices(dia_rod_wette);
		Info_AddChoice(dia_rod_wette,"Myslím, že ne.",dia_rod_wette_keepit);
		Info_AddChoice(dia_rod_wette,"Tumáš.",dia_rod_wette_giveback);
	}
	else
	{
		AI_Output(other,self,"DIA_Rod_Wette_Yes_15_11");	//Kam jsem ho tak mohl dát...
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_12");	//To dává smysl. Vra se zpátky až budeš mít peníze na sázku.
		Info_ClearChoices(dia_rod_wette);
	};
};

func void dia_rod_wette_giveback()
{
	AI_RemoveWeapon(other);
	AI_Output(other,self,"DIA_Rod_Wette_GiveBack_15_00");	//Tumáš.
	Info_ClearChoices(dia_rod_wette);
	Info_AddChoice(dia_rod_wette,"(Dát mu zbraò.)",dia_rod_wette_giveback2);
};

func void dia_rod_wette_giveback2()
{
	b_giveinvitems(other,self,itmw_2h_rod,1);
	if(ROD_WETTEGEWONNEN == FALSE)
	{
		AI_Output(self,other,"DIA_Rod_Wette_GiveBack_06_01");	//Nakonec nejsi stejnì nic jinýho než strašpytel!
	};
	Info_ClearChoices(dia_rod_wette);
};

func void dia_rod_wette_keepit()
{
	AI_Output(other,self,"DIA_Rod_Wette_KeepIt_15_00");	//Myslím, že ne.
	AI_Output(self,other,"DIA_Rod_Wette_KeepIt_06_01");	//(výhružnì) Co to bylo?
	AI_Output(other,self,"DIA_Rod_Wette_KeepIt_15_02");	//Myslím, že si ho ponechám ještì o trochu déle.
	AI_Output(self,other,"DIA_Rod_Wette_KeepIt_06_03");	//Poèkej, ty parchante!
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
	description = "Tady máš meè zpátky!";
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
	AI_Output(other,self,"DIA_Rod_GiveItBack_15_00");	//Tady máš meè zpátky!
	AI_Output(self,other,"DIA_Rod_GiveItBack_06_01");	//Byl nejvyšší èas!
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
				AI_Output(self,other,"DIA_Rod_PERM_06_01");	//To tì nemusí zajímat, padavko.
				ROD_SCHWACHGESAGT = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Rod_PERM_06_02");	//Jsem zvìdavý, jestli ti dovolí se k nám pøidat.
			};
		}
		else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
		{
			AI_Output(self,other,"DIA_Rod_PERM_06_03");	//Jsi jedním z nás, chlapèe. Tak se nìjak dohodneme.
		}
		else
		{
			AI_Output(self,other,"DIA_Rod_PERM_06_04");	//Ty sem nepatøíš, radši by ses mìl jít poflakovat nìkam jinam!
		};
	};
	if(KAPITEL >= 3)
	{
		AI_Output(self,other,"DIA_Rod_PERM_06_05");	//Jestli všechny ty povídaèky o dracích jsou skuteènì pravdivé, mìli bychom dát pár lidí dohromady a jít ty mrchy pozabíjet!
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

